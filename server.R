library(caTools) # external package providing write.gif function
jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F",
                                 "yellow", "#FF7F00", "red", "#7F0000"))

shinyServer(
  function(input, output) {
    output$oGIF <- renderImage({
      input$goButton
      isolate({
      real <- rep(seq(input$realmin,input$realmax, 
                   length.out=input$res),
                  each=input$res)
      
      imag <- rep(seq(input$imagmin,input$imagmax,
                   length.out=input$res),
                  input$res)
      
      C <- complex(real=real,imag=imag)
      C <- matrix(C,input$res,input$res)
      Z <- 0
      X <- array(0, c(input$res,input$res,input$iterations))
      formula <- parse(text=input$formula)
      for (k in 1:input$iterations) {
        Z <- eval(formula)
        X[,,k] <- exp(-abs(Z)) # capture results
      }
      
      ## Now we make our GIF
      write.gif(X,
                "Mandelbrot.gif",
                col=jet.colors,
                delay=input$delay)
      ## And finally return a list containing the filename
      list(src = "Mandelbrot.gif",
           #contentType='image/gif',
           width=input$res,
           height=input$res,
           alt="This is alternate text")
      })
    },deleteFile=TRUE)
  }
)