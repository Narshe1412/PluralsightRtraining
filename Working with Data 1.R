#load table
cars <- read.table(
  file= "Cars.txt",
  header= TRUE,
  sep= "\t",
  quote= "\""
)

install.packages("dplyr")
library(dplyr)

temp <- select(
  .data = cars,
  Transmission,
  Cylinders,
  Fuel.Economy
)

temp <- filter(
  .data = temp,
  Transmission == "Automatic"
)

temp <- mutate(
  .data = temp,
  Consumption = Fuel.Economy * 0.425
)

temp <- group_by(
  .data = temp,
  Cylinders
)

temp <- summarize(
  .data = temp,
  Avg.Consumption = mean(Consumption)
)

temp <- arrange(
  .data = temp,
  desc(Avg.Consumption)
)

efficiency <- as.data.frame(temp)


efficiency2 <- cars %>%
  select(Fuel.Economy, Cylinders, Transmission) %>%
  filter(Transmission == "Automatic") %>%
  mutate(Consumption = Fuel.Economy * 0.425) %>%
  group_by(Cylinders) %>%
  summarize(Avg.Consumption = mean(Consumption)) %>%
  arrange(desc(Avg.Consumption)) %>%
  as.data.frame()

print(efficiency2)

write.csv(
  x=efficiency,
  file="Fuel Efficiency.csv",
  row.names = FALSE
)
