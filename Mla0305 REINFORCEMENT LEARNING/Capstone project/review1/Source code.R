#-------------------- SERVER --------------------#

server <- function(input, output) {
  
  # Dataset Generation
  
  dataset <- eventReactive(input$generate, {
    
    set.seed(123)
    
    data.frame(
      
      Agent_ID = 1:input$n,
      
      Health = sample(50:100, input$n, replace = TRUE),
      
      Energy = sample(20:100, input$n, replace = TRUE),
      
      Food_Level = sample(0:100, input$n, replace = TRUE),
      
      Water_Level = sample(0:100, input$n, replace = TRUE),
      
      Threat_Level = sample(1:10, input$n, replace = TRUE),
      
      Resource_Available = sample(0:50, input$n, replace = TRUE),
      
      Distance_to_Shelter = round(runif(input$n,0,100),2),
      
      Survival_Score = round(runif(input$n,40,100),2),
      
      Action = sample(
        c(
          "Move",
          "Search Food",
          "Search Water",
          "Rest",
          "Fight",
          "Hide"
        ),
        input$n,
        replace = TRUE
      )
      
    )
    
  })
  
  
  # Dataset Preview
  
  output$table <- renderDT({
    
    req(dataset())
    
    datatable(
      dataset(),
      options = list(pageLength = 10)
    )
    
  })
  
  
  # Summary
  
  output$summary <- renderPrint({
    
    req(dataset())
    
    summary(dataset())
    
  })
  
  
  # Download CSV
  
  output$download <- downloadHandler(
    
    filename = function(){
      "Project_Exodus_Dataset.csv"
    },
    
    content = function(file){
      
      write.csv(
        dataset(),
        file,
        row.names = FALSE
      )
      
    }
    
  )
  
  
  #---------------- Line Graph ----------------#
  
  output$linePlot <- renderPlot({
    
    req(dataset())
    
    plot(
      dataset()$Agent_ID,
      dataset()$Survival_Score,
      type="l",
      col="blue",
      main="Survival Score Trend",
      xlab="Agent ID",
      ylab="Survival Score"
    )
    
  })
  
  
  #---------------- Bar Chart ----------------#
  
  output$barPlot <- renderPlot({
    
    req(dataset())
    
    avg <- c(
      mean(dataset()$Health),
      mean(dataset()$Energy),
      mean(dataset()$Food_Level),
      mean(dataset()$Water_Level)
    )
    
    barplot(
      avg,
      names.arg=c(
        "Health",
        "Energy",
        "Food",
        "Water"
      ),
      col="green",
      main="Average Parameters",
      ylab="Value"
    )
    
  })
  
  
  #---------------- Histogram Plot ----------------#
  
  output$histPlot <- renderPlot({
    
    req(dataset())
    
    hist(
      dataset()$Survival_Score,
      col="skyblue",
      border="black",
      main="Histogram of Survival Score",
      xlab="Survival Score",
      ylab="Frequency"
    )
    
  })
  
  
  #---------------- Box Plot ----------------#
  
  output$boxPlot <- renderPlot({
    
    req(dataset())
    
    boxplot(
      dataset()$Health,
      col="lightgreen",
      main="Box Plot of Health",
      ylab="Health Level"
    )
    
  })
  
  
  #---------------- Scatter Plot ----------------#
  
  output$scatterPlot <- renderPlot({
    
    req(dataset())
    
    plot(
      dataset()$Energy,
      dataset()$Survival_Score,
      pch=19,
      col="blue",
      main="Energy vs Survival Score",
      xlab="Energy",
      ylab="Survival Score"
    )
    
  })
  
  
  #---------------- Heatmap Plot ----------------#
  
  output$heatmapPlot <- renderPlot({
    
    req(dataset())
    
    numeric_data <- dataset()[,
                              sapply(dataset(),is.numeric)]
    
    correlation <- cor(numeric_data)
    
    heatmap(
      correlation,
      col=heat.colors(20),
      main="Correlation Heatmap"
    )
    
  })
  
}


#-------------------- RUN APP --------------------#

shinyApp(
  ui = ui,
  server = server
)
