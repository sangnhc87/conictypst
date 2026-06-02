/**
 * XepGheApp — Router chính cho module Xếp Ghế.
 * Dùng state-based routing (không cần react-router).
 */

import React, { useState } from 'react'
import Home from './pages/Home.jsx'
import RowSinglePage from './pages/RowSinglePage.jsx'
import RowDoublePage from './pages/RowDoublePage.jsx'

export default function XepGheApp() {
    const [page, setPage] = useState({ id: 'home', props: {} })

    function navigate(id, props = {}) {
        setPage({ id, props })
        // Cuộn lên đầu
        window.scrollTo({ top: 0, behavior: 'smooth' })
    }

    return (
        <div className="min-h-screen bg-gray-50">
            {/* Top bar */}
            <div className="bg-white border-b border-gray-200 sticky top-0 z-10 shadow-sm">
                <div className="max-w-7xl mx-auto px-4 py-2 flex items-center gap-3">
                    <button
                        type="button"
                        onClick={() => navigate('home')}
                        className="text-sm font-bold text-blue-700 hover:text-blue-900 flex items-center gap-1.5"
                    >
                        🪑 Xếp Ghế
                    </button>
                    <span className="text-gray-300">/</span>

                    {page.id !== 'home' && (
                        <span className="text-sm text-gray-500 truncate">
                            {page.id === 'row-single-plain' && '1 Hàng Ngang'}
                            {page.id === 'row-single-blank' && '1 Hàng + Ghế Trống'}
                            {page.id === 'row-double' && '2 Hàng Đối Diện'}
                        </span>
                    )}

                    <div className="ml-auto flex items-center gap-2 text-xs text-gray-400">
                        <span className="hidden sm:inline">Trình chiếu giảng dạy · PIE + Đặc trưng cột</span>
                    </div>
                </div>
            </div>

            {/* Nội dung trang */}
            {page.id === 'home' && (
                <Home onNavigate={navigate} />
            )}

            {(page.id === 'row-single-plain' || page.id === 'row-single-blank') && (
                <RowSinglePage
                    key={page.id}
                    hasBlank={page.id === 'row-single-blank'}
                    onNavigate={navigate}
                />
            )}

            {page.id === 'row-double' && (
                <RowDoublePage onNavigate={navigate} />
            )}
        </div>
    )
}
