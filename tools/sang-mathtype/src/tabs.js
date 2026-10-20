// Chuyển giữa các thẻ lớn: Công thức / Trộn đề / Làm đẹp đề / Vẽ hình. Mỗi thẻ là một <main> riêng.
const $ = id => document.getElementById(id)
let examViewId = null

/** Ghi nhận khung "Đề thi" của chế độ đang chạy (app Mac: examView, add-in: examWebView) và bật hai thẻ Trộn đề/Làm đẹp. */
export function registerExam(id) {
  examViewId = id
  $('tabExam').hidden = false
  $('tabBeautify').hidden = false
}

export function showView(name) {
  for (const id of ['formulaView', 'figureView', 'examView', 'examWebView', 'toolsView']) $(id).hidden = true
  const exam = name === 'exam' || name === 'beautify'
  const target = exam ? examViewId : name === 'figure' ? 'figureView' : name === 'tools' ? 'toolsView' : 'formulaView'
  if (target) $(target).hidden = false
  $('topbar').hidden = name !== 'formula'
  window.dispatchEvent(new CustomEvent('sm-view', { detail: name }))
  document.body.dataset.exmode = name === 'beautify' ? 'beautify' : 'shuffle'
  for (const [tab, n] of [['tabFormula', 'formula'], ['tabExam', 'exam'], ['tabBeautify', 'beautify'], ['tabFigure', 'figure'], ['tabTools', 'tools']]) $(tab).classList.toggle('on', n === name)
}
