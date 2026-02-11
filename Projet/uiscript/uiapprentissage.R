dt <- read.csv2("data/vocabulaire.csv", header = TRUE) #données chargées
fluidPage(
  
  titlePanel("Apprentissage"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "Langue",
        "Langue",
        choices = c(
          "TOUT", unique(dt$Langue)
        )
      ),
      
      radioButtons(
        "Sens",
        "Sens de traduction",
        choices = c(
          "Thème (Étrangère -> Français)",
          "Version (Français -> étrangère)"
        )
      ),
      
      radioButtons(
        "Mode",
        "Mode d'apprentissage",
        choices = c("random", "Renfo")
      ),
      
      selectInput(
        "categorie",
        "Catégorie",
        choices = c("TOUT", unique(dt$Categorie))
      )
    ),
    
    mainPanel(
      
      # Scores en haut à droite du mot à traduire
      fluidRow(
        column(8, textOutput("Traduction")),
        column(4, textOutput("meilleur_score"),
               textOutput("score")
        )
      ),
      
      textInput("Exo", "Traduire le mot :"),
      submitButton("Valider"),
      textOutput("Réponse")
    )
  )
)
