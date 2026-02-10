fluidPage(
    # PREMIER ONGLET : L'outil technique
    tabPanel("Analyse Visuelle", 
             sidebarLayout(
               sidebarPanel(
                 h4("Paramètres"),
                 sliderInput("bins", "Niveau de détail :", 1, 30, 10),
                 hr(),
                 p("Développé par Brayane SIMO", style = "font-style: italic;")
               ),
               mainPanel(
                 plotOutput("graphiqueMots"),
                 tableOutput("tableauApercu")
               )
             )
    ),