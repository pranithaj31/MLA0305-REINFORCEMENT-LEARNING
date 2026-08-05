library(shiny)

ui <- fluidPage(
  
  titlePanel("Addition of Two Numbers"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("num1", "Enter First Number:", value = 0),
      numericInput("num2", "Enter Second Number:", value = 0),
      actionButton("add", "Add")
    ),
    
    mainPanel(
      h3("Result"),
      textOutput("result")
    )
  )
)

server <- function(input, output) {
  
  observeEvent(input$add, {
    
    sum <- input$num1 + input$num2
    
    output$result <- renderText({
      paste("Sum =", sum)
    })
    
  })
  
}

shinyApp(ui = ui, server = server)