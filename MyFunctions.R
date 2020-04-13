

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
MyRData <- read.csv("antcountydata.csv", header = TRUE)



