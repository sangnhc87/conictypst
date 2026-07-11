import keras
model = keras.models.load_model('bubble_model.h5')
model.export('saved_model')
