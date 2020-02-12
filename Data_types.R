# basic examples of data types and their uses
# 4 Feb 2020
# NJG

#   -----------------------------------------------------------------------

# using the assignment operator
x <- 5 # preferred
y = 4 # legal but not used except in function defaults
y = y + 1
y <- y + 1
y
print(y(y)

#     ---------------------------------------------------------------------

# variable names
z <- 3 # use lower case 
plantheight <-3 # camel case naming
plant. <- 3 # avoid this using periods
plant_height <- 3 # snake case - perferred way
. <- 5 # use single period exculsilvey for tempoary variation

# -------------------------------------------------------------------------

# combine or concatenta function
z <- c(3,2 5, 5, 6)
print(z)
typeof(z)
is.numeric(z)
is.character(z)

# characteer variable bracted by qoutes (single or double)
z <- c("perch, "striped bass", 'trout")
print(z)

z <- c("this is one 'character string", "and another")
print(z)

z <- c(c(2,3),c(4,4,8))
print(z)
z <- c(TRUE,FALSE,FALSE)
typeof(z)
is.integer(z)


# -------------------------------------------------------------------------

# properties of atomic vectors
# has a unique type
typeof(z)
is.logical(z)

# has a specified length
length(z)
length(zz)

# optional names
z <- runif(5)
print(z)
names(z)
names(z)<- c("chow",
             "pug",
             "beagle",
             "greyhound",
             "akita")
print(z)
z[3]
z[c(3,4)]
z[c("beagle","greyhound")]
z[c(3,3,3,3)]

# add names when the variable is first built (with or without quotes)
z2 <- c(gold=3,3, silver=10, lead=2)
print(z2)
# reset names
names(z2) <- NULL

# names some elements but not others
names(z2) <- c("copper, "zinc"")
print(z2)


# -------------------------------------------------------------------------

# NA for missing data
z <- c(3.2,3.3,NA)
typeof(z)
length(z)
typeof(z[3])
z1 <- NA
typeof(z1)
is.na(z) # boolean to find NA
!is.na(z) # boolean to find NOT NA
mean(z)
mean(!is.na(z)) # not correct operates on booleans
mean(z[!is.na(z)]) # correct way

# NaN, -Ing, Inf from numeric division
z <- 0/0
print(z)
typeof(z)
z <- 1/0
print(z)
z <- -1/0      
print(z)

# null is nothing
z <- NULL
typeof(z)
length(z)
is.null(z)

# -------------------------------------------------------------------------

# Three features of atomic vectors

# 1. Coercion
# all atomics of the same type
# if elements are different, R coerce them
# any logical variable -> interger -> character

z <- c(0.1, 5, "0.2")
typeof(z)
print(z)

# use coercion for useful calculation
a <- runif(18)
print(a)
a > 0.5
sum(a > 0.5) # how many elements are greater than
mean(a > 0.7) # proporation of values greater than 0.7

# qualifying exam question:
# in a normal distribution, approx what percetn observants from a normal (0,1) are larger than 2.0

mean(rnorm(1000000) > 2)

# 2. vectorization
z <- c(10, 20, 30)
z + 1
z2 <- c(1,2,3)
z + z2
z^2
# recycling
z <- c(10,20,30)
z2 <- c(1,2)
z + z2
z <- 1.1^2.2^3.3
print(z)
z <- c(8, 10)




# -------------------------------------------------------------------------


z <- vector(mode='numeric',length=5)
z <- c(z,5)
print(z)
# dynamic sizing dont do this

# preallocate space to a vector
z <- rep(0,100)
head(z)

# fill with NA
z <- rep(NA,100)
head(z)

typeof(z)
z[1] <- "washington"
typeof(z)

v_size <- 100
my_vector <- runif(v_size)
my_name <- paste("Species",seq(1:length(my_vector)),sep="")
head(my_name)
names(my_vector) <- my_name
head(my_vector)




# rep function fro repeating elements
rep(0.5,6)
rep(x=0.5, times=6)
rep(times=6, x=0.5)
rep(6,0.5)
my_vec <- c(1,2,3)
rep(x=my_vec,times=2)
rep(x=my_vec,each=2)
rep(x=my_vec,times=my_vec)
rep(x=my_vec,each=my_vec)

# using seq to create regular sequences
seq(from=2, to=4)
2:4
`:`(2,4)
seq(from=2, to=4, by=0.5)
x <- seq(from=2, to=4, length=7)
print(x)
my_vec <- 1:length(x)
seq_along(my_vec)

# using random generator
runif(5)
runif(n=5,min=100,max=110)

# normal distributions
rnorm(6)
rnorm(n=5,mean=100,sd=30)
library(ggplot2)
z <- runif(1000)
gplot(x=z)
z <- rnorm(1000)
gplot(x=z)

# using sample function to draw random values from existing vector
long_vec <- seq_len(10)
print(long_vec)
sample(x=long_vec)
sample(x=long_vec, size=3)
sample(x=long_vec,size=16,replace=TRUE)
my_weights <- c(rep(20,5), rep(20,5))
print(my_weights)
sample(x=long_vec,replace=TRUE,prob = my_weights)

# techniques for subsetting atomic vectors

z <- c(3.1, 9.2, 1.3, 0.4, 7.5)

# subset with positive index values
z[c(2,3)]

# subset with negative values
z[-c(1,5)]

# create a logical vector of conditions for subsetting
z[z<3]

tester <- z<3
print(tester)
z[tester]

# which function to find slots
which(z<3)
z[which(z<3)]

# use length fro relative positioning
z[-c(length(z):(length(z)-2))]

# also subset using named vector elements
names(z)<- letters[1:5]
z
z[c("b","b")]

# relational operators
# < less than
# >greater than
# <= less than or equals
# => greater than or equal
# == equal

# logical operators
# ! NOT
# & and (vector)
# | or (vector)
# xor(a,b) a or b, but not a and b
## && and (first element)
# || or (first element)

x <- 1:5
y <- c(1:3,7,7)
x == 2
x != 2

x == 1 & y ==7
x == 1 | y == 7
 x == 3 | y == 3
xor(x==3,y==3) 
x == 3 && y ==3

# subscripting with missing values
set.seed(90)
z <- runif(10)
print(z)
z < 0.5
z[z < 0.5]
which(z < 0.5)
z[which(z < 0.5)]

zD <- c(z,NA,NA)
zD[zD<0.5]
zD[which(zD<0.5)]


### lecture 2/11/2020

# -------------------------------------------------------------------------


