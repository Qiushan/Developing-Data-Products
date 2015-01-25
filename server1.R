library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output) {

  # Reactive expression to generate the requested distribution. This is 
  # called whenever the inputs change. The output renderers defined 
  # below then all used the value computed from this expression
  data <- reactive({  
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)
    nosim <- 10000
    n <- input$obs

    dist <- apply(matrix(rexp(nosim*n, 0.2), nosim), 1, mean)
  })

  # Generate a plot of the data. Also uses the inputs to build the 
  # plot label. Note that the dependencies on both the inputs and
  # the data reactive expression are both tracked, and all expressions 
  # are called in the sequence implied by the dependency graph
  output$plot <- renderPlot({
    dist <- input$dist
    nosim <- 10000
    n <- input$obs

    hist(data(), 
         main=paste('Histogram of r', dist, '(', n, ')', sep=''), breaks = input$breaks)
  })

  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(data())
  })

})