install.packages("caret")
install.packages("ggplot2")
library(caret)
library(ggplot2)

setwd("/Users/justinlew/Documents/SFU/STAT445/project/pokemon-challenge")
getwd()
combats <- read.csv("combats.csv")
pokemon <- read.csv("pokemon.csv")
tests <- read.csv("tests.csv")


calcDiff <- function(arr) {
  counter <- 0
  arr$HP <- NA
  arr$Attack <- NA
  arr$Defense <- NA
  arr$Sp..Atk <- NA
  arr$Sp..Def <- NA
  arr$Speed <- NA
  arr$Total <- NA
  arr$Result <- NA
  for (row in 1:nrow(arr)) {
    arr[row, ]$HP <- pokemon[pokemon$X.==arr[row, 1],]$HP - pokemon[pokemon$X.==arr[row, 2],]$HP
    arr[row, ]$Attack <- pokemon[pokemon$X.==arr[row, 1],]$Attack - pokemon[pokemon$X.==arr[row, 2],]$Attack
    arr[row, ]$Defense <- pokemon[pokemon$X.==arr[row, 1],]$Defense - pokemon[pokemon$X.==arr[row, 2],]$Defense
    arr[row, ]$Sp..Atk <- pokemon[pokemon$X.==arr[row, 1],]$Sp..Atk - pokemon[pokemon$X.==arr[row, 2],]$Sp..Atk
    arr[row, ]$Sp..Def <- pokemon[pokemon$X.==arr[row, 1],]$Sp..Def - pokemon[pokemon$X.==arr[row, 2],]$Sp..Def
    arr[row, ]$Speed <- pokemon[pokemon$X.==arr[row, 1],]$Speed - pokemon[pokemon$X.==arr[row, 2],]$Speed
    if (arr[row, 1] == arr[row, 3]) {
      #result is 1 if the first Pokemon who attacks first wins
      arr[row, ]$Result <- 1
    } else {
      arr[row, ]$Result <- 0
    }
    if (row %% 1000 == 0) {
      counter <- counter + 1
      print(counter)
    }
  }
  return(arr)
}
combats <- calcDiff(combats)

