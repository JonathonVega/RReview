#Review for R in case I forgot how to do anything

#Can call stuff and do math
5
6 + 4
8 - 3
5 * 3

#Create Vectors
#Use '<-' instead of '=' because of scope
#c() combines the elements
x <- c(3, 7, 9)

#R starts at 1 when accessing elements instead of 0
x[1] #3
x[2] #7

#Sequence numbers
5:9 #5 6 7 8 9
seq(5, 9)
seq(5, 9, 0.5)

#Vector Access
sentence <- c("This", "is", "the", "sentence")
sentence[3] <- "a"
sentence[5] <- "!"

#Vector Names
#Can assign names to vectors to act as labels for data
ranks <- 1:3
names(ranks) <- c("first", "second", "third")
ranks["first"]  #first  1

#Plotting One Vector
vesselsSunk <- c(4, 5, 1)
barplot(vesselsSunk)
names(vesselsSunk) <- c("England", "France", "Norway")
barplot(vesselsSunk) 

#Vector Math
a <- c(1, 2, 3)
a + 1 #2, 3, 4
b <- c(4, 5, 6)
a - b #-3 -3 -3
a == c(1, 99, 3) #TRUE FALSE TRUE

#Scatter Plots
x <- seq(1,20, 0.1)
y <- sin(x)
plot(x, y)

#NA Values
#When given data that have NA values within them
a <- c(1, 3, NA, 7, 9)
sum(a) #NA
sum(a, na.rm = TRUE)

#Matrices
#3 rows, 4 columns, all set to 0
matrix(0, 3, 4)

a <- 1:12
matrix(a, 3, 4)

#Dimensions
plank <- 1:8
dim(plank) <- c(2, 4)
print(plank)

#Matrix Access
plank[2, 3] #6
plank[2,] #2 4 6 8

#Matrix Plotting
elevation <- matrix(1, 10, 10)
elevation[4, 6] <- 0
contour(elevation) #contour map
persp(elevation) #3D perspective plot
persp(elevation, expand=0.2) #fixes view on 3D plot
image(elevation) #heatmap

#Mean
x <- c(4, 3, 4, 3, 2, 4, 4, 4)
names(x) <- c("a", "b", "c", "d", "e", "f", "g", "h")
barplot(x)
#abline draws a line at the mean
#h parameter is for horizontal
#v parameter is for vertical
abline(h = mean(x))

#Median
abline(h = median(x))

#Factors
#Categorizes the values
chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
types <- factor(chests)
print(types) #prints chests along with integer references to the levels
as.integer(types) #prints out integer
levels(types) #prints factor levels
print(nlevels(types))

#Data Frames
#Structure data and types together
#Data Frames are like excel spreadsheets
weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)
treasure <- data.frame(weights, prices, types)
print(treasure)

#Data Frame Access
treasure[[2]] #Second column(prices)
treasure[["weights"]]
treasure$prices #Faster notation without brackets

#Loading Data Frames
list.files() #Access files
read.csv("example.csv")
read.table("example.txt", sep="\t", header=TRUE) #Access file with delimiter different from commas
merge(x = dataFrame1, y = dataFrame2) #merges two Data Frames

#***Untestable review***
#For a correlation test
#cor.test(countries$GDP, countries$Piracy)

#For a linear model on plot
#lm func takes response variable, a tilde char, and a predictor variable
#line <- lm(countries$Piracy ~ countries$GDP)
#abline(line)
#***Untestable review***

#To install packages
install.packages("ggplot2")










