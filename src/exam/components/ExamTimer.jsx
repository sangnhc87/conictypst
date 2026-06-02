/**
 * ExamTimer.jsx
 * Countdown timer component.
 * Shows  MM:SS  in a colour-coded badge:
 *   > 5 min  → neutral
 *   ≤ 5 min  → amber
 *   ≤ 1 min  → red + pulse
 *   00:00    → expired
 */
import React, { useEffect, useRef, useState } from 'react';

export default function ExamTimer({ totalSeconds, onExpire }) {
    const [remaining, setRemaining] = useState(totalSeconds ?? 0);
    const intervalRef = useRef(null);
    const expiredRef = useRef(false);

    useEffect(() => {
        setRemaining(totalSeconds ?? 0);
        expiredRef.current = false;
    }, [totalSeconds]);

    useEffect(() => {
        if (!totalSeconds) return;
        intervalRef.current = setInterval(() => {
            setRemaining(prev => {
                if (prev <= 1) {
                    clearInterval(intervalRef.current);
                    if (!expiredRef.current) {
                        expiredRef.current = true;
                        onExpire?.();
                    }
                    return 0;
                }
                return prev - 1;
            });
        }, 1000);
        return () => clearInterval(intervalRef.current);
    }, [totalSeconds, onExpire]);

    const mins = Math.floor(remaining / 60);
    const secs = remaining % 60;
    const label = `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;

    const urgent = remaining <= 60 && remaining > 0;
    const warning = remaining <= 300 && !urgent;
    const expired = remaining === 0;

    const colorCls = expired ? 'bg-gray-400 text-white'
        : urgent ? 'bg-red-500 text-white animate-pulse'
            : warning ? 'bg-amber-400 text-white'
                : 'bg-blue-600 text-white';

    return (
        <span
            className={`inline-flex items-center gap-1.5 rounded-full px-3 py-0.5 text-sm font-mono font-semibold ${colorCls}`}
            title="Thời gian còn lại"
        >
            <span>⏱</span>
            <span>{label}</span>
        </span>
    );
}
