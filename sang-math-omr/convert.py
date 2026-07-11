import tensorflow as tf
import tensorflowjs as tfjs

# Load model
model = tf.keras.models.load_model('bubble_model.h5')

# Save as tfjs
tfjs.converters.save_keras_model(model, 'tfjs_model')
print("Saved to tfjs_model")
