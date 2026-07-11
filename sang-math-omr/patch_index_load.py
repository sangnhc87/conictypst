with open("index.html", "r") as f:
    text = f.read()

target = """        window.OmrEngine.onReady = () => {
            console.log("OpenCV is ready!");
            opencvReady = true;"""

replacement = """        window.OmrEngine.onReady = () => {
            console.log("OpenCV is ready!");
            opencvReady = true;
            
            // Tải mô hình Deep Learning AI 
            if (window.TFGraderInstance) {
                window.TFGraderInstance.loadModel('tfjs_model/model.json');
            }"""

if target in text:
    text = text.replace(target, replacement)
    with open("index.html", "w") as f:
        f.write(text)
    print("Success")
else:
    print("Target not found")
