library(shiny)

ui <- fluidPage("Hello world")
server <- function(input, output) {}

shinyApp(
  ui= ui,
  server = server
)

