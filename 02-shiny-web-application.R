#
# Introduction to Shiny
#

# Shiny is a web application framework for R

# Install the "shiny" package (a package is a library offering extra functionality to the base R components)
install.packages("shiny")

# Load the package
library(shiny)

# Run our shiny app
# (change the path to the right one. It must be relative to your working directory)
getwd() # get your working directory
runApp("uz/r/introduction-to-r/my-shiny-app") # write the path relative to your working directory
