#load
cars <- read.csv("Cars.csv")
head(cars)
table(cars$Transmission)

#five number summary
min(cars$Fuel.Economy)
max(cars$Fuel.Economy)
mean(cars$Fuel.Economy)
quantile(cars$Fuel.Economy)
sd(cars$Fuel.Economy)

#sum
sum(cars$Fuel.Economy)

#correlation
cor(
  x=cars$Cylinders,
  y=cars$Fuel.Economy
)

#all the previous
summary(cars)
