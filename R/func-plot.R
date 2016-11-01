scale_fill_delinquent <- function(name = "Delinquent Past Due") {
  scale_fill_brewer(
    name = name,
    type = "qual",
    palette = "Set1",
    direction = -1
  )
}
