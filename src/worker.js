const ASSET_PATH_RE = /\/[^/]+\.[^/]+$/

export default {
  async fetch(request, env) {
    const url = new URL(request.url)
    const accept = request.headers.get('accept') || ''
    const isAssetRequest = ASSET_PATH_RE.test(url.pathname)
    const isHtmlNavigation =
      (request.method === 'GET' || request.method === 'HEAD') &&
      (url.pathname === '/' || (!isAssetRequest && accept.includes('text/html')))

    const assetUrl = isHtmlNavigation ? new URL('/index.html', url).toString() : request.url
    const response = await env.ASSETS.fetch(assetUrl, request)

    return new Response(response.body, response)
  },
}