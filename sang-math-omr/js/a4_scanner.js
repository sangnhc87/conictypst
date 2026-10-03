(function () {
    'use strict';

    function distance(a, b) {
        return Math.hypot(a.x - b.x, a.y - b.y);
    }

    function orderCorners(points) {
        const center = {
            x: points.reduce((sum, point) => sum + point.x, 0) / 4,
            y: points.reduce((sum, point) => sum + point.y, 0) / 4
        };
        const ordered = [...points].sort((a, b) =>
            Math.atan2(a.y - center.y, a.x - center.x) - Math.atan2(b.y - center.y, b.x - center.x));
        const start = ordered.reduce((best, point, index) =>
            point.x + point.y < ordered[best].x + ordered[best].y ? index : best, 0);
        return [...ordered.slice(start), ...ordered.slice(0, start)];
    }

    function detect(canvas) {
        if (!window.cv || !canvas?.width || !canvas?.height) return null;
        const mats = [];
        const make = () => { const mat = new cv.Mat(); mats.push(mat); return mat; };
        try {
            const source = cv.imread(canvas); mats.push(source);
            const gray = make(), blurred = make(), binary = make(), edges = make();
            cv.cvtColor(source, gray, cv.COLOR_RGBA2GRAY);
            cv.GaussianBlur(gray, blurred, new cv.Size(5, 5), 0);
            cv.threshold(blurred, binary, 0, 255, cv.THRESH_BINARY + cv.THRESH_OTSU);
            cv.Canny(blurred, edges, 45, 150);
            const kernel = cv.getStructuringElement(cv.MORPH_RECT, new cv.Size(5, 5));
            mats.push(kernel);
            cv.morphologyEx(binary, binary, cv.MORPH_CLOSE, kernel);
            cv.morphologyEx(edges, edges, cv.MORPH_CLOSE, kernel);

            let best = null;
            for (const mask of [binary, edges]) {
                const contours = new cv.MatVector(), hierarchy = make();
                mats.push(contours);
                cv.findContours(mask, contours, hierarchy, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE);
                for (let i = 0; i < contours.size(); i++) {
                    const contour = contours.get(i);
                    try {
                        const area = cv.contourArea(contour);
                        const fraction = area / (canvas.width * canvas.height);
                        if (fraction < .22 || fraction > .96 || (best && area <= best.area)) continue;
                        const approx = new cv.Mat();
                        try {
                            cv.approxPolyDP(contour, approx, .025 * cv.arcLength(contour, true), true);
                            if (approx.rows !== 4 || !cv.isContourConvex(approx)) continue;
                            const points = orderCorners(Array.from({ length: 4 }, (_, n) => ({
                                x: approx.data32S[n * 2], y: approx.data32S[n * 2 + 1]
                            })));
                            const margin = Math.min(canvas.width, canvas.height) * .012;
                            if (points.some(point => point.x <= margin || point.y <= margin
                                || point.x >= canvas.width - margin || point.y >= canvas.height - margin)) continue;
                            const width = (distance(points[0], points[1]) + distance(points[2], points[3])) / 2;
                            const height = (distance(points[1], points[2]) + distance(points[3], points[0])) / 2;
                            const ratio = Math.max(width, height) / Math.max(1, Math.min(width, height));
                            if (ratio < 1.12 || ratio > 2.35) continue;
                            // A bright paper center rejects large dark rectangles on the desk.
                            const centerX = Math.round(points.reduce((sum, point) => sum + point.x, 0) / 4);
                            const centerY = Math.round(points.reduce((sum, point) => sum + point.y, 0) / 4);
                            if (gray.ucharPtr(centerY, centerX)[0] < 85) continue;
                            best = { points, area, fraction, width, height };
                        } finally {
                            approx.delete();
                        }
                    } finally {
                        contour.delete();
                    }
                }
            }
            return best;
        } finally {
            for (const mat of mats.reverse()) mat.delete();
        }
    }

    function rectify(canvas, corners, targetShortSide = 1600) {
        const source = cv.imread(canvas);
        const destination = new cv.Mat();
        let transform = null, from = null, to = null;
        try {
            const width = (distance(corners[0], corners[1]) + distance(corners[2], corners[3])) / 2;
            const height = (distance(corners[1], corners[2]) + distance(corners[3], corners[0])) / 2;
            const landscape = width > height;
            const outputWidth = landscape ? Math.round(targetShortSide * 297 / 210) : targetShortSide;
            const outputHeight = landscape ? targetShortSide : Math.round(targetShortSide * 297 / 210);
            from = cv.matFromArray(4, 1, cv.CV_32FC2, corners.flatMap(point => [point.x, point.y]));
            to = cv.matFromArray(4, 1, cv.CV_32FC2,
                [0, 0, outputWidth - 1, 0, outputWidth - 1, outputHeight - 1, 0, outputHeight - 1]);
            transform = cv.getPerspectiveTransform(from, to);
            cv.warpPerspective(source, destination, transform, new cv.Size(outputWidth, outputHeight),
                cv.INTER_LINEAR, cv.BORDER_CONSTANT, new cv.Scalar(255, 255, 255, 255));
            const output = document.createElement('canvas');
            cv.imshow(output, destination);
            return output;
        } finally {
            source.delete(); destination.delete();
            transform?.delete(); from?.delete(); to?.delete();
        }
    }

    function focusScore(canvas) {
        if (!window.cv || !canvas?.width || !canvas?.height) return 0;
        const source = cv.imread(canvas), gray = new cv.Mat(), laplacian = new cv.Mat();
        const mean = new cv.Mat(), deviation = new cv.Mat();
        try {
            cv.cvtColor(source, gray, cv.COLOR_RGBA2GRAY);
            cv.Laplacian(gray, laplacian, cv.CV_64F);
            cv.meanStdDev(laplacian, mean, deviation);
            return deviation.data64F[0] ** 2;
        } finally {
            source.delete(); gray.delete(); laplacian.delete(); mean.delete(); deviation.delete();
        }
    }

    window.OmrA4Scanner = Object.freeze({ detect, rectify, focusScore });
})();
