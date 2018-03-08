3 + 2
x <- 1:5
y <- c(1,2,3, 4, 5)
z <- c(4, 5)
x * 2
y * z
ls()

b <- 4
f <- function(a) {
  b <- 3
  b^3 + g(a)
}
g <- function(a) {
  a * b
}
f(2)


#Read CSVs
sn <- read.csv("~/Desktop/social_network.csv", header = T)
str(sn.csv)

#Using and managing packages
browseURL("http://cran.r-project.org/web/views/")

install.packages("RCurl")
library(RCurl)

#Create a table
MyTable = data.frame()
edit(MyTable)


#Create bar charts
site.freq <- table(sn$Site)
barplot(site.freq)
? barplot #? is for more information
#To put the bars in descending order, add order
barplot(site.freq[order(site.freq, decreasing = T)])
#To put the bars horizontally (but turn off decreasing)
barplot(site.freq[order(site.freq)], horiz = T)
#Add color  with specified vectors
fbba <- c(rep("gray", 4), rgb(59, 89, 152, maxColorValue = 255), rgb(28, 74, 3, maxColorValue = 255))
barplot(site.freq[order(site.freq)],
        horiz = T,
        col = fbba)
help(barplot)
#Turn off borders with "border = NA"
#Add title with "main" with "\n" to break line
#Add subtitle with "sub"
barplot(site.freq[order(site.freq)],
        horiz = T,
        col = fbba,
        border = NA,
        xlim = c(0, 400), #Scale from 0-100
        main = "Preferred Social Networking Site\n A Survey of 202 Users",
        xlab = "Number of Users")


#Create histograms
hist(sn$Age)
#Add title, colors, etc.
hist(sn$Age,
     #border = NA,
     col = "beige", #Or use: col = colors() [18]
     main = "Ages of Respondents\nSocial Networking Survey of 202 Users",
     xlab = "Age of Respondents")

#R's color palette is found at
# http://research.stowers-institute.org/efg/R/Color/Chart/
#numbers for colors
colors() [18] #Outputs [1] "beige"
colors()[c(552, 254, 26)]


#Create box plots
boxplot(sn$Age)
#Add title, colors, etc.
boxplot(sn$Age,
        col = "beige",
        notch = T,
        horizontal = T,
        main = "Ages of Respondents\nSocial Networking Survey of 202 Users",
        xlab = "Age of Respondents")


#Calculating frequencies
table(sn$Site) #Creates frequency table in alphabetical order
site.freq <- table(sn$Site)
site.freq
site.freq <- site.freq[order(site.freq, decreasing = T)] #Sorts data
site.freq
prop.table(site.freq) #Give proportions of total
round(prop.table(site.freq), 2)


#Calculating descriptives
summary(sn$Age) #Summary for one variabe
summary(sn) # Summary for entire table
#Tukey's five-number summay: minimum, lower hinge(first quartile),
#media, upper-hinge(third quartile), maximum
#Doesn't print labels
fivenum(sn$Age)

#Alternate descriptive statistics
#Gives n, mean, standard deviation, median, trimmed mean (10% by default),
#median absolute deviation from median(MAD), min, max, range,
#skew, kurtosis, and standard error.
install.packages("psych")
library("psych")
describe(sn)


#Recoding variables
hist(sn$Times)
describe(sn$Times)
#z-scores
#Use built-in function "scale"
times.z <- scale(sn$Times)
hist(times.z)
describe(times.z)
#log
times.ln0 <- log(sn$Times)
hist(times.ln0)
describe(times.ln0)
#Add one to avoid undefined logs for 0 times
times.ln1 <- log(sn$Times + 1)
hist(times.ln1)
describe(times.ln1)

#Ranking
times.rank <- rank(sn$Times)
hist(times.rank)
describe(times.rank)
#ties.method = c("average", "first", "random", "max", "min")
times.rankr <- rank(sn$Times, ties.method = "random")
hist(times.rankr)
describe(times.rankr)

#dichotomizing
time.gt1 <- ifelse(sn$Times < 1, 1, 0)
time.gt1



#Computing new variables
n1 <- rnorm(1000000)
hist(n1)
n2 <- rnorm(1000000)
hist(n2)

#Average scores across two variables
n.add <- n1+ n2
hist(n.add)

#Multiple scores across two variables
n.mult <- n1 * n2
hist(n.mult)
#Calculate kurtosis for each dsitribution
kurtosi(n1)
kurtosi(n2)
kurtosi(n.add)
kurtosi(n.mult)


#Create bar charts of group means
google <- read.csv("~/Desktop/google_correlate.csv", header = T)
names(google)
str(google)
#Does interest in data visualization vary by region?
#Split data by region, create new data frame
viz.reg.dist <- split(google$data_viz, google$region)
#Draw boxplots by region
boxplot(viz.reg.dist, col = "lavender")
#Draw barplot with means
viz.reg.mean <- sapply(viz.reg.dist, mean)
#Run next two together
barplot(viz.reg.mean,
        col = "beige",
        main = "Average Google Search Share of\n\"Data Visualization\" by Region of US")
abline(h = 0)

describeBy(google$data_viz, google$region)


#Creating scatterplots
names(google)
str(google)
#Is there an association between the percentage of people
#in a state with college degrees and interest in data visualization
plot(google$degree, google$data_viz)
#Add title, labels, change circles to points
plot(google$degree, google$data_viz,
     main = "Interest in Data Visualization Searches\nby Percent of Population with College Degrees",
     xlab = "Population with College Degrees",
     ylab = "Searches for \"Data Visualization\"",
     pch = 20,
     col = "grey")
#Add fit lines
#Linear regression line (y ~ x)
abline(lm(google$data_viz ~ google$degree), col="red")
#Lowess smoother line (x, y)
lines(lowess(google$degree, google$data_viz), col="blue")



#Creating scatterplot matrices
names(google)
#Basic Scatterplot Matrix
pairs(~data_viz + degree + facebook + nba, #Don't need $ cause data is specified separately
      data = google, 
      pch = 20,
      main = "Simple Scatterplot Matrix")

#Use "Pairs Plot" from "psych" package
pairs.panels(google[c(3, 7, 4, 5)], gap = 0)


#Creating 3D Scatterplots
names(google)
#Spinning 3D scatterplot
install.packages("rgl")
library("rgl")
yyplot3d(google$data_viz,
       google$degree,
       google$facebook,
       xlab = "data_viz",
       ylab = "degree",
       zlab = "facebook",
       col = "red",
       size = 3)


#Calculating correlations
names(google)
#Create data frame with oly quantitative variables
g.quant <- google[c(3, 7, 4, 5)]
cor(g.quant)
#Can test one pair of variables at a time
cor.test(g.quant$data_viz, g.quant$degree)
#Install "Hmisc" package to get p-values from matrix
install.packages("Hmisc")
library("Hmisc")

#Need to coerce g.quant from data frame to matrix to get
#correlation matrix and p-values
rcorr(as.matrix(g.quant))



#Computing a regression
names(google)
reg1 <- lm(data_viz ~ 
             degree + stats_ed + facebook + nba + has_nba + region,
           data = google)
summary(reg1)








