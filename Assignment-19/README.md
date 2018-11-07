# BIO 365 - Assignment 19

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of comparing two means.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-19`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data (using the `read_csv` function), if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

### Problem Descriptions

These questions are derived from *The Analysis of Biological Data - 2nd Edition*. Please use R code to answer the following.

1. This problem is based on Assignment Problem 18a from Chapter 12 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q18StalkieEyespan.csv). Which statistical test should you use to determine whether the means are equal between the two groups of stalk-eyed flies. Please print "p" for the paired t-test, "t" for the standard two-sample t-test, or "w" for Welch's approximate t-test.

2. This problem is based on Assignment Problem 18b from Chapter 12 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q18StalkieEyespan.csv). Carry out the test you identified in the previous problem. Print the P value (**do not round**).  Please add a comment to your code with your interpretation of this result.

3. This problem is based on Assignment Problem 19 from Chapter 12 in the textbook. Which statistical test should you use to determine whether the means are equal between the two mutations. Please print "p" for the paired t-test, "t" for the standard two-sample t-test, or "w" for Welch's approximate t-test.

4. This problem is based on Assignment Problem 19 from Chapter 12 in the textbook. Use the summarized data in the table in the textbook. Calculate the *pooled sample variance*. The textbook shows the formula for calculating this based on summarized data, under the assumption that the data values follow the normal distribution. Please print this value and **round it to 2 decimal places**. Please add a comment to your code with your interpretation of this result.

5. This problem is based on Assignment Problem 19 from Chapter 12 in the textbook. Use the summarized data in the table in the textbook. Calculate the *standard error* for the difference between the two means. The textbook shows the formula for calculating this. Please print this value and **round it to 2 decimal places**.

6. This problem is based on Assignment Problem 19 from Chapter 12 in the textbook. Use the summarized data in the table in the textbook. Calculate the *t* value for the difference between the two means (hint: this will be a negative value). The textbook shows the formula for calculating this. Please print this value and **round it to 2 decimal places**.

7. This problem is based on Assignment Problem 19 from Chapter 12 in the textbook. Use the summarized data in the table in the textbook. Calculate the *P-value* for the difference between the two means. Please print this value and **round it to 2 decimal places**. Please add a comment to your code with your interpretation of this result.

8. This problem is based on Assignment Problem 20 from Chapter 12 in the textbook. Which statistical test should you use to determine whether the means are equal between the two groups. Please print "p" for the paired t-test, "t" for the standard two-sample t-test, or "w" for Welch's approximate t-test.

9. This problem is based on Assignment Problem 20 from Chapter 12 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q20ElectricFish.csv). What is the mean difference in the number of species between areas upstream and downstream of a tributary (hint: this will be a negative number)? Please print this value and **round it to 2 decimal places**.

10. This problem is based on Assignment Problem 20 from Chapter 12 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q20ElectricFish.csv). What is the confidence interval for the mean difference in the number of species between areas upstream and downstream of a tributary? Please print an R vector that indicates the lower and upper bounds, respectively, of the 95% confidence interval and **round it to 2 decimal places**. Hint: use the `t.test` function, which (among other things) returns a vector containing the confidence interval. However, this vector also includes the confidence level (0.95); you can remove this using the `as.vector` function.

11. This problem is based on Assignment Problem 20 from Chapter 12 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q20ElectricFish.csv). What is the P value for this test? Please print the P-value (**do not round this number**).  Please add a comment to your code with your interpretation of this result.

12. This problem is based on Assignment Problem 32 from Chapter 12 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q32BeerGlassShape.csv). Use Levene's Test to assess whether the variances are equal between the two groups. This function is implemented in the `car` package. You will need to install this package, but please install it separately from your script. Please print the full output of this function. (It appears there is not an easy way to extract the P-value specifically.) Please add a comment to your code with your interpretation of this result.

13. This problem is based on Assignment Problem 33 from Chapter 12 in the textbook. Please use `ggplot2` to create a graph that looks similar to the one shown in the textbook (it does not need to be an exact replica). You can see an example in the lecture slides. Save this graph to a file called `13.pdf`.

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
