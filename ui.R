library(shiny)
shinyUI(
  fluidPage(theme="bootstrap.css",
    headerPanel("Fractal GIF Maker"),
    sidebarPanel(
      h2('Controls'),
      textInput('formula',"formula:","Z^2+C"),
      numericInput('realmin',"real minimum:",-1.8),
      numericInput('realmax',"real maximum:",0.6),
      numericInput('imagmax',"imaginary minimum:",-1.2),
      numericInput('imagmin',"imaginary maximum:",1.2),
      numericInput('iterations',"iterations:",20,min=0),
      numericInput('res',"resolution:",500),
      numericInput('delay',"delay (.01 seconds):",100),
      p(""),
      actionButton("goButton","MAKE ME A GIF!"),
      h3('Documentation'),
      p("This shiny app let's you create and view gifs of fractals in the complex plane."),
      p("To save a gif: mouse-over -> right-click -> Save Image"),
      h3("The Controls:"),
      tags$ul(
        tags$li(strong("formula:"), "By default this is set to what is called the central difference equation which yields the famous Mandelbrot Set. Play with this! I'm a fan of 'sin(Z+C)' myself."),
        tags$li(strong("real minimum:"),"if you know about complex/imaginery numbers then this should be self-explanatory. If you don't, then think of this as the limit you set on the left."),
        tags$li(strong("real maximum:"),"limit on the right."),
        tags$li(strong("imaginery minimum:"),"limit on bottom."),
        tags$li(strong("imaginery maximum:"),"limit on top."),
        tags$li(strong("iterations:"),"fractal patterns are revealed through iteration. This is the number of iterations that will be calculated. Note: there is one frame per iteration. Minimum: 0."),
        tags$li(strong("resolution:"),"all the gifs this app makes are square. resolution is the length of each side in pixels."),
        tags$li(strong("delay:"),"the time in 1/100ths of a second between frames.")
        ),
      h3("Other Notes:"),
      tags$ul(
        tags$li("If the window you set up is not ",strong("square"), "you will see a distorted view of the fractal."),
        tags$li("No limits have been put on the controls, other than positive iterations."),
        tags$li("Expect longer wait times with higher resolutions or more iterations."),
        tags$li("the default settings may yield a frozen gif, change any one of the parameters and the new gif will run normally. Frozen or not, gifs save properly."),
        tags$li("This app was inspired by an example on R's wikipedia page.")
        )
    ),
    mainPanel(
      imageOutput('oGIF')
    )
))
