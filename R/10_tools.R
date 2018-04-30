subtype <- function(class, subtype) {
	if (subtype == "ANY") subtype <- ""
  paste(class, subtype, sep = "")
}
