import React, { useEffect, useRef, useState, useCallback } from 'react';
import * as pdfjsLib from 'pdfjs-dist';
import { Maximize, Minimize, ChevronLeft, ChevronRight, ArrowLeft } from 'lucide-react';

pdfjsLib.GlobalWorkerOptions.workerSrc = `https://cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjsLib.version}/pdf.worker.min.js`;

export default function Presenter({ item, url, onClose }) {
  const canvasRef = useRef(null);
  const containerRef = useRef(null);
  const renderTaskRef = useRef(null);
  
  const [pdfDoc, setPdfDoc] = useState(null);
  const [pageNum, setPageNum] = useState(1);
  const [pageCount, setPageCount] = useState(0);
  const [isFullscreen, setIsFullscreen] = useState(false);
  const [loading, setLoading] = useState(true);
  const [links, setLinks] = useState([]);
  const [canvasStyle, setCanvasStyle] = useState({ width: 0, height: 0, scale: 1 });

  // Khởi tạo PDF
  useEffect(() => {
    setLoading(true);
    const loadingTask = pdfjsLib.getDocument(url);
    loadingTask.promise.then((pdf) => {
      setPdfDoc(pdf);
      setPageCount(pdf.numPages);
      setLoading(false);
    }).catch(err => {
      console.error("Lỗi tải PDF:", err);
      setLoading(false);
    });
  }, [url]);

  // Render trang
  const renderPage = useCallback((num, doc) => {
    if (!doc) return;

    // Khi giáo viên bấm chuyển slide liên tục, hủy lượt PDF.js cũ trước
    // khi dùng lại canvas; nếu không PDF.js sẽ ném lỗi concurrent render.
    renderTaskRef.current?.cancel();
    renderTaskRef.current = null;
    
    doc.getPage(num).then((page) => {
      const canvas = canvasRef.current;
      if (!canvas) return;
      const ctx = canvas.getContext('2d');
      
      const containerWidth = window.innerWidth;
      const containerHeight = window.innerHeight;
      
      // Dùng scale=1 trước để lấy kích thước gốc
      const viewport1 = page.getViewport({ scale: 1 });
      
      const scaleX = containerWidth / viewport1.width;
      const scaleY = containerHeight / viewport1.height;
      const scale = Math.min(scaleX, scaleY);
      
      const pixelRatio = window.devicePixelRatio || 1;
      // Dùng đúng viewport với scale kết hợp pixelRatio để ảnh sắc nét
      const viewport = page.getViewport({ scale: scale * pixelRatio });
      
      canvas.width = viewport.width;
      canvas.height = viewport.height;
      
      const styleWidth = viewport.width / pixelRatio;
      const styleHeight = viewport.height / pixelRatio;
      
      canvas.style.width = `${styleWidth}px`;
      canvas.style.height = `${styleHeight}px`;
      
      setCanvasStyle({ width: styleWidth, height: styleHeight, scale });

      // PDF.js tự xử lý đúng tọa độ qua viewport - không cần flip thủ công
      const renderContext = { canvasContext: ctx, viewport };
      const renderTask = page.render(renderContext);
      renderTaskRef.current = renderTask;
      renderTask.promise
        .catch(error => {
          if (error?.name !== 'RenderingCancelledException') {
            console.error("Lỗi vẽ slide:", error);
          }
        })
        .finally(() => {
          if (renderTaskRef.current === renderTask) renderTaskRef.current = null;
        });
      
      // Trích xuất Hyperlinks với scale tương ứng
      page.getAnnotations().then(annotations => {
        const linkAnnos = annotations.filter(a => a.subtype === 'Link');
        setLinks(linkAnnos);
      });
    });
  }, []);

  useEffect(() => () => {
    renderTaskRef.current?.cancel();
  }, []);

  useEffect(() => {
    if (pdfDoc) {
      renderPage(pageNum, pdfDoc);
      const handleResize = () => renderPage(pageNum, pdfDoc);
      window.addEventListener('resize', handleResize);
      return () => window.removeEventListener('resize', handleResize);
    }
  }, [pdfDoc, pageNum, renderPage]);

  // Điều hướng
  const nextPage = useCallback(() => {
    if (pageNum < pageCount) setPageNum(pageNum + 1);
  }, [pageNum, pageCount]);

  const prevPage = useCallback(() => {
    if (pageNum > 1) setPageNum(pageNum - 1);
  }, [pageNum]);

  // Xử lý click Hyperlink
  const handleLinkClick = async (e, anno) => {
    e.stopPropagation(); // Ngăn click lan ra chuyển slide
    if (anno.url) {
      window.open(anno.url, '_blank');
    } else if (anno.dest && pdfDoc) {
      try {
        let explicitDest = anno.dest;
        if (typeof explicitDest === 'string') {
          explicitDest = await pdfDoc.getDestination(explicitDest);
        }
        if (explicitDest && explicitDest[0]) {
          const pageIndex = await pdfDoc.getPageIndex(explicitDest[0]);
          setPageNum(pageIndex + 1);
        }
      } catch (err) {
        console.error("Lỗi chuyển link nội bộ:", err);
      }
    }
  };

  // Xử lý sự kiện bàn phím
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === 'ArrowRight' || e.key === 'ArrowDown' || e.key === ' ' || e.key === 'Enter') {
        nextPage();
      } else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp' || e.key === 'Backspace') {
        prevPage();
      } else if (e.key === 'Escape') {
        if (!document.fullscreenElement) {
          onClose();
        }
      } else if (e.key === 'f' || e.key === 'F' || e.key === 'F11') {
        e.preventDefault();
        toggleFullscreen();
      }
    };
    
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [nextPage, prevPage, onClose]);

  const toggleFullscreen = () => {
    if (!document.fullscreenElement) {
      containerRef.current.requestFullscreen().catch(err => {
        console.error("Không thể bật Fullscreen:", err);
      });
    } else {
      document.exitFullscreen();
    }
  };

  useEffect(() => {
    const onFullscreenChange = () => {
      setIsFullscreen(!!document.fullscreenElement);
    };
    document.addEventListener('fullscreenchange', onFullscreenChange);
    return () => document.removeEventListener('fullscreenchange', onFullscreenChange);
  }, []);

  return (
    <div 
      className="presenter-container" 
      ref={containerRef}
      onClick={(e) => {
        if (e.target.closest('.presenter-top-bar') || e.target.closest('.toolbar')) return;
        nextPage();
      }}
      onContextMenu={(e) => {
        e.preventDefault();
        prevPage();
      }}
    >
      {/* Top Presenter Bar */}
      <header className="presenter-top-bar" onClick={e => e.stopPropagation()}>
        <button 
          className="presenter-back-btn" 
          onClick={onClose}
          title="Thoát trình chiếu (Esc)"
        >
          <ArrowLeft size={18} />
          <span>Thư viện</span>
        </button>

        <div className="presenter-title-container">
          <span className={`presenter-badge ${item?.type === 'exam' ? 'badge-exam' : 'badge-lesson'}`}>
            {item?.type === 'exam' ? `ĐỀ THI 22 CÂU · K${item?.grade}` : `BÀI GIẢNG · K${item?.grade}`}
          </span>
          <h2 className="presenter-doc-title">{item?.title || 'Bài giảng trình chiếu'}</h2>
        </div>

        <div className="presenter-hints">
          <span>Phím: <strong>←</strong> <strong>→</strong> <strong>Space</strong> lật trang · <strong>F</strong> toàn màn hình</span>
        </div>
      </header>

      {loading ? (
        <div className="loader">
          <div className="spinner"></div>
          <p>Đang chuẩn bị slide trình chiếu...</p>
        </div>
      ) : (
        <div className="canvas-wrapper" style={{ position: 'relative', display: 'inline-block' }}>
          <canvas ref={canvasRef} />
          
          {/* Lớp Overlay cho Hyperlinks */}
          {links.map((anno, idx) => {
            const [x1, y1, x2, y2] = anno.rect;
            const left = x1 * canvasStyle.scale;
            const top = (canvasStyle.height / canvasStyle.scale - y2) * canvasStyle.scale;
            const width = (x2 - x1) * canvasStyle.scale;
            const height = (y2 - y1) * canvasStyle.scale;
            
            return (
              <div
                key={idx}
                onClick={(e) => handleLinkClick(e, anno)}
                style={{
                  position: 'absolute',
                  left: `${left}px`,
                  top: `${top}px`,
                  width: `${width}px`,
                  height: `${height}px`,
                  cursor: 'pointer',
                  zIndex: 50,
                }}
                title={anno.url || "Chuyển câu / Mục lục"}
              />
            );
          })}
        </div>
      )}

      {!loading && (
        <div className="toolbar" onClick={e => e.stopPropagation()}>
          <button className="toolbar-btn" onClick={prevPage} disabled={pageNum <= 1} title="Slide trước (←)">
            <ChevronLeft size={22} />
          </button>
          
          <div className="page-info">
            <span className="page-current">{pageNum}</span>
            <span className="page-slash">/</span>
            <span className="page-total">{pageCount}</span>
          </div>
          
          <button className="toolbar-btn" onClick={nextPage} disabled={pageNum >= pageCount} title="Slide tiếp (→ hoặc Space)">
            <ChevronRight size={22} />
          </button>
          
          <div className="toolbar-divider"></div>
          
          <button className="toolbar-btn" onClick={toggleFullscreen} title="Bật/Tắt Toàn màn hình (F)">
            {isFullscreen ? <Minimize size={18} /> : <Maximize size={18} />}
          </button>
        </div>
      )}
    </div>
  );
}
