library(shiny)
shinyUI(
fluidPage(
  
  titlePanel("Application de Traduction"),
  
  # Création des 4 onglets
  tabsetPanel( id="maintab",
    tabPanel("Présentation",
             source("uiscript/uipresentation.R", local=TRUE)$value),
    
    tabPanel("Apprentissage", source("uiscript/uiapprentissage.R", local=TRUE)$value),
    
    tabPanel("Paramétrage", source("uiscript/uiparamétrage.R", local=TRUE)$value),
    
    tabPanel("Crédits",
             source("uiscript/uicredit.R", local=TRUE)$value)
  )
)
)