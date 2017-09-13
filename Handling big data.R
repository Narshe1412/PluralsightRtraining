data(iris)

library(ff)
library(biglm)

irisff <- read.table.ffdf(
  file = "Iris.csv",
  FUN = "read.csv"
)

class(irisff)
names(irisff)

irisff[1:5,] # cannot use head() with ffdf

#lm model creation
model <- biglm(
  formula = Petal.Width ~ Petal.Length,
  data = irisff
)

summary(model)

#scatterplot
plot(
  x = irisff$Petal.Length[],
  y = irisff$Petal.Width[],
  main = "Iris Petal Length vs Width",
  xlab = "Petal length",
  ylab = "Petal width"
)

#get y intercept
b <- summary(model)$mat[1,1]
#get slope
m <- summary(model)$mat[2,1]

#draw regression line
lines(
  x = irisff$Petal.Length[],
  y = m * irisff$Petal.Length[] + b,
  col = "red",
  lwd = 3
)

#prediction
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2, 5, 7),
    Petal.Width = c(0,0,0)
  )
)
