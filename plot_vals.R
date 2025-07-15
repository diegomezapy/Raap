#' Graficar un vector de 10 valores
#' @param vals Numeric vector
#' @export
plot_vals <- function(vals) {
  if (!is.numeric(vals) || length(vals) != 10)
    stop("´vals´ debe ser un vector numérico de longitud 10")
  plot(
    vals, type = "b",
    main = "Valores ingresados",
    xlab = "Índice (1–10)",
    ylab = "Valor"
  )
}
