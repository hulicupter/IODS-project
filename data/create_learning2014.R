#Atte Koskivaara, 9.11.2018. Beginning of 2nd exercise.

#read the data into memory
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header = TRUE)

#access the dplyr library

library(dplyr)

#look at the dimensions of the data
dim(lrn14)

#look at the structure of the data
str(14)

#combine questions
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

#select and average "deep"
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

#select and average "surf"
surf_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surf_columns)

#select and average "stra"
stra_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(stra_columns)

#choose columns 
keep_columns <- c("gender", "Age", "Attitude", "deep", "stra", "surf", "Points")

#select the keep columns to create a new dataset
learning2014 <- select(lrn14, one_of(keep_columns))

#see new dataset
str(learning2014)

#exclude where points is smaller than 0
learning2014 <- filter(learning2014, Points>0)

#check data structure
str(learning2014)
#set the working directory

setwd("C:/Users/user1/Documents/GitHub/IODS-project/data")


write.csv(learning2014, file = "learning2014.csv", append = TRUE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ",", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

luettu <- read.csv(file="learning2014.csv", header = T, sep = ",")

str(luettu)
