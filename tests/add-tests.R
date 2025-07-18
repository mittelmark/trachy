library(trachy)

x = 2 + 2

if (x != 4) {
    stop("Error: Something strange happened!!")
}

x = trachy$tdata("meta")

if (nrow(x) < 10) {
    stop("Error: Something strange happened in trachy$tdata('meta')!!")
}
