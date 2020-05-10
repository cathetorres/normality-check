
library(shiny)

# Define server logic 
server = function(input, output) {
    var = reactive({
        iris[, input$varchoice]
        
    })
    output$myplot =  renderPlot({
        if (input$plotchoice == "Histogram")
            return(hist(var(), main = "Histogram", xlab = input$varchoice))
        else
            return(qqnorm(var(), main = paste("QQ plot of", input$varchoice)))
    })
    output$mytest = renderPrint({
        shapiro.test(var())
    })
}
