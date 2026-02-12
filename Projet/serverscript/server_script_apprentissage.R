data_filtre<-reactive({
  #filtre le tableau par langue choisi
  if (input$Langue == "TOUT"){
    dt_filtre<-dt 
  }
  else {
    dt_filtre<-dt[dt$Langue == input$Langue,]}
  #sélectionne la colonne mot ou traduction du tableau ddéjà filtrer
  if(input$Sens == "Étrangère -> Français"){
    dt_reduit<-dt_filtre[,c("Traduction","Categorie")]}
  else {
    dt_reduit<-dt_filtre[,c("Mot","Categorie")]}
  #Sélectionne dans le tableau réduit les mots appartenant à la bonne catégorie
  if (input$categorie=="TOUT"){
    dt_final<-dt_reduit}
  else {
    dt_final<-dt_reduit[dt_reduit$Categorie == input$categorie,]
  }
})
#Tirage d'un mot aléatoire
mot<-eventReactive(input$Tirer,{
  df<- data_filtre()
  if (nrow(df) == 0) return(NULL)
  if (input$Mode == "Random"){
    ligne<- df[sample(nrow(df),1),]}
  else {
    indices <- as.integer(rownames(df))
    p <- poids()[indices]
    ligne_int <- sample(nrow(df), 1, prob = p)
    ligne<- df[ligne_int, ]
    mot_index(indices[ligne_int])
  }
  return(ligne)
})

output$Traduction <- renderText({
  req(mot())
  if(input$Sens == "Étrangère -> Français"){
    paste("Mot à traduire :", mot()[[1]])
  } else {
    rawans <- which(dt$Mot == mot()[[1]])[1]
    langue_mot <- as.character(dt[rawans, "Langue"])
    paste0("Mot à traduire : ", mot()[[1]], " (", langue_mot, ")")
    
  }
})