library(shiny)

# Define UI for application
fluidPage(
  
  # Application title
  titlePanel("Application de Traduction"),
  
  # Création des 4 onglets
  tabsetPanel(
    tabPanel("Présentation",
             "Contenu de l'onglet Présentation"),
    
    tabPanel("Apprentissage",
             "Contenu de l'onglet Apprentissage"),
    
    tabPanel("Paramétrage",
             fluidPage(
               sidebarLayout(
                 sidebarPanel(
                   selectInput("categorie_existante", "Catégorie",
                               choices = c("Animaux", "Verbes", "Objets")), # liste déroulante catégorie
                   textInput("nouvelle_categorie", "Nouvelle catégorie"), # zone d'écriture de la catégorie
                   selectInput("langue", "Langue",
                               choices = c("Anglais")), # liste déroulante de la langue 
                   textInput("nouvelle_langue", "Nouvelle langue") #zone d'écriture de la langue
                 ),
                 mainPanel(
                   h3("Ajouter un mot"), #affiche le titre
                   textInput("mot_fr", "Mot"), #zone d'écriture du mot en français
                   textInput("mot_et", "Mot à traduire"), # zone d'écriture du mot traduit
                   actionButton("Valider_mot", "Valider") # bouton pour valider
                 )
               )
             )),
    
    tabPanel("Crédits",
             "Contenu de l'onglet Crédits")
  )
)