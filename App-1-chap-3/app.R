# GROUP 24: ENGELBRECHT TOBIAS, ITZKOWICHT SACHA, MAISTRE ELISE
# hosted on github: https://github.com/tobiasengelbrecht/shinyExample

library(shiny)

# Define UI ----    
ui <- fluidPage(
  titlePanel("censusVis"),
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with information from the 2010 US Census."),
      selectInput("var", 
        label = "Choose a variable to display",
        choices = list("Percent White" = 1, 
                       "Percent Black" = 2,
                       "Percent Hispanic" = 3,
                       "Percent Asian" = 4), selected = 1),
     
      sliderInput("range", 
          label = "Range of interest:",
          min = 0, max = 100, value = c(0,100))
    ),
    
    mainPanel(
      fluidRow(
        column(3,
              h3("Buttons"),
              actionButton("action", "Action"),
              br(),
              br(), 
              submitButton("Submit")),
        
        column(3,
              h3("Single checkbox"),
              checkboxInput("checkbox", "Choice A", value = TRUE)),
        
        column(3, 
              checkboxGroupInput("checkGroup", 
                                  h3("Checkbox group"), 
                                  choices = list("Choice 1" = 1, 
                                                "Choice 2" = 2, 
                                                "Choice 3" = 3),
                                  selected = 1)),
        
        column(3, 
              dateInput("date", 
                        h3("Date input"), 
                        value = "2014-01-01"))   
      ),
      
      fluidRow(
        
        column(3,
              dateRangeInput("dates", h3("Date range"))),
        
        column(3,
              fileInput("file", h3("File input"))),
        
        column(3, 
              h3("Help text"),
              helpText("Note: help text isn't a true widget,", 
                        "but it provides an easy way to add text to",
                        "accompany other widgets.")),
        
        column(3, 
              numericInput("num", 
                            h3("Numeric input"), 
                            value = 1))   
      ),
      
      fluidRow(
        
        column(3,
              radioButtons("radio", h3("Radio buttons"),
                            choices = list("Choice 1" = 1, "Choice 2" = 2,
                                          "Choice 3" = 3),selected = 1)),
        
        column(3,
              selectInput("select", h3("Select box"), 
                          choices = list("Choice 1" = 1, "Choice 2" = 2,
                                          "Choice 3" = 3), selected = 1)),
        
        column(3, 
              sliderInput("slider1", h3("Sliders"),
                          min = 0, max = 100, value = 50),
              sliderInput("slider2", "",
                          min = 0, max = 100, value = c(25, 75))
        ),
        
        column(3, 
              textInput("text", h3("Text input"), 
                        value = "Enter text..."))   
      )
  

    )
  )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)