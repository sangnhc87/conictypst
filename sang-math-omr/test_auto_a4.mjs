import assert from 'node:assert/strict';
import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
try {
    const page = await browser.newPage();
    await page.setViewport({ width: 390, height: 844, deviceScaleFactor: 2, isMobile: true, hasTouch: true });
    page.on('pageerror', error => console.error('Page error:', error.message));
    await page.goto('http://localhost:8765/', { waitUntil: 'domcontentloaded', timeout: 60000 });
    await page.waitForFunction(() => window.OmrEngine?.isOpenCvLoaded && window.OmrA4Scanner,
        { timeout: 60000 });
    for (const filename of ['ds-12-1.png', '12-4-6ngang-1.png']) {
        const result = await page.evaluate(async name => {
            const image = new Image();
            image.src = `./templates/${name}`;
            await image.decode();
            const portrait = image.height > image.width;
            const width = portrait ? 900 : 1200, height = portrait ? 1200 : 900;
            const frame = document.createElement('canvas');
            frame.width = width; frame.height = height;
            const source = cv.imread(image);
            const target = new cv.Mat(height, width, cv.CV_8UC4,
                new cv.Scalar(38, 38, 38, 255));
            const margin = 80;
            const corners = portrait
                ? [135, 70, 765, 100, 775, 1135, 110, 1110]
                : [80, 110, 1090, 75, 1120, 825, 105, 835];
            const from = cv.matFromArray(4, 1, cv.CV_32FC2,
                [0, 0, image.width - 1, 0, image.width - 1, image.height - 1, 0, image.height - 1]);
            const to = cv.matFromArray(4, 1, cv.CV_32FC2, corners);
            const transform = cv.getPerspectiveTransform(from, to);
            cv.warpPerspective(source, target, transform, new cv.Size(width, height),
                cv.INTER_LINEAR, cv.BORDER_CONSTANT, new cv.Scalar(38, 38, 38, 255));
            cv.imshow(frame, target);
            if (portrait) window.__testPortraitFrame = frame;
            const found = OmrA4Scanner.detect(frame);
            const flattened = found && OmrA4Scanner.rectify(frame, found.points);
            const templateName = name === 'ds-12-1.png' ? 'ds-12' : '12-4-6ngang';
            const template = window.TEMPLATES[templateName];
            const markerMat = flattened && cv.imread(flattened);
            const markers = markerMat && OmrEngine.detectMarkers(markerMat, {
                camera: true, expectedAspect: template.warp.width / template.warp.height
            });
            let gradeOutcome = '';
            try {
                const graded = flattened && await OmrEngine.gradeImage(flattened, template,
                    { mcq: {}, tf: {}, tln: {} }, '', templateName, 'opencv', { skipQr: true });
                gradeOutcome = graded?.templateId || '';
            } catch (error) {
                gradeOutcome = error.message;
            }
            const result = { name, found: Boolean(found), fraction: found?.fraction,
                size: flattened && [flattened.width, flattened.height],
                markers: Boolean(markers?.tl && markers?.tr && markers?.bl && markers?.br),
                gradeOutcome, margin };
            markerMat?.delete();
            source.delete(); target.delete(); from.delete(); to.delete(); transform.delete();
            return result;
        }, filename);
        assert.equal(result.found, true, `${filename}: page should be detected`);
        assert.ok(result.fraction > .3, `${filename}: enough of the page should be visible`);
        assert.deepEqual(result.size,
            filename === 'ds-12-1.png' ? [1600, 2263] : [2263, 1600]);
        assert.equal(result.markers, true, `${filename}: grading markers should remain detectable`);
        assert.ok(result.gradeOutcome === (filename === 'ds-12-1.png' ? 'ds-12' : '12-4-6ngang')
            || /số báo danh|mã đề/i.test(result.gradeOutcome),
        `${filename}: grading should reach the result or empty-identity check`);
        console.log(result);
    }
    const noPage = await page.evaluate(() => {
        const canvas = document.createElement('canvas');
        canvas.width = 900; canvas.height = 1200;
        const ctx = canvas.getContext('2d');
        ctx.fillStyle = '#222'; ctx.fillRect(0, 0, 900, 1200);
        ctx.fillStyle = '#444'; ctx.fillRect(110, 110, 680, 980);
        return OmrA4Scanner.detect(canvas);
    });
    assert.equal(noPage, null, 'dark rectangle is not white paper');

    const upload = await page.evaluate(async () => {
        const response = await fetch('./templates/12-4-6ngang-1.png');
        const blob = await response.blob();
        await handleFiles([new File([blob], 'phieu-a4.png', { type: 'image/png' })]);
        return { count: uploadedFiles.length,
            preview: document.getElementById('previewContainer').style.display,
            gradeEnabled: !document.getElementById('gradeBtn').disabled };
    });
    assert.equal(upload.count, 1, 'image upload should load one sheet');
    assert.equal(upload.preview, 'block', 'uploaded sheet preview should remain visible');
    assert.equal(upload.gradeEnabled, true, 'uploaded sheet should be ready to grade');
    console.log({ upload });

    await page.evaluate(() => {
        window.omrAlert = message => { window.__cameraAlert = String(message); };
        window.__cameraSetup = {
            mediaDevices: Boolean(navigator.mediaDevices),
            captureStream: typeof window.__testPortraitFrame?.captureStream,
            cvReady: Boolean(window.OmrEngine?.isOpenCvLoaded)
        };
        navigator.mediaDevices.getUserMedia = async () => {
            window.__getUserMediaCalls = (window.__getUserMediaCalls || 0) + 1;
            const stream = window.__testPortraitFrame.captureStream(0);
            window.__testStream = stream;
            const track = stream.getVideoTracks()[0];
            window.__framePump = setInterval(() => {
                const frame = window.__testPortraitFrame;
                frame.getContext('2d').drawImage(frame, 0, 0);
                track.requestFrame();
            }, 100);
            return stream;
        };
        window.__cameraGraded = null;
        window.gradeScannerImages = async () => {
            window.__cameraGraded = docScannerImages.map(photo => [photo.width, photo.height]);
            clearInterval(window.__framePump);
            await closeDocScannerModal(true);
        };
    });
    await page.evaluate(() => document.getElementById('liveCamBtn').click());
    try {
        await page.waitForFunction(() => Array.isArray(window.__cameraGraded), { timeout: 8000 });
    } catch (error) {
        console.error('Camera state:', await page.evaluate(() => ({
            status: document.getElementById('docScannerStatus')?.textContent,
            readyState: document.getElementById('docScannerVideo')?.readyState,
            videoWidth: document.getElementById('docScannerVideo')?.videoWidth,
            running: isDocScannerRunning, stableCount: docScannerStableCount,
            points: docScannerPoints, busy: docScannerCaptureBusy, taking: docScannerTakingPhoto
            , alert: window.__cameraAlert, setup: window.__cameraSetup,
            getUserMediaCalls: window.__getUserMediaCalls,
            stream: Boolean(docScannerStream), trackState: docScannerStream?.getVideoTracks()[0]?.readyState
        })));
        throw error;
    }
    const cameraResult = await page.evaluate(() => window.__cameraGraded);
    assert.deepEqual(cameraResult, [[1600, 2263]], 'stable full A4 camera frame should auto-capture and grade');
    console.log({ cameraResult });
} finally {
    await browser.close();
}
