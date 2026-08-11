import React, { useState, useMemo, useCallback } from 'react';
import { FiDownload, FiCopy, FiChevronRight, FiFolder, FiFileText, FiRefreshCw, FiLoader, FiTrash2, FiMaximize2, FiMinimize2 } from 'react-icons/fi';
import clsx from 'clsx';
import { saveAs } from 'file-saver';
import JSZip from 'jszip';

function convertLatexToTypst(content) {
    let exMatch = content.match(/\\begin\{ex\}([\s\S]*?)\\end\{ex\}/);
    if (!exMatch) return content;
    
    let exContent = exMatch[1].trim();
    
    let loigiai = "";
    let loigiaiMatch = exContent.match(/\\loigiai\{([\s\S]*?)\}$/);
    if (loigiaiMatch) {
        loigiai = loigiaiMatch[1].trim();
        exContent = exContent.slice(0, loigiaiMatch.index).trim();
    }
    
    if (exContent.includes('\\choiceTF')) {
        let parts = exContent.split('\\choiceTF');
        let question = parts[0].trim();
        let choicesStr = parts[1].trim();
        
        let choices = [];
        let choiceRegex = /\{([\s\S]*?)\}/g;
        let m;
        while ((m = choiceRegex.exec(choicesStr)) !== null) {
            choices.push(m[1]);
        }
        
        let typstChoices = choices.slice(0, 4).map(c => {
            if (c.includes('\\True')) {
                return `True([${c.replace('\\True', '').trim()}])`;
            } else {
                return `[${c.trim()}]`;
            }
        });
        
        let out = `#ds([${question}],\n  (\n    ${typstChoices.join(',\n    ')}\n  )`;
        if (loigiai) out += `,\n  loigiai: [\n    ${loigiai}\n  ]`;
        out += "\n)";
        return out;
    } 
    else if (exContent.includes('\\choice')) {
        let parts = exContent.split('\\choice');
        let question = parts[0].trim();
        let choicesStr = parts[1].trim();
        
        let choices = [];
        let choiceRegex = /\{([\s\S]*?)\}/g;
        let m;
        while ((m = choiceRegex.exec(choicesStr)) !== null) {
            choices.push(m[1]);
        }
        
        let typstChoices = choices.slice(0, 4).map(c => {
            if (c.includes('\\True')) {
                return `True([${c.replace('\\True', '').trim()}])`;
            } else {
                return `[${c.trim()}]`;
            }
        });
        
        let out = `#tn([${question}], (${typstChoices.join(', ')})`;
        if (loigiai) out += `, loigiai: [\n    ${loigiai}\n  ]`;
        out += ")";
        return out;
    }
    else if (exContent.includes('\\shortans')) {
        let parts = exContent.split('\\shortans');
        let question = parts[0].trim();
        let ansMatch = parts[1].match(/\{([\s\S]*?)\}/);
        let ans = ansMatch ? ansMatch[1].trim() : "";
        
        let out = `#tln([${question}], [${ans}], show-boxes: false`;
        if (loigiai) out += `, loigiai: [\n    ${loigiai}\n  ]`;
        out += ")";
        return out;
    }
    else {
        let out = `#tl([${exContent.trim()}]`;
        if (loigiai) out += `, loigiai: [\n    ${loigiai}\n  ]`;
        out += ")";
        return out;
    }
}

function generateFullDecks(selection, numDe) {
    const decks = [];
    if (!window.SimilarEngine) {
        console.error("SimilarEngine not loaded!");
        return decks;
    }
    for (let i = 0; i < numDe; i++) {
        const deck = { title: `Đề số ${i + 1}`, questions: [] };
        selection.forEach(leaf => {
            const [generatedQuestion] = window.SimilarEngine.generateQuestions(leaf.content, 1);
            const typstQuestion = convertLatexToTypst(generatedQuestion);
            deck.questions.push({ type: leaf.name, content: typstQuestion });
        });
        decks.push(deck);
    }
    return decks;
}

