dt <- read.csv2("data/vocabulaire.csv", header = TRUE)

s <- reactiveValues(score = 0, meilleur_score = 0)

answer <- reactive({
  if(input$Sens == "Étrangère -> Français"){
    rawans <- which(dt$Traduction == mot()[[1]])[1]
    answ <- as.character(dt[rawans, 1])
  }else{ 
    rawans <- which(dt$Mot == output$Traduction)[1]
    answ <- as.character(dt[rawans, 2])
  }})
observeEvent(input$Valider, {
  if(answer() == input$Exo){
    output$Réponse <- renderText(paste0(("Juste")))
    s$score <- s$score + 1
    if (s$score >= s$meilleur_score){
      s$meilleur_score <- s$score    
    } } 
  else{
    output$Réponse <- renderText(paste0(("Faux, la réponse était : "), paste0(answer())))
    s$score <- 0
  }
}
)

output$meilleur_score <- renderText({
  paste0("Meilleur score : ", s$meilleur_score) #Affichage sur meilleur score
})

output$score <- renderText({
  paste0("Score : ", s$score) # Affichage du score 
})
