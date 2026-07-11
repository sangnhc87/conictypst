class TFGrader {
    constructor() {
        this.model = null;
    }
    
    async loadModel(url) {
        if (!this.model) {
            console.log("Loading TFJS model from", url);
            try {
                this.model = await tf.loadGraphModel(url);
                console.log("TFJS model loaded successfully!");
            } catch(e) {
                console.error("Failed to load TFJS model", e);
            }
        }
    }
    
    // returns 0 (Empty), 1 (Filled), 2 (Invalid)
    predictBubble(imageData, width, height) {
        if (!this.model) return -1;
        
        return tf.tidy(() => {
            // Convert imageData to tensor
            // imageData is an array of RGBA, we need grayscale 32x32
            // Let's assume imageData is an ImageData object or we just pass the cv.Mat cropped
            let tensor = tf.browser.fromPixels(imageData, 1);
            
            // Resize to 32x32
            tensor = tf.image.resizeBilinear(tensor, [32, 32]);
            
            // Normalize
            tensor = tensor.toFloat().div(tf.scalar(255.0));
            
            // Expand dims for batch
            tensor = tensor.expandDims(0);
            
            const prediction = this.model.predict(tensor);
            const data = prediction.dataSync();
            const maxIdx = data.indexOf(Math.max(...data));
            return maxIdx;
        });
    }
}

window.TFGraderInstance = new TFGrader();
