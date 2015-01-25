library(shiny)



shinyServer(function(input, output) {
  nosim = 10000
  
  data <- reactive({  
    
    n <- input$obs
     
    apply(matrix(rnorm(nosim*n), nosim), 1, mean)
  })

  
  output$plot <- renderPlot({
   
    n <- input$obs

    hist(data(), 
         main=paste('Histogram of Sample Averages', input$breaks), breaks = input$breaks
         )
  })

 
  output$meanvar <- renderPrint({
    paste('mean = ', mean(data()), ', variance = ', var(data()))
  })
 
  output$tmeanvar <- renderPrint({
    n <- input$obs
    paste("theorectical mean = ", 0, ", theorectical vairance = 1/n = ", 1/n)
  })
 

})