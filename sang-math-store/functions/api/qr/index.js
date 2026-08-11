export async function onRequestGet({ request }) {
  const url = new URL(request.url);
  const targetUrl = url.searchParams.get("url");
  if (!targetUrl || !targetUrl.startsWith("https://img.vietqr.io/")) {
    return new Response("Invalid URL", { status: 400 });
  }

  const response = await globalThis.fetch(targetUrl);
  const newResponse = new Response(response.body, response);
  newResponse.headers.set("Access-Control-Allow-Origin", "*");
  newResponse.headers.set("Cross-Origin-Resource-Policy", "cross-origin");
  // Set cache control for images
  newResponse.headers.set("Cache-Control", "public, max-age=86400");
  return newResponse;
}
