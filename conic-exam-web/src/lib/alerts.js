import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

const base = {
  buttonsStyling: false,
  customClass: {
    popup: 'conic-alert',
    confirmButton: 'button button--primary',
    cancelButton: 'button button--secondary',
    actions: 'conic-alert__actions',
  },
};

export async function confirmAction({ title, text, confirmText = 'Xác nhận', danger = false }) {
  const result = await Swal.fire({
    ...base,
    icon: danger ? 'warning' : 'question',
    title,
    text,
    showCancelButton: true,
    reverseButtons: true,
    confirmButtonText: confirmText,
    cancelButtonText: 'Quay lại',
    customClass: {
      ...base.customClass,
      confirmButton: `button button--${danger ? 'danger' : 'primary'}`,
    },
  });
  return result.isConfirmed;
}

export async function typedConfirmAction({
  title,
  text,
  expectedText,
  confirmText = 'Xác nhận',
  danger = true,
}) {
  const expected = String(expectedText || '').trim();
  const result = await Swal.fire({
    ...base,
    icon: danger ? 'warning' : 'question',
    title,
    text,
    input: 'text',
    inputLabel: `Nhập ${expected} để xác nhận`,
    inputPlaceholder: expected,
    showCancelButton: true,
    reverseButtons: true,
    confirmButtonText: confirmText,
    cancelButtonText: 'Quay lại',
    inputValidator: (value) => String(value || '').trim().toLocaleUpperCase('vi-VN') === expected.toLocaleUpperCase('vi-VN')
      ? undefined
      : `Vui lòng nhập đúng ${expected}.`,
    customClass: {
      ...base.customClass,
      confirmButton: `button button--${danger ? 'danger' : 'primary'}`,
    },
  });
  return result.isConfirmed;
}

export function toastSuccess(title) {
  return Swal.fire({
    ...base,
    toast: true,
    position: 'top-end',
    icon: 'success',
    title,
    showConfirmButton: false,
    timer: 2600,
    timerProgressBar: true,
  });
}

export function warningAlert(title, text) {
  return Swal.fire({ ...base, icon: 'warning', title, text, confirmButtonText: 'Đã hiểu' });
}
