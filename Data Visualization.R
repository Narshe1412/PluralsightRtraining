cars <- read.csv("Cars2.csv")

library(ggplot2)

ggplot(
  data = cars,
  aes(x=Transmission)
) + geom_bar() +
  ggtitle("Count of cars by transmission type") + 
  xlab("Transmission Type") +
  ylab("Count of cars")

#histogram
ggplot(
  data=cars,
  aes(x=Fuel.Economy)
  ) +  geom_histogram(
      bins = 10
    ) +
  ggtitle("Distribution of fuel economy") + 
  xlab("Fuel economy (mpg)") +
  ylab("Count of cars")

#density plot
ggplot(
  data=cars,
  aes(x=Fuel.Economy)
) +  geom_density() +
  ggtitle("Distribution of fuel economy") + 
  xlab("Fuel economy (mpg)") +
  ylab("Count of cars")

#scatterplot
ggplot(
  data = cars,
  aes(
    x= Cylinders,
    y= Fuel.Economy
  )
) + geom_point() +
  ggtitle("Fuel economy by cylinders") + 
  xlab("Number of Cylincers") +
  ylab("Fuel economy (mpg)")
