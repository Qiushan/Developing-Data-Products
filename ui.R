library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Demonstration of the Distribution Pattern of Sample Means"),
  sidebarPanel(
    sliderInput("obs", "Sample Size:", min =1, max = 1000, value = 500),
    numericInput("breaks", "Number of breaks on the Histogram(Max 30):", value = 20, min = 0, max = 30, step = 1)
  ),
  mainPanel(
    h4('For this shiny project, I present a theme visited by the project in a previous class "Statistical Inferences". In the app I demonstrate the 
	distribution pattern of the sample means of standard normal distribution by calculating a ten thousand sample means. 
	The sample size are set by the by slider bar in the side bar panel on the left and the user can specify the breaks of the histogram as well. The resulting 
	mean and standard deviation are compared to the theoretical values.'),
    	plotOutput("plot"),
        verbatimTextOutput("meanvar"),
        verbatimTextOutput("tmeanvar")
  )
)
)