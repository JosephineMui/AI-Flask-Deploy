import gradio as gr

def greet(name, intensity):
    '''
    A simple function that takes a name and an intensity level and returns a greeting message.
    
    "!" * int(intensity) repeats the exclamation mark based on the slider value (e.g., 3 → !!!).

    Final result is both concatenated, so with name="Sam" and intensity=3, output is Hello, Sam!!!.
    int(intensity) is used because the slider value may come in as a non-integer numeric type, and 
    string repetition needs an integer count.
    '''
    return "Hello, " + name + "!" * int(intensity)

demo = gr.Interface(
    fn=greet,
    inputs=["text", "slider"],
    outputs=["text"],
)

demo.launch(server_name="0.0.0.0", server_port= 7860)
