// src/components/shared/AppButton.jsx
import clsx from 'clsx';

const AppButton = ({ children, onClick, variant = 'primary', size = 'sm', className, ...props }) => {
    const baseClasses = 'font-semibold rounded-md shadow-sm transition-colors flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed';
    
    const variantClasses = {
        primary: 'bg-blue-600 hover:bg-blue-700 text-white',
        danger: 'bg-red-600 hover:bg-red-700 text-white',
        secondary: 'bg-gray-500 hover:bg-gray-600 text-white',
        warning: 'bg-yellow-500 hover:bg-yellow-600 text-black',
        success: 'bg-green-600 hover:bg-green-700 text-white',
        outline: 'bg-white text-gray-700 border border-gray-300 hover:bg-gray-50',
    };

    const sizeClasses = {
        sm: 'px-3 py-1.5 text-xs',
        md: 'px-4 py-2 text-sm',
    };

    return (
        <button
            onClick={onClick}
            className={clsx(baseClasses, variantClasses[variant], sizeClasses[size], className)}
            {...props}
        >
            {children}
        </button>
    );
};
export default AppButton;