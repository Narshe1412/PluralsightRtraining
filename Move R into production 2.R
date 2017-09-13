library(shiny)

ui <- fluidPage(
  titlePanel("Input Output"), 
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "num",
        label = "Choose a number",
        min = 0,
        max = 100,
        value = 25
      )
    ),
    mainPanel(
      textOutput(
        outputId = "text"
      )
    )
  )
  
)

server <- function(input, output) {
  output$text <- renderText({
    paste("You selected", input$num)
  })
}

shinyApp(
  ui = ui,
  server = server
)

