#read the data into memory
lrn14 <- read.table("C:/Users/user1/Documents/GitHub/IODS-project/data/learning2014.csv", sep=",", header = TRUE)
#check table
str(lrn14)
install.packages("ggplot2")
library(ggplot2)

# initialize plot with data and aesthetic mapping
p1 <- ggplot(learning2014, aes(x = attitude, y = points, col = gender))

# define the visualization type (points)
p2 <- p1 + geom_point()

# draw the plot
p2

# add a regression line
p3 <- p2 + geom_smooth(method = "lm")

# add a main title and draw the plot
p4 <- p3+ggtitle("Student's attitude versus exam points")