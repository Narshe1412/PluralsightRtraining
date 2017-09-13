data("iris")
head(iris)

#scatterplot
plot(
  x= iris$Petal.Length,
  y= iris$Petal.Width,
  main = "Iris petal length vs width",
  xlab = "Petal length (cm)",
  ylab = "Petal width (cm)"
)

#create LR model
model <- lm(
  formula = Petal.Width ~ Petal.Length,
  data = iris
)

summary(model)

#create linear regression
lines(
  x = iris$Petal.Length,
  y= model$fitted,
  col = "red",
  lwd = 3
)

cor(
  x= iris$Petal.Length,
  y= iris$Petal.Width
)

#prediction
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2, 5, 7) #random chosen values
  )
)
