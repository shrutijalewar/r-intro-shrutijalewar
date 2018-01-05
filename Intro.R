setwd('/Users/ssharma/code/nss-ds/r-intro-shrutijalewar')
# install.packages("dplyr")
# install.packages("magrittr")
library("dplyr")
library("magrittr")
# install.packages("ggplot2")
library("ggplot2")
iris_data <- iris

str(iris_data)
#a. What is the datatype of iris_data?  
#It is a dataframe with col 1,2,3,4 are numeric and 5th is Factor

# b. How many columns does it have? how many rows? 
#150 rows and 5 Cols

#Create a vector called sepal_area by multiplying the columns Sepal.Width and Sepal.Length in iris_data. 
sepal_area <- c(iris_data['Sepal.Length'] * iris_data['Sepal.Width'])
sepal_area

#Use the mean() function to find the average sepal_area, and store this in a variable called avg_sepal_area. 
avg_sepal_area <- lapply(sepal_area, mean, na.rm = TRUE)
avg_sepal_area

#Use a comment to show what this value is rounded to 4 decimal places.
lapply(avg_sepal_area, round, digits = 4)

# Use a for-loop to print "Sepal area is " and the area for each value in the vector. Use the paste() or paste0() function to concatenate strings.
for (area in sepal_area) {
  print(paste("Sepal area is", area))
}

# Now create a new column in the iris_data dataframe called Sepal.Area.  
iris_data['Sepal.Area'] = sepal_area
iris_data

# Copy the following code to your script: species_counts <- table(iris_data$Species) and use the barplot() function to display the counts. Use a comment to note which species has the most observations in the dataset.
species_counts <- table(iris_data$Species)
species_counts
barplot(species_counts,main = 'Species Distribution')
# All species are equally represented.

# Use the Help menu to examine the plot() function. You can either search under the Help tab in the Files Pane or type "?plot" in the console. 
# a. Create a plot showing how petal width (y) varies with petal length (x).

plot(iris_data$Petal.Length, iris_data$Petal.Width)
#b. Create a plot showing how sepal length (y) varies with petal length (x).
plot(iris_data$Petal.Length,iris_data$Sepal.Length)

# Look at the documentation for the par() function.
?par
# a. Paste the following code above your two plot calls: par(mfrow = c(1, 2)).
# b. Run the par() command and the two plot commands. Click 'Zoom' to get a better look at the plots.
par(mfrow = c(1, 2))
plot(iris_data$Petal.Length, iris_data$Petal.Width)
plot(iris_data$Petal.Length,iris_data$Sepal.Length)

#Take a look at the mtcars dataset with View(mtcars)
View(mtcars)

#a. What is drat? (hint - take a look at the documentation). Show your answer in a comment.
# Rear axle ratio

#b. Use the min() and max() functions to find the minimum and maximum 1/4 mile time.
min(mtcars$qsec)
max(mtcars$qsec)

#c. Look on the 'mtcars' tab that opened in your source pane with the View() command. Sort the data by the qsec column to see 
#which car has the slowest time and which has the fastest. Record your findings in a comment.
# slowest <- Ford Pantera L
# fastest <- Merc 230

# Create counts by number of cylinders for the dataset and use them to create a barplot. 
counts <- table(mtcars$cyl)
barplot(counts, main="Number of cars with cylinders")
# Which type of engine (number of cylinders) is most prevalent in the data?
# 8 is the most prevalent number of engine in the dataframe

#Write a for-loop that iterates through the mtcars dataframe. If the car is has 8 cylinders, print " is a gas guzzler."
#rownames(mtcars)
# 
for (row in 1:nrow(mtcars)) {
  cyl <- mtcars$cyl[row]
  car  <-  row.names(mtcars)[row]
  if (cyl == 8) {
    print(paste(car, "is a gas guzzler."))
  }
}

# Work through the code examples in the slides that use the starwars data. Use pipes to create a new view of the data.
View(starwars)

count(distinct(starwars, homeworld))
#49

homeworlds <-
  starwars %>%
  filter(!is.na(homeworld)) %>%
  group_by(homeworld) %>%
  summarize(Count = n())
homeworlds

#For those planets that two or more characters call home, how many characters list that as their home planet?
homeworlds %>%
  filter(Count > 1) %>%
  ggplot(aes(reorder(homeworld, Count), Count)) +
  geom_col(fill = "darkblue") +
  scale_y_continuous(breaks = seq(0, 12, 2)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("Home World") +
  ggtitle("Home Worlds of Star Wars Characters")

#Which character is the largest? Smallest? Is it male/female/neither?
starwars %>%
  ggplot(aes(mass, height, label = name)) +
  geom_text(size = 3,
            check_overlap = TRUE,
            aes(color = gender))
# non-metric version in inches and pounds
starwars %>%
  mutate(mass2 = mass * 2.2) %>%
  mutate(height2 = height * 0.393701) %>%
  ggplot(aes(mass2, height2, label = name)) +
  geom_text(size = 3,
            check_overlap = TRUE,
            aes(color = gender)) +
  xlab("weight (pounds)") +
  ylab("height (inches)")

# Install and load the swirl package. Work through the 'Introduction to Statistical Inference' course. 
# Typing info at a prompt will show you options for exiting swirl.
#install.packages("swirl")
library("swirl")
install_course("Introduction to Statistical Inference")
swirl()

