options(repos=c("https://mirrors.nics.utk.edu/cran/"))
suppressMessages({
    if(!require(tidyverse)){
        install.packages('tidyverse')
        require(tidyverse)
    }
    if(!require(intervals)){
        install.packages('intervals')
        require(intervals)
    }
})

line.graph <- function(A){
    plot(A)
}
