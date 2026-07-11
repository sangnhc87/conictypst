with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Add manifest
if '<link rel="manifest"' not in content:
    content = content.replace('</title>', '</title>\n    <link rel="manifest" href="./manifest.json">')

# Add service worker registration
sw_script = """
    <script>
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', function() {
                navigator.serviceWorker.register('./sw.js').then(function(registration) {
                    console.log('ServiceWorker registration successful with scope: ', registration.scope);
                }, function(err) {
                    console.log('ServiceWorker registration failed: ', err);
                });
            });
        }
    </script>
"""
if 'serviceWorker' not in content:
    content = content.replace('</body>', sw_script + '</body>')

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