const TreeViewNode = ({ node, level, selection, onSelectionChange }) => {
    const [isOpen, setIsOpen] = useState(level < 1);
    const isFolder = !node.content;
    const children = Object.values(node.children || {});
    return (
        <li>
            <div
                onClick={() => isFolder && setIsOpen(!isOpen)}
                style={{ paddingLeft: `${level * 1.5}rem`, display: 'flex', alignItems: 'center', gap: '0.5rem', padding: '6px', margin: '2px 0', borderRadius: '4px', cursor: isFolder ? 'pointer' : 'default', background: isFolder ? 'transparent' : 'inherit' }}
            >
                {isFolder && <FiChevronRight style={{ transform: isOpen ? 'rotate(90deg)' : 'none', transition: 'transform 0.2s', color: '#999' }} />}

                {!isFolder && <input type="checkbox"
                    checked={selection.some(sel => sel.path === node.path)}
                    onChange={(e) => onSelectionChange(node, e.target.checked)}
                />}

                {isFolder ? <FiFolder style={{ color: '#EAB308' }} /> : <FiFileText style={{ color: '#6B7280' }} />}
                <span style={{ fontWeight: isFolder ? '600' : 'normal', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>{node.name}</span>
            </div>
            {isFolder && isOpen && (
                <ul style={{ paddingLeft: '1rem', borderLeft: '1px dashed #ccc', marginLeft: '0.75rem', listStyle: 'none' }}>
                    {children.map((childNode) => <TreeViewNode key={childNode.path} node={childNode} level={level + 1} selection={selection} onSelectionChange={onSelectionChange} />)}
                </ul>
            )}
        </li>
    );
};

const SelectionTable = ({ selection, onRemove }) => {
    return (
        <div style={{ border: '1px solid #ddd', borderRadius: '8px', background: '#fff' }}>
            <p style={{ fontWeight: '600', padding: '12px', borderBottom: '1px solid #ddd', margin: 0 }}>Đã chọn: {selection.length} dạng bài</p>
            <ul style={{ maxHeight: '8rem', overflowY: 'auto', listStyle: 'none', margin: 0, padding: 0 }}>
                {selection.length === 0 ? <li style={{ padding: '12px', color: '#6B7280' }}>Chưa chọn dạng bài nào.</li> :
                    selection.map((item, index) => (
                        <li key={index} style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '8px', borderTop: '1px solid #ddd' }}>
                            <span style={{ whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', flex: 1 }} title={item.path}>
                                <span style={{ fontFamily: 'monospace', fontSize: '0.75rem', marginRight: '8px', color: '#9CA3AF' }}>{index + 1}.</span>
                                {item.name}
                            </span>
                            <button style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#9CA3AF' }} onClick={() => onRemove(item)}>
                                <FiTrash2 />
                            </button>
                        </li>
                    ))
                }
            </ul>
        </div>
    );
};

const DeckCard = ({ deck, onCopy, onSave }) => {
    const [isCollapsed, setIsCollapsed] = useState(false);
    return (
        <div style={{ background: '#fff', padding: '16px', border: '1px solid #ddd', borderRadius: '8px', marginBottom: '16px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderBottom: '1px solid #ddd', paddingBottom: '8px', marginBottom: '8px' }}>
                <h4 style={{ margin: 0, fontSize: '1.1rem' }}>{deck.title}</h4>
                <div style={{ display: 'flex', gap: '8px' }}>
                    <button onClick={() => onCopy(deck)} style={{ padding: '4px 8px', background: '#f3f4f6', border: '1px solid #ddd', borderRadius: '4px', cursor: 'pointer', display: 'flex', alignItems: 'center' }} title="Copy nội dung đề"><FiCopy style={{ marginRight: '4px' }} /> Copy</button>
                    <button onClick={() => onSave(deck)} style={{ padding: '4px 8px', background: '#f3f4f6', border: '1px solid #ddd', borderRadius: '4px', cursor: 'pointer', display: 'flex', alignItems: 'center' }} title="Tải về file .typ"><FiDownload style={{ marginRight: '4px' }} /> Tải về</button>
                    <button onClick={() => setIsCollapsed(!isCollapsed)} style={{ padding: '4px 8px', background: '#f3f4f6', border: '1px solid #ddd', borderRadius: '4px', cursor: 'pointer' }} title={isCollapsed ? 'Mở rộng' : 'Thu gọn'}>
                        {isCollapsed ? <FiMaximize2 /> : <FiMinimize2 />}
                    </button>
                </div>
            </div>
            {!isCollapsed && (
                <div style={{ overflow: 'hidden' }}>
                    <div style={{ paddingTop: '8px' }}>
                        {deck.questions.map((q, qIndex) => (
                            <div key={qIndex} style={{ marginBottom: '12px' }}>
                                <p style={{ fontSize: '0.75rem', color: '#6B7280', fontStyle: 'italic', margin: '0 0 4px 0' }}>// {q.type}</p>
                                <pre style={{ background: '#f9fafb', padding: '8px', border: '1px solid #eee', borderRadius: '4px', fontFamily: 'monospace', fontSize: '0.875rem', whiteSpace: 'pre-wrap', margin: 0 }}><code>{q.content}</code></pre>
                            </div>
                        ))}
                    </div>
                </div>
            )}
        </div>
    );
};

export default function SimilarGenerator() {
    const [engineLoaded, setEngineLoaded] = useState(!!window.SimilarEngine);
    const [engineError, setEngineError] = useState(false);
    const [selection, setSelection] = useState([]);
    const [numDe, setNumDe] = useState(5);
    const [results, setResults] = useState([]);
    const [isLoading, setIsLoading] = useState(false);

    React.useEffect(() => {
        if (window.SimilarEngine) {
            setEngineLoaded(true);
            return;
        }
        const script = document.createElement('script');
        script.src = '/js/similarEngine.bundle.js?v=3';
        script.async = true;
        script.onload = () => {
            console.log("similarEngine.bundle.js loaded successfully.");
            // Wait for next tick to ensure window.SimilarEngine is assigned
            setTimeout(() => setEngineLoaded(!!window.SimilarEngine), 50);
        };
        script.onerror = (e) => {
            console.error("Script load error", e);
            setEngineError(true);
        };
        document.body.appendChild(script);
        return () => {
            if (document.body.contains(script)) document.body.removeChild(script);
        };
    }, []);

    const menuTree = useMemo(() => {
        if (!window.SimilarEngine) return [];
        const menuSource = window.SimilarEngine.menuSource;
        const root = {};
        menuSource.forEach(item => {
            const parts = item.path.split('/');
            let currentNode = root;
            parts.forEach((part, index) => {
                if (!currentNode[part]) {
                    currentNode[part] = { name: part, path: parts.slice(0, index + 1).join('/'), children: {} };
                }
                if (index === parts.length - 1) { Object.assign(currentNode[part], item); }
                currentNode = currentNode[part].children;
            });
        });
        return Object.values(root);
    }, [window.SimilarEngine]);

    const handleSelectionChange = (leaf, isChecked) => {
        setSelection(prev => isChecked ? [...prev, leaf] : prev.filter(item => item.path !== leaf.path));
    };

    const handleRemoveFromSelection = (leafToRemove) => {
        setSelection(prev => prev.filter(item => item.path !== leafToRemove.path));
    };

    const handleGenerate = () => {
        if (selection.length === 0) return alert('Vui lòng tick chọn ít nhất một dạng bài tập.');
        setIsLoading(true); setResults([]);
        setTimeout(() => {
            try { setResults(generateFullDecks(selection, numDe)); }
            catch (error) { alert('Đã xảy ra lỗi trong quá trình sinh đề: ' + error.message); }
            finally { setIsLoading(false); }
        }, 50);
    };

    const downloadAllResults = async () => {
        if (results.length === 0) return;
        const zip = new JSZip();
        results.forEach(deck => {
            const deckContent = deck.questions.map(q => `// Dạng bài: ${q.type}\n${q.content}`).join('\n\n');
            zip.file(`${deck.title.replace(/\s/g, '_')}.typ`, deckContent);
        });
        const blob = await zip.generateAsync({ type: "blob" });
        saveAs(blob, "Cac_De_Thi.zip");
    };

    const downloadMergedResults = () => {
        if (results.length === 0) return;
        const fullContent = results.map(deck => {
            const deckContent = deck.questions.map(q => `// Dạng bài: ${q.type}\n${q.content}`).join('\n\n');
            return `// ====================\n// ${deck.title}\n// ====================\n\n${deckContent}`;
        }).join('\n\n\n');
        const blob = new Blob([fullContent], { type: 'text/plain;charset=utf-8' });
        saveAs(blob, "Tong_Hop_Cac_De.typ");
    };

    const handleCopyDeck = (deck) => {
        const deckContent = deck.questions.map(q => q.content).join('\n\n');
        navigator.clipboard.writeText(deckContent);
        alert(`Đã sao chép ${deck.title}!`);
    };

    const handleSaveDeck = (deck) => {
        const deckContent = deck.questions.map(q => `// Dạng bài: ${q.type}\n${q.content}`).join('\n\n');
        const blob = new Blob([deckContent], { type: 'text/plain;charset=utf-8' });
        saveAs(blob, `${deck.title.replace(/\s/g, '_')}.typ`);
    };

    const defaultSizes = useMemo(() => {
        const saved = localStorage.getItem('generator-panel-sizes');
        return saved ? JSON.parse(saved) : [40, 60];
    }, []);
    
    const handlePanelResize = useCallback((sizes) => { localStorage.setItem('generator-panel-sizes', JSON.stringify(sizes)); }, []);

    if (!engineLoaded) {
        return (
            <div style={{ display: 'flex', flexDirection: 'column', height: '100%', alignItems: 'center', justifyContent: 'center' }}>
                <p style={{ color: '#6B7280', textAlign: 'center' }}>
                   {engineError 
                     ? 'Lỗi tải engine xử lý dữ liệu. Vui lòng kiểm tra console.' 
                     : 'Đang tải engine xử lý dữ liệu (15MB)... Vui lòng đợi trong giây lát.'}
                </p>
                {!engineError && <FiLoader className="spin" style={{ marginTop: '16px', fontSize: '1.5rem', color: '#3b82f6' }} />}
            </div>
        );
    }

    return (
        <div style={{ height: '100%', width: '100%', display: 'flex', background: '#f9fafb', overflow: 'hidden' }}>
            <div style={{ width: '40%', display: 'flex', flexDirection: 'column', background: '#fff', borderRight: '1px solid #ddd' }}>
                <div style={{ padding: '16px', borderBottom: '1px solid #ddd', flexShrink: 0 }}><h2 style={{ margin: 0, fontSize: '1.125rem' }}>Chọn Dạng Bài Tập</h2></div>
                <div style={{ flex: 1, padding: '8px', overflowY: 'auto' }}>
                    <ul style={{ margin: 0, padding: 0, listStyle: 'none' }}>
                        {menuTree.map(node => <TreeViewNode key={node.path} node={node} level={1} selection={selection} onSelectionChange={handleSelectionChange} />)}
                    </ul>
                </div>
            </div>
            
            <div style={{ flex: 1, padding: '24px', display: 'flex', flexDirection: 'column', overflowY: 'auto', height: '100%', boxSizing: 'border-box' }}>
                <div style={{ flexShrink: 0 }}>
                    <h2 style={{ fontSize: '1.25rem', fontWeight: 'bold', marginBottom: '8px' }}>Soạn Đề</h2>
                    <SelectionTable selection={selection} onRemove={handleRemoveFromSelection} />
                </div>
                <div style={{ display: 'flex', flexWrap: 'wrap', alignItems: 'center', gap: '16px', padding: '16px 0', margin: '16px 0', borderTop: '1px solid #e5e7eb', borderBottom: '1px solid #e5e7eb', flexShrink: 0 }}>
                    <label htmlFor="num-de" style={{ fontWeight: '500' }}>Số Đề Cần Tạo:</label>
                    <input type="number" id="num-de" value={numDe} onChange={e => setNumDe(parseInt(e.target.value) || 1)} min="1" style={{ width: '6rem', padding: '8px', border: '1px solid #ddd', borderRadius: '4px', textAlign: 'center' }} />
                    <button onClick={handleGenerate} disabled={isLoading || selection.length === 0} style={{ padding: '8px 16px', background: '#2563EB', color: '#fff', border: 'none', borderRadius: '4px', fontWeight: '500', display: 'flex', alignItems: 'center', cursor: (isLoading || selection.length === 0) ? 'not-allowed' : 'pointer', opacity: (isLoading || selection.length === 0) ? 0.7 : 1 }}>
                        {isLoading ? <FiLoader className="spin" style={{ marginRight: '8px' }} /> : <FiRefreshCw style={{ marginRight: '8px' }} />}
                        {isLoading ? 'Đang tạo...' : `Tạo ${numDe} đề`}
                    </button>
                </div>
                <div style={{ flex: 1, overflowY: 'auto', minHeight: 0 }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '8px' }}>
                        <h3 style={{ fontSize: '1.125rem', fontWeight: '600', margin: 0 }}>Kết quả ({results.length} đề):</h3>
                        {results.length > 0 && (
                            <div style={{ display: 'flex', gap: '8px' }}>
                                <button onClick={downloadAllResults} style={{ padding: '6px 12px', background: '#16A34A', color: '#fff', border: 'none', borderRadius: '4px', fontSize: '0.875rem', display: 'flex', alignItems: 'center', cursor: 'pointer' }} title="Tải file Zip chứa từng đề riêng biệt">
                                    <FiDownload style={{ marginRight: '8px' }} />Tải Zip (.zip)
                                </button>
                                <button onClick={downloadMergedResults} style={{ padding: '6px 12px', background: '#2563EB', color: '#fff', border: 'none', borderRadius: '4px', fontSize: '0.875rem', display: 'flex', alignItems: 'center', cursor: 'pointer' }} title="Tải 1 file duy nhất chứa tất cả các đề">
                                    <FiFileText style={{ marginRight: '8px' }} />Tải Gộp (.typ)
                                </button>
                            </div>
                        )}
                    </div>
                    <div style={{ background: '#e5e7eb', padding: '16px', borderRadius: '8px', height: '100%', overflow: 'auto', boxSizing: 'border-box' }}>
                        {isLoading ? <div style={{ textAlign: 'center', padding: '32px' }}><FiLoader className="spin" style={{ display: 'inline-block', fontSize: '1.5rem', color: '#3b82f6' }} /></div> :
                            results.length > 0 ? (
                                results.map((deck, deckIndex) => (
                                    <DeckCard key={deckIndex} deck={deck} onCopy={handleCopyDeck} onSave={handleSaveDeck} />
                                ))
                            ) : (<p style={{ textAlign: 'center', color: '#6B7280', padding: '32px 0' }}>Kết quả sẽ được hiển thị ở đây.</p>)}
                    </div>
                </div>
            </div>
        </div>
    );
}
