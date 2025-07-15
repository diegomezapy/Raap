#' Calcular estadísticas descriptivas
#' @param vals Numeric vector
#' @return Named vector con media, mediana y desviación estándar
#' @export
calc_stats <- function(vals) {
  if (!is.numeric(vals)) stop("´vals´ debe ser numérico")
  if (length(vals) != 10) stop("Se requieren exactamente 10 valores")
  stats <- c(
    media   = mean(vals),
    mediana = median(vals),
    sd      = sd(vals)
  )
  return(stats)
}
