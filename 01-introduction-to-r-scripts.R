# Introduction to R scripts

# To run a command in RStudio, go to a specific line and press [CMD]+[ENTER] (or [CTRL]+[ENTER] on Windows)

#
# 1. TO GET STARTED
#

# Basic math operations
# (go to the desired)
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

# Matrices
A <- matrix(data = x, nrow = 5, ncol = 2, byrow = FALSE)
A

B <- matrix(data = x, nrow = 5, ncol = 2, byrow = TRUE)
B

B[3,2] # access an element
B[5,2] <- 0 # assign a new value to an element
B

# Help! I need somebody!
# Type "? + function_name" to get help
?plot
?c


#
# 2. READING DATA
#
