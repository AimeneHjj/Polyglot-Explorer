#louis
dt <- read.csv2("data/vocabulaire.csv", header = TRUE)

sens <- input$Sens
mot_uti <- input$Exo
mot_trad <- output$Traduction

s <- reactiveValues(score = 0, meilleur_score = 0)

if(sens == "Thème (Étrangère -> Français)"){
  rawans <- which(dt$Traduction == mot_uti)[1]
  answ <- as.character(dt[rawans, 1])
}else{ 
  rawans <- which(dt$Mot == mot_uti)[1]
  answ <- as.character(dt[rawans, 2])
}
output$Réponse <- renderText({
  if(answ == mot_trad){
    output$Réponse <- renderText(cat(green("Juste")))
    s$score <- rv$score + 1
    if (s$score >= s$meilleur_score){
        s$meilleur_score <- s$score    
    } 
  } else{
    output$Réponse <- renderText(cat(red("Faux, la réponse était : "), paste0(answ)))
    s$score <- 0
  }
})

output$meilleur_score_ui <- renderText({
  paste0("Meilleur score : ", s$meilleur_score) #Affichage sur meilleur score
})

output$score_ui <- renderText({
  paste0("Score : ", s$score) # Affichage du score 
})