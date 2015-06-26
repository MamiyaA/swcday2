analyze <- function(filename, output = NULL) {
  ## plot the average, min, and max inflammation over time
  ## Input is a character string, "filename", of a .csv
  
  #! reverse the TRUE FALSE
  if (!is.null(output)){
    pdf(output)
  }
  dat <-read.csv(file = filename, header = FALSE)
  
  avg_day_infl <- apply(dat, 2, mean)
  plot(avg_day_infl)
  
  max_day_infl <- apply(dat, 2, max)
  plot(max_day_infl)
  
  min_day_infl <- apply(dat, 2, min)
  plot(min_day_infl)
  
  if (!is.null(output)){
    dev.off()
  }
}

#set working directory
#directory should be at the main directory, where data, R script, and results directory are all under.
#setwd("/Users/pcmamiya/Desktop/swcday2/")

#run it for one file.
#analyze("./data/inflammation-01.csv")

#get the file names.
datafiles <- list.files(path = "./data", pattern = "inflammation*", full.names = TRUE)

#Go through the file names with for loop.
for (f in datafiles) {
  print(f)
  analyze(f)
}

#a new function that takes a filename pattern as its sole argument and
#runs analyze for each file whose name matches the pattern
analyze_all <- function(FilePattern, outputpath) {
  #get file names that have the pattern.
  datafiles <-list.files(path = "./data", pattern = FilePattern, full.names = TRUE)
  
  #for loop for analyzing for all the datafiles
  for (f in datafiles) {
    pdf_name <- sub("./data",outputpath,sub("csv","pdf",f))
    
    print(f)
    analyze(f,output = pdf_name)
  }
}


# Example of if statement in R
num <- 37
if (num >100) {
   print("greater")
} else if (num == 100) {
   print("is equal")
} else if (num ==99) {
   print("exactly 99")
} else {
   print("not greater")
}

#
sign <- function (num) {
  ## takes numeric value called "num"
  ## Return 1 if positive, 0 if 0, -1 if negative
  if (num >0){
    return(1)
  } else if (num == 0){
    return(0)
  } else {
    return(-1)
  }
}

between_1_10 <- function(num) {
  if (num >= 1 & num <= 10){
    print("Yup, it's in there")
  } else {
    print("Try, again.")
  }
}

for (x in c(0,1,5,10,11)) {between_1_10(x)}


