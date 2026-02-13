library(shiny)

shinyServer(

function(input, output, session){
  
  dt <- read.csv2("data/vocabulaire.csv", header = TRUE)
  
  poids <- reactiveVal(rep(1, nrow(dt)))
  mot_index <- reactiveVal(NULL)
  
  source("serverscript/server_script_apprentissage.R", local = TRUE)
  source("serverscript/server_verif_mot.R", local = TRUE)
  source("serverscript/Server_Ajout.R", local = TRUE)

  observeEvent(input$go_apprentissage,{
    updateTabsetPanel(inputId = "maintab", selected = "Apprentissage")
  })

})

