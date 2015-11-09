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
# In this case, population of Barcelona by gender and district
D <- read.table("https://raw.githubusercontent.com/xpujol/introduction-to-r/master/datasets/opendata_2014_tpob-cp01.csv", header = TRUE, sep= ";", dec = ".")

D # Look at the data. Notice de NA values (Not Available)
D <- na.omit(D) # We'll clean up the data:
D # Now that's nicer

summary(D) # Summary of the data

# Use the "$" operator to access a certain column
D$DONES
# That's equivalent if you know the column number
D[,5]

# The data.frames can contain different types of data. For example, "DTE" and "BARRIS" are strings, whereas "TOTAL", "HOMES" and "DONES" are integers.
# On the other hand, the matrices we've seen before can only contain one type of data

# There's a special column type: "factors", which take on a limited number of different values. Each value is called a "level"

# Let's convert the column "DTE" ("district") to a factor
D$DTE <- as.factor(D$DTE)
