# Course - Using probability distributions for real world problems in R
# Instructor - Dr. Nikunj Maheshwari

library(ggplot2)



#-------------------------------------------------------------------------------
# Binomial distribution

# Problem
# Suppose there are ten multiple choice questions in an English class quiz. 
# Each question has four possible answers, and only one of them is correct.
# 
# Q1. Find the probability of having exactly 4 correct answers by random 
# Solution
dbinom(4,10,0.25)
dbinom(0,10,0.25)

# Q2. What is the probability of having four or less correct answers if a 
#     student attempts to answer every question at random?
# Solution
pbinom(4,10,0.25)

values <-seq(0,10,1)
resultTable<-data.frame(answer=values, prob=dbinom(values,10,0.25))
ggplot(data=resultTable,aes(x=answer,y=prob))+geom_bar(stat="identity",fill="blue") +scale_x_continuous(breaks=values)



cumulativeProbTable<-data.frame(answer=values, prob=pbinom(values,10,0.25))
ggplot(data=cumulativeProbTable,aes(x=answer,y=prob))+geom_bar(stat="identity",fill="blue") +scale_x_continuous(breaks=values)



#-------------------------------------------------------------------------------
# Poisson distribution

# Problem
# If there are ten cars crossing a bridge per minute on average, find the 
# probability of having seventeen or more cars crossing the bridge in a 
# particular minute.
# Solution
prob16orLess = ppois(16,10)
probAns = 1 - prob16orLess
print(probAns)

ppois(16,10,FALSE)
cars <- seq(0,20,1)
carResultTable<-data.frame(answer=cars, prob=dpois(cars,10))
ggplot(data=carResultTable,aes(x=answer,y=prob))+geom_bar(stat="identity",fill="blue") +scale_x_continuous(breaks=values)




#-------------------------------------------------------------------------------
# Normal distribution

# Problem
# The Iris dataset in R contains iris flower specifications. The column 
# Sepal Width follows a normal distribution.
#
# Q1. What is the percentage of flowers with Sepal Width 3cm or less?
# Solution
meanIris <- mean(iris$Sepal.Width)
sdIris <- sd(iris$Sepal.Width) 
pnorm(3, mean = meanIris ,sd=sdIris)


# Q2. What fraction of the flowers where Sepal Width lies between 3cm and 4cm?
# Solution
ans = pnorm(4, mean = meanIris ,sd=sdIris)-pnorm(3,mean=meanIris, sd=sdIris)
print(ans)

sepalwidthseq <- seq(1,5,0.1)
sepalProbTable<-data.frame(answer=sepalwidthseq, prob=dnorm(sepalwidthseq,meanIris,sdIris))
ggplot(data=sepalProbTable,aes(x=answer,y=prob))+geom_bar(stat="identity",fill="blue") +scale_x_continuous(breaks=values)






#-------------------------------------------------------------------------------
# Exponential distribution
#
# Q1. Suppose the mean arrival time of a customer at a supermarket cashier is 
# four minutes. Find the probability of a customer arriving at the cashier 
# in less than three minutes.
# Solution
pexp(3, rate = 1/4)


# Q2. The number of days ahead travelers buy their flight tickets follows an 
# exponential distribution with the average number of days = 15. 
# Find the probability that a traveler will purchase a ticket more than 
# 10 days in advance.
# Solution
pexp(10,rate = 1/15, FALSE)
daySequence <- seq(0,30,1)
dayResultTable<-data.frame(answer=daySequence, prob=pexp(daySequence,1/15))
ggplot(data=dayResultTable,aes(x=answer,y=prob))+geom_point(stat="identity",position="identity") +scale_x_continuous(breaks=values)






#-------------------------------------------------------------------------------
# Chi-Square distribution

# Problem Statement
# Say, on average, a battery lasts 50 minutes on a single charge. The standard 
# deviation is 3 minutes. Suppose the battery manufacturer runs a quality 
# control test. They randomly select 9 batteries. The standard deviation of 
# the selected batteries is 5 minutes. 
# Q1. What would be the chi-square statistic represented by this test?
# Solution
dof <- 8
chi <- (dof * 5^2)/3^2
chi


# Q2. Suppose they repeated the test with a new random sample of 9 batteries. 
# What is the probability that the standard deviation in the new test would be 
# greater than 5 minutes?
# Solution
1-pchisq(chi, df=dof)

chi_square <- seq(1,40,1)
cumulativeProb <- pchisq(chi_square,df = dof)
ggplot() + geom_point(aes(x=chi_square, y = cumulativeProb)) 


#-------------------------------------------------------------------------------
### End of course.
### Thank you for pursuing it.