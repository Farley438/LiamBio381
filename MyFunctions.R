
library(ggplot2)
##################################################
# FUNCTION: FitRegressionModel
# Fits an ordinary least squares regression model
# input: x and y vectors of numeric. Must be same length
# output: entire model summary from lm 
#------------------------------------------------- 
FitRegressionModel <- function(xVar=runif(10),yVar=runif(10)) {
  dataFrame <- data.frame(xVar,yVar)
  regModel <- lm(yVar~xVar,data=dataFrame)
  return(summary(regModel))
}
FitRegressionModel()

##################################################
# FUNCTION: SummarizeOutput
# pull elements from model summary list
# input: list from summary call of lm
# output: vector of regression residuals 
#------------------------------------------------- 
SummarizeOutput <- function(z=NULL) {
  if(is.null(z)) {
    z <- summary(lm(runif(10)~runif(10)))
  }  
  return(z$residuals)
}
SummarizeOutput()

##################################################
# FUNCTION: GraphResults
# graph data and fitted OLS line
# input: x and y vectors of numeric. Must be same length
# output: creates graph 
#------------------------------------------------- 
GraphResults <- function(xVar=runif(10), yVar=runif(10)) {
  dataFrame <- data.frame(xVar,yVar)
  # #plot(y=dataFrame$yVar,
  #      x=dataFrame$xVar,
  #      pch=21,
  #      bg="lightblue",
  #      cex=2)
  p1 <- qplot(data=dataFrame,x=xVar,y=yVar,geom=c("smooth","point"))
  print(p1)
  regModel <- lm(yVar~xVar,data=dataFrame)
  # abline(regModel)
  message("Message: Regression graph created")
}
GraphResults()
str(GraphResults())

##################################################
# FUNCTION: GetData
# read in a .csv file
# input: .csv file
# output: data frame
#------------------------------------------------- 
GetData <- function(file_name = NULL) {
  
  if(is.null(file_name)) {
    df <- data.frame(ID=101:110,
                     varA=runif(10),
                     varB=runif(10))
  }  else {
     df <- read.csv(file=file_name,
                      header=TRUE,
                      sep=",",
                      stringsAsFactors=FALSE) 
    
  }
  return(df)
}


GetData()

####################################################
MyRData <- read.csv("Celo.csv", header = TRUE)
MyRData <- read.csv("Dupont.csv", header = TRUE)

#######################################


# FUNCTION: GetData2
# read in a .csv file
# input: .csv file
# output: data frame
#------------------------------------------------- 
GetData2 <- function(file_name = NULL) {
  
  if(is.null(file_name)) {
    df <- data.frame(ID=100:110,
                     varA=runif(7),
                     varB=runif(7))
  }  else {
    df <- read.csv(file=file_name,
                   header=TRUE,
                   sep=",",
                   stringsAsFactors=FALSE) 
    
  }
  return(df)
}


GetData()

##################################################
# FUNCTION: GraphResults2
# graph data and fitted OLS line
# input: x and y vectors of numeric. Must be same length
# output: creates graph 
#------------------------------------------------- 
GraphResults2 <- function(xVar=runif(7), yVar=runif(7)) {
  dataFrame <- data.frame(xVar,yVar)
  # #plot(y=dataFrame$yVar,
  #      x=dataFrame$xVar,
  #      pch=21,
  #      bg="lightblue",
  #      cex=2)
  p1 <- qplot(data=dataFrame,x=xVar,y=yVar,geom=c("smooth","point"))
  print(p1)
  regModel <- lm(yVar~xVar,data=dataFrame)
  # abline(regModel)
  message("Message: Regression graph created")
}
GraphResults2()
str(GraphResults2())

##################################################
# FUNCTION: zeroloop
# count zeros in vector
# input: numeric vector
# output: a count of # of zeros in vector
#------------------------------------------------- 
zeroloop <- function(z) {
 
  counter <- 0
  for (i in 1:length(z)){
    if(z[i] == 0) counter <- counter + 1 
     }
  return(counter)
}
myz <- rpois(10,1)
zeroloop(z=myz)

