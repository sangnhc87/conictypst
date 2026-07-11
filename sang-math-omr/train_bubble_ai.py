import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models
from PIL import Image, ImageDraw, ImageFilter
import random
import os

print("Generating dataset...")
def draw_base_bubble():
    img = Image.new('L', (32, 32), color=255)
    draw = ImageDraw.Draw(img)
    draw.ellipse([4, 4, 28, 28], outline=random.randint(50, 150), width=1)
    # Don't need text for CNN, it just learns the circle
    return img, draw

def add_noise(img):
    if random.random() > 0.5:
        img = img.filter(ImageFilter.GaussianBlur(radius=random.uniform(0, 1.0)))
    img_arr = np.array(img)
    noise = np.random.randint(-20, 20, img_arr.shape)
    img_arr = np.clip(img_arr + noise, 0, 255).astype(np.uint8)
    return Image.fromarray(img_arr)

X = []
y = []

# Class 0: Empty
# Class 1: Filled
# Class 2: Crossed/Erased (Invalid)

def generate_empty():
    img, _ = draw_base_bubble()
    # sometimes slight smudge
    if random.random() > 0.8:
        draw = ImageDraw.Draw(img)
        ox, oy = random.randint(10, 20), random.randint(10, 20)
        draw.line([ox, oy, ox+random.randint(1,5), oy+random.randint(1,5)], fill=200, width=1)
    return add_noise(img)

def generate_filled():
    img, draw = draw_base_bubble()
    ox, oy = random.randint(-2, 2), random.randint(-2, 2)
    radius = random.randint(8, 12)
    cx, cy = 16+ox, 16+oy
    draw.ellipse([cx-radius, cy-radius, cx+radius, cy+radius], fill=random.randint(20, 90))
    return add_noise(img)

def generate_invalid():
    img, draw = draw_base_bubble()
    if random.random() > 0.5: # Cross
        ox, oy = random.randint(-3, 3), random.randint(-3, 3)
        draw.line([6+ox, 6+oy, 26+ox, 26+oy], fill=random.randint(20, 100), width=random.randint(1, 3))
        draw.line([26+ox, 6+oy, 6+ox, 26+oy], fill=random.randint(20, 100), width=random.randint(1, 3))
    else: # Smudge/Eraser
        cx, cy = 16, 16
        draw.ellipse([cx-10, cy-10, cx+10, cy+10], fill=180) # light gray
        for _ in range(5):
            ox, oy = random.randint(6, 26), random.randint(6, 26)
            draw.ellipse([ox-2, oy-2, ox+2, oy+2], fill=random.randint(100, 150))
    return add_noise(img)

for _ in range(3000):
    X.append(np.array(generate_empty()))
    y.append(0)
    X.append(np.array(generate_filled()))
    y.append(1)
    X.append(np.array(generate_invalid()))
    y.append(2)

X = np.array(X, dtype=np.float32) / 255.0
X = np.expand_dims(X, axis=-1)
y = np.array(y)

print("Building model...")
model = models.Sequential([
    layers.InputLayer(shape=(32, 32, 1)),
    layers.Conv2D(16, (3, 3), activation='relu'),
    layers.MaxPooling2D((2, 2)),
    layers.Conv2D(32, (3, 3), activation='relu'),
    layers.MaxPooling2D((2, 2)),
    layers.Flatten(),
    layers.Dense(32, activation='relu'),
    layers.Dense(3, activation='softmax')
])

model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

print("Training model...")
model.fit(X, y, epochs=5, batch_size=64, validation_split=0.2)

model.save('bubble_model.h5')
print("Model saved to bubble_model.h5")
