s <- reactiveValues(score = 0, meilleur_score = 0)
reponse_text <- reactiveVal("")

answer <- reactive({
  if(input$Sens == "Étrangère -> Français"){
    rawans <- which(dt$Traduction == mot()[[1]])[1]
    answ <- as.character(dt[rawans, 1])
  }else{ 
    rawans <- which(dt$Mot == mot()[[1]])[1]
    answ <- as.character(dt[rawans, 2])
  }})
observeEvent(input$Valider, {
  idx <- mot_index()
  
  if(answer() == input$Exo){
    reponse_text("Juste")
    s$score <- s$score + 1
    if (s$score >= s$meilleur_score){
      s$meilleur_score <- s$score    
    }
      p <- poids()
      p[idx] <- max(1, p[idx] - 1)
      poids(p)
    }else{
      reponse_text(paste0("Faux, la réponse était : ", answer()))
      s$score <- 0
      p <- poids()
      p[idx] <- p[idx] + 2
      poids(p)
    
  }
})

output$Réponse <- renderText({
  reponse_text()
})

output$meilleur_score <- renderText({
  paste0("Meilleur score : ", s$meilleur_score) #Affichage sur meilleur score
})

output$score <- renderText({
  paste0("Score : ", s$score) # Affichage du score 
})
