# BIO 365 - Assignment 24

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of linear regression.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-24`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data (using the `read_csv` function), if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

### Problem Descriptions

These questions are derived from *The Analysis of Biological Data - 2nd Edition*. Please use R code to answer the following.

1. This problem is based on Assignment Problem 19 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q19GrasslandNutrientsPlantSpecies.csv). Use `ggplot2` to create a scatterplot of the data. Add a linear-regression line to the plot as well as the 95% confidence interval for this line. Use descriptive axis labels. Save the graph as `1.pdf`. *Add a brief comment to your code that describes what you interpret from the graph.*

2. This problem is based on Assignment Problem 19 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q19GrasslandNutrientsPlantSpecies.csv). Find the slope and y-intercept of the regression line with nutrients as the explanatory variable and species as the response variable. Print an R vector that contains these values (in the order specified above, do not round). *Add a brief comment to your code that describes what you interpret from this result.*

3. This problem is based on Assignment Problem 20 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q20PrimateMassMetabolicRate.csv). Use `ggplot2` to create a scatterplot of the data. Add a linear-regression line to the plot as well as the 95% confidence interval for this line. Use descriptive axis labels. Save the graph as `3.pdf`. *Add a brief comment to your code that describes what you interpret from the graph.*

4. This problem is based on Assignment Problem 20 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q20PrimateMassMetabolicRate.csv). The book indicates that a species' basal metabolic rate depends on mass in the following way: `R = a*M<sup>B</sup>` (where M is body mass, a is the y-intercept, and B is the slope). If you log-transform each side of this equation, it becomes `log(R) = log(a) + B*log(M)`. Use linear regression to estimate B and the standard error for B. Create an R vector with these values and print the vector (do not round). *Add a brief comment to your code that describes what you interpret from this result.*

5. This problem is based on Assignment Problem 20 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q20PrimateMassMetabolicRate.csv). Building on the previous problem, use linear regression to estimate the 99% confidence interval for B. Create an R vector with the lower and upper bounds, respectively, and print this vector (do not round). *Add a brief comment to your code that describes what you interpret from this result.*

6. This problem is based on Assignment Problem 25 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q25BeetleWingsAndHorns.csv). Use `ggplot2` to create a residual plot. Relative horn size should be on the x axis, and residual values should be on the y axis (be sure to use descriptive axis labels). Color the dots in the graph red. Add a horizontal line that crosses the y axis at zero. Save the graph as `6.pdf`. Based on these results, do you interpret that the assumptions of linear regression have been met? *Add a brief comment to your code that answers this question and explains your logic.*

7. This problem is based on Assignment Problem 34 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q34FatherAgeMutations.csv). Evaluate the null hypothesis that there is no relationship between the age of fathers and the number of new mutations observed in their babies. Use linear regression to calculate a P-value for this test (use scientific notation, do not round). *Add a brief comment to your code that describes what you interpret from this result.*

8. This problem is based on Assignment Problem 34 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q34FatherAgeMutations.csv). Use linear regression to calculate the y-intercept and slope for the relationship between the age of fathers and the number of new mutations observed in their babies. Print an R vector that contains these values (do not round).

9. This problem is based on Assignment Problem 34 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q34FatherAgeMutations.csv). Use the y-intercept and slope that you calculated in the previous problem to predict the number of new mutations that will be observed in a baby of someone who is 18 years old. Then calculate the same for someone who is 36 years old. Print an R vector that contains these values (in that order, do not round).

10. This problem is based on Assignment Problem 34 of Chapter 17. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q34FatherAgeMutations.csv). Estimate the (unadjusted) proportion of variation that is explained by our linear-regression model for the relationship between the age of fathers and the number of new mutations observed in their babies. (Hint: You can retrieve this by using the `summary` function. Look at the help documentation for `summary.lm` to find how to access this specific value.) Print this value (do not round). *Add a brief comment to your code that describes what you interpret from this result.*

### Submitting the assignment

After you complete the problems, *commit* and *push* your answers to GitHub. You can commit your code using the following three commands (replace `<message>` with an actual message):

```
git add --all *.R
git commit -m "<message>"
git push origin master
```

After committing your solutions, make sure they show up properly on GitHub. You don't need to submit anything via Learning Suite for this assignment.

### Checking your assignment

You can use [this site](http://bonsai.byu.edu:9000) to check your code after you have committed it to GitHub. It will tell you whether your code produces output that matches the expected output. Let me know if you encounter any problems as you use this site. **This site is only available from BYU campus.**