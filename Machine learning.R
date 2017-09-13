data("iris")

#reproducible randomness
set.seed(42)

#get a sample of 100 numbers
indexes <- sample(
  x= 1:150,
  size = 100
)

#create a sample from indexes
train <- iris[indexes,]
#remain items go to the test set
test <- iris[-indexes,]

library(tree)

#create and inspect the model
model <- tree(
  formula = Species ~ .,
  data = train
)
summary(model)

#visualize the model
plot(model)
text(model)


#load color palette
library(RColorBrewer)
palette <- brewer.pal(3, "Set2")


#create scatterplot
plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  pch = 19,
  col = palette[as.numeric(iris$Species)],
  main = "Iris Petal Length vs. Width",
  xlab = "Petal length (cm)",
  ylab = "Petal width (cm)"
)
#decision tree boundaries
partition.tree(
  tree = model,
  label = "Species",
  add = TRUE  #add to previous plot
)


#predict with the model
predictions <- predict(
  object = model,
  newdata = test,
  type = "class"
)
#create confusion matrix
table(
  x = predictions,
  y = test$Species
)

library(caret)

confusionMatrix(
  data = predictions,
  reference = test$Species
)

save(model, file = "Tree.Rdata")
save(train, file = "Train.Rdata")

