#' Interfaz tcltk opcional
#' @export
run_gui <- function() {
  if (!requireNamespace("tcltk", quietly = TRUE))
    stop("Necesitas el paquete 'tcltk' para la GUI")
  library(tcltk)
  
  # Función auxiliar
  get_vals <- function(entry) {
    txt  <- tclvalue(entry)
    nums <- as.numeric(strsplit(txt, ",")[[1]])
    if (length(nums)!=10 || any(is.na(nums))) return(NULL)
    nums
  }
  
  tt <- tktoplevel(); tkwm.title(tt, "Demo Previsional")
  tkpack(tklabel(tt, text="10 valores (coma sep.):"))
  entry <- tkentry(tt, width=40); tkpack(entry)
  
  # Botón Estadísticas
  tkpack(tkbutton(tt, text="Estadísticas", command = function(){
    v <- get_vals(entry)
    if (is.null(v)) return(tkmessageBox(message="Error: 10 números válidos"))
    st <- calc_stats(v)
    tkmessageBox(message=paste(names(st), round(st,3), sep=": ", collapse="\n"))
  }), side="left", padx=10, pady=10)
  
  # Botón Gráfico
  tkpack(tkbutton(tt, text="Graficar", command = function(){
    v <- get_vals(entry)
    if (is.null(v)) return(tkmessageBox(message="Error: 10 números válidos"))
    dev.new(); plot_vals(v)
  }), side="right", padx=10, pady=10)
  
  tkfocus(tt)
}
