# BIO 365 - Assignment 18

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of the *t* distribution.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-18`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data (using the `read_csv` function), if applicable. Please do not store any of the CSV files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

### Problem Descriptions

These questions are derived from *The Analysis of Biological Data - 2nd Edition*. Please use R code to answer the following.

1. This problem is based on Assignment Problem 14 from Chapter 11 in the textbook. Please print an R vector that indicates the lower and upper bounds, respectively, for the 95% confidence interval. Please **round these numbers to 3 decimal places**.

2. This problem is based on Assignment Problem 16c from Chapter 11 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q16DolphinsClockwise.csv). Please print an R vector that indicates the lower and upper bounds, respectively, for the **99%** confidence interval. Please **round these numbers to 3 decimal places**.

3. This problem is based on Assignment Problem 18 from Chapter 11 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q18SticklebackPreference.csv). Use a two-sided t-test to evaluate the null hypothesis that, on average, stickleback fish do not prefer to mate differently by size. Calculate and print a P-value for this test. Please **do not round this number**.

4. This problem is based on Assignment Problem 21a from Chapter 11 in the textbook. You can access the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q21SoilLeadAndHurricanes.csv). Use `ggplot2` to create a histogram of the data. Use appropriate axis labels and save the graph to a file called `4.pdf`. Add a comment to your code that interprets what you see in the graph.

5. This problem is based on Assignment Problem 21c from Chapter 11 in the textbook. You can access the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q21SoilLeadAndHurricanes.csv). Use a one-sided t-test to evaluate the null hypothesis that mean soil lead did not change after the hurricanes. Calculate and print a P-value for this test. Please **do not round this number**.

6. This problem is based on Assignment Problem 25a from Chapter 11 in the textbook. You can access the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q25SlothEars.csv). Calculate and print the standard deviation. Please **round this number to 3 decimal places**.

7. This problem is based on Assignment Problem 25b from Chapter 11 in the textbook. You can access the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter11/chap11q25SlothEars.csv). Calculate and print the lower and upper limits, respectively, of the 95% confidence interval for the population standard deviation based on these data. Please **round this number to 3 decimal places**. Add a comment that provides your interpretation of what these confidence values mean in relation to the standard deviation from this sample.

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
