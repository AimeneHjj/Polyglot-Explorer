library(shiny)

fluidPage(
  h3("Ajouter un mot"), #affiche le titre
  textInput("mot_fr", "Mot"), #zone d'écriture du mot en français
  textInput("mot_et", "Mot a traduire"),# zone d'ecriture du mot traduit
  textInput("nouvelle_categorie", "Nouvelle catégorie"),
  selectInput("categorie_existante", "Catégorie",
              choices = c("Animaux", "Verbes", "Objets")),
  textInput("nouvelle_langue", "Nouvelle langue"),
  selectInput("langue", "Langue",
              choices = c("Anglais")),
  actionButton("Valider_mot", "Valider")