# Introduction to R scripts

# To run a command in RStudio, go to a specific line and press [CMD]+[ENTER] (or [CTRL]+[ENTER] on Windows)

#
# 1. TO GET STARTED
#

# Basic math operations
4 + 3 # you'll see a [1] appearing at the left of the result. This is a reference (we'll take a look at it later)
4 * 3
cos(0)

# Variables and assignments
x # doesn't exist yet
x <- 4
x
x + 3

y <- sqrt(x)
y
x + y

# Vectors: ordered lists
x <- c(2,3) # create a vector concatenating the values 2 and 3
x

x <- seq(0, 10, 1) # sequence from 0 to 9, with step 1
x

y <- seq(0, 10, 0.1) # sequence from 0 to 9, with step 0.1
y # take a look at the reference numbers [1], ...
# Now make the console window smaller and run the previous command again. You'll see the reference numbers changing

y <- x^2 # operations are automatically applied element-wise (like a javascript map() method)
y

# Let's draw!
plot(x, y)
plot(y, x)

# Try It Yourself!
# Obtain a vector z which is the result of multiplying by 3 each number of the vector x
z <- ...
# Easy, right? :)

# Matrices
A <- matrix(data = x, nrow = 5, ncol = 2, byrow = FALSE)
A

B <- matrix(data = x, nrow = 5, ncol = 2, byrow = TRUE)
B

B[3, 2] # access an element
B[5, 2] <- 0 # assign a new value to an element
B

# Help! I need somebody!
# Type "? + function_name" to get help
?plot
?c


#
# 2. READING DATA
#

# Now we'll use some real data.
# There's plenty of open data websites out there, we'll use OpenDataBarcelona as an example http://opendata.bcn.cat/opendata/

# Load data using a URL or a local relative path
# In this case, population of Barcelona by gender, age and household occupation per district
D <- read.table("https://raw.githubusercontent.com/xpujol/introduction-to-r/master/datasets/barcelona_age_gender_occupation.csv", header=TRUE, sep=",")

summary(D) # Summary of the data

# Use the "$" operator to access a certain column
D$AGE_AVG
# That's equivalent if you know the column number (columns are numbered starting from 1)
D[,3]

# The matrices we've seen before can only contain one type of data.
# But data.frames can contain different types of data. For example, "DISTRICT" and "NEIGHBORHOOD" are strings, whereas "AGE_AVG", "PERC_FEMALE" and "HOUSEHOLD_SIZE" are integers.

# There's a special column type: "factors", which take on a limited number of different values. Each value is called a "level".
# The column "DISTRICT" is a factor with 10 levels
D$DISTRICT


#
# 3. ANALYSING DATA
#

# Analysis of 1 variable
plot(D$AGE_AVG, xlab="Barcelona neighborhoods", ylab="Average age")
plot(D$PERC_FEMALE, xlab="Barcelona neighborhoods", ylab="Percentage of female population")
plot(D$HOUSEHOLD_SIZE, xlab="Barcelona neighborhoods", ylab="Household size")
# We don't see much here, we can just guess whether or not the neighborhoods are homogeneous in terms of age, female population, etc

# Let's group de data per district:
boxplot(D$AGE_AVG ~ D$DISTRICT, xlab="Barcelona districts", ylab="Average age")
# In what district have all the neighbourhoods a low average age?

# Now draw the boxplots for Female population and Household size per district
boxplot(..., xlab="Barcelona neighborhoods", ylab="Percentage of female population")
boxplot(..., xlab="Barcelona neighborhoods", ylab="Household size")

# Let's draw all the variables together
# With pch you can change the icon used to draw the plot
pairs(~AGE_AVG+PERC_FEMALE+HOUSEHOLD_SIZE, data=D, pch=24)

# What variables do you think are corelated?
# Try replacing the values of VARIABLE1 and VARIABLE2 to see the linear regression of two correlated variables
plot(D$VARIABLE1, D$VARIABLE2, col = "red", xlab = "Description of VARIABLE1", ylab = "Description of VARIABLE2")
model <- lm(D$VARIABLE2, D$VARIABLE1)
abline(model, col = "blue", lty = 2)
legend("bottomright", inset = .05, c("observations", "adjustment"), col = c("red","blue"), pch = c(1,NA), lty = c(NA,2))
