// Gọi trực tiếp mitex.wasm (giao thức plugin của Typst) để đổi LaTeX -> mã toán Typst, không cần biên dịch Typst.
let instance, memory, argBuf = [], result

/** source: ArrayBuffer/Uint8Array của mitex.wasm, hoặc undefined để tải từ ./mitex/mitex.wasm cạnh trang. */
export async function initLatex(source) {
  if (instance) return
  let bytes = source
  if (!bytes) {
    const res = await fetch(new URL('mitex/mitex.wasm', document.baseURI))
    if (!res.ok) throw new Error('Không tải được mitex.wasm')
    bytes = await res.arrayBuffer()
  }
  const imports = {
    typst_env: {
      wasm_minimal_protocol_write_args_to_buffer: ptr => {
        let offset = ptr
        for (const arg of argBuf) { new Uint8Array(memory.buffer, offset, arg.length).set(arg); offset += arg.length }
      },
      wasm_minimal_protocol_send_result_to_host: (ptr, len) => { result = new Uint8Array(memory.buffer, ptr, len).slice() },
    },
  }
  const { instance: inst } = await WebAssembly.instantiate(bytes, imports)
  instance = inst
  memory = inst.exports.memory
}

export function latexToTypstMath(src) {
  const bytes = new TextEncoder().encode(src)
  argBuf = [bytes, new Uint8Array(0)]
  const code = instance.exports.convert_math(bytes.length, 0)
  const out = new TextDecoder().decode(result)
  if (code !== 0) throw new Error(`LaTeX không hợp lệ: ${out}`)
  return out
}
