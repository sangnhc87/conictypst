// UI và logic cho Thư viện Hình Mẫu (Templates)
(function() {
  const is3D = window.location.href.includes("3d");
  const typeFilter = is3D ? "3d" : "2d";

  function createModal() {
    if (document.getElementById("ggbTemplateModal")) return;

    const modalHTML = `
      <div id="ggbTemplateModal" style="display:none; position:fixed; inset:0; background:rgba(15,23,42,0.85); z-index:9999; backdrop-filter:blur(4px); align-items:center; justify-content:center; font-family:'Inter',sans-serif;">
        <div style="background:#1e293b; width:90%; max-width:1000px; height:80vh; border-radius:12px; border:1px solid #334155; display:flex; flex-direction:column; overflow:hidden; box-shadow:0 25px 50px -12px rgba(0,0,0,0.5);">
          <!-- Header -->
          <div style="padding:16px 20px; border-bottom:1px solid #334155; display:flex; justify-content:space-between; align-items:center; background:#0f172a;">
            <h2 style="margin:0; color:#f8fafc; font-size:1.1rem; display:flex; align-items:center; gap:8px;">
              <i data-lucide="library" style="width:20px; height:20px; color:#38bdf8;"></i> Thư Viện Hình Mẫu (1-Click)
            </h2>
            <button onclick="document.getElementById('ggbTemplateModal').style.display='none'" style="background:transparent; border:none; color:#94a3b8; cursor:pointer; padding:4px;">
              <i data-lucide="x" style="width:20px; height:20px;"></i>
            </button>
          </div>
          <!-- Body -->
          <div style="display:flex; flex:1; overflow:hidden;">
            <!-- Sidebar -->
            <div style="width:250px; background:#0f172a; border-right:1px solid #334155; overflow-y:auto; padding:12px 0;" id="templateCategories">
               <!-- Categories will be injected here -->
            </div>
            <!-- Main Grid -->
            <div style="flex:1; padding:20px; overflow-y:auto; background:#1e293b;" id="templateGrid">
               <!-- Templates will be injected here -->
            </div>
          </div>
        </div>
      </div>
    `;
    document.body.insertAdjacentHTML('beforeend', modalHTML);
    window.lucide?.createIcons();
  }

  function renderTemplates(category = "Tất cả") {
    const grid = document.getElementById("templateGrid");
    grid.innerHTML = "";
    
    let filtered = (window.GGB_TEMPLATES || []).filter(t => t.type === typeFilter);
    if (category !== "Tất cả") {
      filtered = filtered.filter(t => t.category === category);
    }

    if (filtered.length === 0) {
      grid.innerHTML = `<div style="color:#64748b; text-align:center; padding:40px;">Chưa có mẫu nào trong danh mục này.</div>`;
      return;
    }

    const gridLayout = document.createElement("div");
    gridLayout.style.display = "grid";
    gridLayout.style.gridTemplateColumns = "repeat(auto-fill, minmax(200px, 1fr))";
    gridLayout.style.gap = "16px";

    filtered.forEach(tpl => {
      const card = document.createElement("div");
      card.style.background = "#0f172a";
      card.style.border = "1px solid #334155";
      card.style.borderRadius = "8px";
      card.style.overflow = "hidden";
      card.style.cursor = "pointer";
      card.style.transition = "transform 0.2s, border-color 0.2s";
      
      card.onmouseenter = () => { card.style.transform = "translateY(-2px)"; card.style.borderColor = "#38bdf8"; };
      card.onmouseleave = () => { card.style.transform = "none"; card.style.borderColor = "#334155"; };
      
      card.onclick = () => {
         if (confirm(`Bạn có chắc muốn áp dụng mẫu "${tpl.name}"? (Hình vẽ hiện tại sẽ bị ghi đè)`)) {
            if (tpl.data) {
               window.ggbApplet.setBase64(tpl.data, () => {
                   document.getElementById('ggbTemplateModal').style.display = 'none';
                   if (window.generateTikz) window.generateTikz();
                   if (window.generateCetz) window.generateCetz();
               });
            } else if (tpl.commands) {
               window.ggbApplet.newConstruction();
               tpl.commands.forEach(cmd => window.ggbApplet.evalCommand(cmd));
               document.getElementById('ggbTemplateModal').style.display = 'none';
               if (window.generateTikz) window.generateTikz();
               if (window.generateCetz) window.generateCetz();
            }
         }
      };

      let imgContent = `<div style="height:120px; background:#1e293b; display:flex; align-items:center; justify-content:center; color:#475569;">
        <i data-lucide="image" style="width:32px; height:32px;"></i>
      </div>`;
      
      if (tpl.preview) {
         if (tpl.preview.startsWith('lucide:')) {
             const iconName = tpl.preview.split(':')[1];
             imgContent = `<div style="height:120px; background:#1e293b; display:flex; align-items:center; justify-content:center; color:#38bdf8; border-bottom:1px solid #334155;">
                <i data-lucide="${iconName}" style="width:48px; height:48px; stroke-width:1.5;"></i>
             </div>`;
         } else if (tpl.preview.startsWith('<svg')) {
             imgContent = `<div style="height:120px; display:flex; align-items:center; justify-content:center; background:#1e293b; border-bottom:1px solid #334155;">
               ${tpl.preview}
             </div>`;
         } else {
             imgContent = `<img src="${tpl.preview}" style="width:100%; height:120px; object-fit:cover; border-bottom:1px solid #334155;" />`;
         }
      }

      card.innerHTML = `
        ${imgContent}
        <div style="padding:12px;">
           <div style="color:#e2e8f0; font-size:0.9rem; font-weight:500; margin-bottom:4px;">${tpl.name}</div>
           <div style="color:#64748b; font-size:0.75rem;">${tpl.category}</div>
        </div>
      `;
      gridLayout.appendChild(card);
    });

    grid.appendChild(gridLayout);
    window.lucide?.createIcons();
  }

  function renderCategories() {
    const categoriesContainer = document.getElementById("templateCategories");
    categoriesContainer.innerHTML = "";
    
    let allTemplates = (window.GGB_TEMPLATES || []).filter(t => t.type === typeFilter);
    let cats = new Set(allTemplates.map(t => t.category));
    let catArray = ["Tất cả", ...Array.from(cats)];

    catArray.forEach(cat => {
       const btn = document.createElement("button");
       btn.innerText = cat;
       btn.style.width = "100%";
       btn.style.background = "transparent";
       btn.style.border = "none";
       btn.style.color = "#94a3b8";
       btn.style.padding = "10px 20px";
       btn.style.textAlign = "left";
       btn.style.cursor = "pointer";
       btn.style.fontSize = "0.9rem";
       btn.style.transition = "background 0.2s, color 0.2s";
       
       btn.onmouseenter = () => { btn.style.background = "#1e293b"; btn.style.color = "#f1f5f9"; };
       btn.onmouseleave = () => { btn.style.background = "transparent"; btn.style.color = "#94a3b8"; };
       
       btn.onclick = () => {
          renderTemplates(cat);
       };
       categoriesContainer.appendChild(btn);
    });
  }

  window.openTemplateModal = function() {
    createModal();
    renderCategories();
    renderTemplates("Tất cả");
    document.getElementById("ggbTemplateModal").style.display = "flex";
  };

  window.exportCurrentTemplate = function() {
    if (!window.ggbApplet) return alert("GeoGebra chưa sẵn sàng!");
    
    let name = prompt("Nhập tên hình mẫu (VD: Chóp S.ABCD):");
    if (!name) return;
    
    let cat = prompt("Nhập Category (VD: Khối đa diện, Hình chóp):");
    if (!cat) return;

    window.ggbApplet.getBase64(function(base64) {
      let obj = {
        id: "tpl_" + Date.now(),
        name: name,
        category: cat,
        type: typeFilter,
        preview: "", 
        data: base64
      };
      
      let str = JSON.stringify(obj, null, 2) + ",";
      navigator.clipboard.writeText(str).then(() => {
         alert("Đã copy JSON hình mẫu vào Clipboard! Bạn hãy paste vào file ggb-templates.js");
      }).catch(err => {
         console.error("Lỗi copy:", err);
         alert("Không thể copy vào clipboard. Hãy xem console log.");
         console.log(str);
      });
    });
  };

  // Inject buttons into UI automatically
  window.addEventListener('load', () => {
     const copyBtn = document.querySelector('.panel-right .panel-title button[onclick="copyCode()"]');
     if (copyBtn) {
        const panelTitle = copyBtn.parentElement;
        // Fix up the flex container to handle multiple buttons elegantly
        panelTitle.style.display = "flex";
        panelTitle.style.alignItems = "center";
        panelTitle.style.gap = "8px";

        // The Library Button (Icon only)
        const btnLib = document.createElement("button");
        btnLib.className = "btn-primary";
        btnLib.style.background = "#8b5cf6"; 
        btnLib.style.padding = "0";
        btnLib.style.width = "36px";
        btnLib.style.height = "36px";
        btnLib.style.display = "flex";
        btnLib.style.alignItems = "center";
        btnLib.style.justifyContent = "center";
        btnLib.style.borderRadius = "8px";
        btnLib.style.flexShrink = "0";
        btnLib.title = "Thư Viện Hình Mẫu";
        btnLib.onclick = window.openTemplateModal;
        btnLib.innerHTML = `<i data-lucide="library" style="width: 18px; height: 18px;"></i>`;
        
        // The Secret Export Button (Icon only)
        const btnExport = document.createElement("button");
        btnExport.className = "btn-primary";
        btnExport.style.background = "#f59e0b";
        btnExport.style.padding = "0";
        btnExport.style.width = "36px";
        btnExport.style.height = "36px";
        btnExport.style.display = "flex";
        btnExport.style.alignItems = "center";
        btnExport.style.justifyContent = "center";
        btnExport.style.borderRadius = "8px";
        btnExport.style.flexShrink = "0";
        btnExport.title = "Trích xuất Lưu Mẫu (Dành cho Admin)";
        btnExport.onclick = window.exportCurrentTemplate;
        btnExport.innerHTML = `<i data-lucide="upload-cloud" style="width: 18px; height: 18px;"></i>`;
        
        panelTitle.insertBefore(btnExport, panelTitle.firstChild); // Đảo thứ tự để thư viện nằm ngoài cùng
        panelTitle.insertBefore(btnLib, panelTitle.firstChild);
        window.lucide?.createIcons();
     }
  });

})();
