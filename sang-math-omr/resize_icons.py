from PIL import Image

img = Image.open('icon.png')
img.resize((192, 192), Image.Resampling.LANCZOS).save('icon-192.png')
img.resize((512, 512), Image.Resampling.LANCZOS).save('icon-512.png')
print("Icons resized")
