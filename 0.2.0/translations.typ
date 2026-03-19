// =============== i18n =====================
// --------- Given Translations -------------
#let translations = state(
  "translations",
  (
    fr: (
      toc: "Table des Matières",
      ingredients: "INGRÉDIENTS",
      preparation: "PRÉPARATION",
      notes: "NOTES DU CHEF"
    ),
    en: (
      toc: "Table of Contents",
      ingredients: "INGREDIENTS",
      preparation: "PREPARATION",
      notes: "CHEF'S NOTES"
    ),
    es: (
      toc: "Tabla de Contenido",
      ingredients: "INGREDIENTES",
      preparation: "PREPARACIÓN",
      notes: "NOTAS DEL CHEF"
    ),
    por: (
      toc: "Índice",
      ingredients: "INGREDIENTES",
      preparation: "PREPARAÇÃO",
      notes: "NOTAS DO CHEF"
    )
  )
)

// -------------- Gears of translation --------------------
// like an enum to use when needed
#let i18n = (
  toc: "toc",
  ingredients: "ingredients",
  preparation: "preparation",
  notes: "notes"
)

// Add translation from cookbook function
#let update-translation(t) = context {
  let base = translations.get()
  let merged = base
  merged += t
  translations.update(merged)
}

// translate the labels with text.lang ("en" by default)
#let translate(key) = context {
  let lang = if text.lang != none {
      text.lang
    } else {
      "en"
    }
  let dict = translations.get().at(lang, default: translations.get().at("en"))
  dict.at(key, default: key)
}