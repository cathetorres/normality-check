
library(shiny)

# Define UI
ui <- fluidPage(
    titlePanel("Check the normality of the iris data"),
    sidebarLayout(
        sidebarPanel(
            selectInput(
                "varchoice",
                "Choose the variable for which you want to check the normality",
                choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
            ),
            radioButtons(
                "normchoice",
                "How do you want to check the normality?",
                choices = c("Plots", "Tests"),
                selected = "Plots"
            ),
            conditionalPanel(
                "input.normchoice == 'Plots'",
                selectInput(
                    "plotchoice",
                    "Choose which plot you want",
                    choices = c("Histogram", "QQ-Plot")
                )
            )
        ),
        mainPanel(
            conditionalPanel("input.normchoice == 'Plots'", plotOutput("myplot")),
            conditionalPanel("input.normchoice == 'Tests'", verbatimTextOutput("mytest"))
        )
    )
)