##################################################
# FUNCTION: rowxcol
# each element is product of row and column
# input: row number and column number
# output: total of row and colum number
#------------------------------------------------- 
rowxcol <- function(x) {x <- matrix(round(runif(15),digits=1),nrow=5)
for (i in 1:nrow(x)) {
  for (j in 1:ncol(x)) {
    x[i,j] <- x[i,j] * j * i
  } 
}
print(x)
}


########################################################
library(ggplot2)
library(TeachingDemos)

set.seed(100)
char2seed("espresso withdrawal")
char2seed("espresso withdrawal", set=FALSE)

####### ###########################################
# function: readData
# read in (or generate) data set for analysis
# input: file name (or nothing, for this demo)
# output: 3 column data frame of observed data (ID,x,y)
#------------------------------------------------- 
readData <- function(file_name = NULL) {
  if(is.null(file_name)){
    df <- data.frame(ID=101:110,
                     xVar = runif(10),
                     yVar = runif(10),
                     zVar = runif(10))
  }  else {
    df <- read.csv(file=file_name,
                   header=TRUE,
                   sep=",",
                   stringsAsFactors=FALSE) 
    
  }
  return(df)
} 
my_df <- readData()
##################################################
# function: getMetric
# calculate metric for randomization test
# input: 2-column data frame for regression
# output: regression slope
#------------------------------------------------- 
getMetric <- function(z = my_df) {
  . <- lm(z[,3]~z[,4])
  . <- summary(.)
  . <- .$coefficients[2,1] 
  
  slope <- .
  return(slope)
}
getMetric()
                  
                                     
 
 
##################################################
# function: shuffleData
# randomize data for regression analysis
# input: 3-column data frame (ID,xVar,yVar)
# output: 3-column data frame (ID,xVar,yVar)
#------------------------------------------------- 
shuffleData <- function(z = my_df) {
                
  z[,3] <- sample(z[,3]) # use sample function with defaults to reshuffle column
  return(z)
}
shuffleData()
    
                   
  
  
 
##################################################
# function: getPVal
# calculate p value from simulation
# input: list of observed metric, and vector of simulated metrics
# output: lower, upper tail probability values
#------------------------------------------------- 
getPVal <- function(z = NULL) {
  if(is.null(z)){
    z <- list(xObs=runif(1),xSim=runif(1000))}
                      pLower <- mean(z[[2]]<=z[[1]])
                      pUpper <- mean(z[[2]]>=z[[1]])
  return(c(pL=pLower,pU=pUpper))
}
getPVal()  
##################################################
# function: plotRanTest
# create ggplot of histogram of simulated values
# input: list of observed metric and vector of simulated metrics
# output: saved ggplot graph
#------------------------------------------------- 
plotRanTest <- function(z =NULL) {
                if(is.null(z)){
    z <- list(rnorm(1),rnorm(1000)) }
  df <- data.frame(ID=seq_along(z[[2]]),simX=z[[2]])
  p1 <- ggplot(data=df,mapping=aes(x=simX))
  p1 + geom_histogram(mapping=aes(fill=I("goldenrod"),color=I("black"))) +
    geom_vline(aes(xintercept=z[[1]],col="blue")) 
  
}
plotRanTest()



 
##################################################
# function: regStats
# fits linear model, extracts statistics
# input: 2-column data frame (x and y)
# output: slope, p-value, and r2
#------------------------------------------------- 
regStats <- function(d=NULL) {
  if(is.null(d)) {
    xVar <- runif(10)
    yVar <- runif(10)
    d <- data.frame(xVar,yVar)
  }
  . <- lm(data=d,d[,4]~d[,5])
  . <- summary(.)
  statsList <- list(Slope=.$coefficients[2,1],
                    pVal=.$coefficients[2,4],
                    r2=.$r.squared)
  return(statsList)
  
}



