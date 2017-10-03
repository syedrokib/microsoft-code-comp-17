find_symmetry <- function(matrix_text) {
  
  split_up <-  strsplit(matrix_text, ';')[[1]]
  a <- list()
  
  for (i in 1:length(split_up))
  {
    a[[i]] <- lapply(strsplit(split_up[i], ','), as.numeric)[[1]]
  }
  
  matrix_form <- do.call(rbind, a)
  matrix_form <- as.matrix(matrix_form)
  
  if (isSymmetric.matrix(matrix_form))
  {
    cat("Symmetric")
    cat("\n")
  }
  if (!isSymmetric.matrix(matrix_form))
  {
    cat("Not symmetric")
    cat("\n")
  }
  
}

yz <- readLines("C:/Users/Syed Rokib/Desktop/microsoft code comp/PracticeInput.txt")

for (i in 1:length(yz))
{
  find_symmetry(yz[i])
}





