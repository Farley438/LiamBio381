# Homework 11

library(TeachingDemos)
char2seed("Freezing March")

#--------------------------------------------
# Global variables
fileFolder <- "RandomFiles/"
nFiles <- 100
fileOut <- "StatsSummary.csv"
#--------------------------------------------

# Create 100 random data sets
fileNames <- list.files(path=fileFolder)

# Create data frame to hold file summary statistics
ID <- seq_along(fileNames)
fileName <- fileNames
slope <- rep(NA,nFiles)
pVal <- rep(NA,nFiles)
r2 <- rep(NA,nFiles)

statsOut <- data.frame(ID,fileName,slope,pVal,r2)

# batch process by looping through individual files
for (i in seq_along(fileNames)) {
  data <- read.table(file=paste(fileFolder,fileNames[i],sep=""),
                     sep=",",
                     header=TRUE) # read in next data file
  
  dClean <- data[complete.cases(data),] # get clean cases
  
  . <- regStats(dClean) # pull regression stats from clean file
  statsOut[i,3:5] <- unlist(.) # unlist, copy into last 3 columns
  
}
# set up output file and incorporate time stamp and minimal metadata
write.table(cat("# Summary stats for ",
                "batch processing of regression models","\n",
                "# timestamp: ",as.character(Sys.time()),"\n",
                "# NJG","\n",
                "# ------------------------", "\n",
                "\n",
                file=fileOut,
                row.names="",
                col.names="",
                sep=""))

# now add the data frame
write.table(x=statsOut,
            file=fileOut,
            row.names=FALSE,
            col.names=TRUE,
            sep=",",
            append=TRUE)