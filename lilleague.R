text <- readline()
text <- substring(text, 2)
text <- gsub('.{1}$', '', text)

split_up <-  strsplit(text, '),')[[1]]
split_up <- gsub('\\(', '', split_up)
split_up <- gsub('\\)', '', split_up)
split_up <- gsub(' ', '', split_up)

outs <- 0
strikecount <- 0
hits <- 0
runs <- 0
fstrike <- FALSE
sstrike <- FALSE
tstrike <- FALSE

for (i in 1:length(split_up))
{
  
  if (outs == 3)
  {
    break
  }
  
  if (split_up[i] == "FB,F")
  {
    #HR
    runs <- runs + (hits + 1)
    hits <- 0
    strikecount <- 0
  }
  else if (split_up[i] == "C,S")
  {
    #Hit
    hits <- hits + 1
    
    if (hits == 4)
    {
      hits <- hits - 1
      runs <- runs + 1
    }
    
    strikecount <- 0
  }
  else if (split_up[i] == "FB,S" || split_up[i] == "C,F")
  {
    #Strike
    strikecount <- strikecount + 1
    
    if (strikecount == 3)
    {
      outs <- outs + 1
    }
    
  }
}

cat(runs)