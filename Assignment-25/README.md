# BIO 365 - Assignment 25

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of permutation tests, simulation, and bootstrapping.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-25`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data (using the `read_csv` function), if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

### Problem Descriptions

Some of these questions are derived from *The Analysis of Biological Data - 2nd Edition*. Please use R code to answer the following.

1. Within your script, use the following code to create two vectors. Suppose that the `golden_eagles` values represent the number of days it takes for golden eagles to migrate from Canada to Mexico in October and that the `bald_eagles` values represent the number of days it takes for bald eagles to migrate the same route during the same timeframe. Generate a tibble that contains the data from these two vectors. The 1st column should be called "duration" and should be a concatenation of the `golden_eagles` and `bald_eagles` vectors (in that order). The 2nd column should be called "label" and should indicate whether each observation is from a golden eagle ("golden") or a bald eagle ("bald"). Print this entire tibble (not just the first few rows).

```

golden_eagles = c(7.85, 11.24, 23.53, 9.43, 11.05, 9.53, 15.47, 7.83, 9.32, 7.33, 16.19, 9.89, 9.31, 19.09, 7.73, 13.71, 11.76, 9.06, 32.91, 7.96)
bald_eagles = c(8.11, 9.70, 8.93, 10.24, 12.67, 23.84, 12.81, 7.25, 24.49, 8.74, 10.86, 7.14, 10.87, 11.95, 10.23, 16.72, 9.54, 14.01, 10.68, 13.79)
```

2. For this problem, use the tibble that you created in the first problem. Use `ggplot2` to create a side-by-side histogram of the data values for the two species. Set the `binwidth` of the histograms to 2. Save the graph to `2.pdf`.

3. For this problem, use the tibble that you created in the first problem. Create a function called `calc_median_diff` that accepts a tibble that is structured identically to the one you just created. Your function should use the data in this tibble to calculate the median duration for bald eagles and subtract it from the median duration for golden eagles. Your function should return this value. Next, invoke the `calc_median_diff` function that you just created, passing in the tibble that you created in problem #1. Assign this to a variable called `true_diff`. Print the value of `true_diff` (do not round).

4. Use the `set.seed` function to set the random seed to the number zero. Make a copy of the tibble you created in Problem #1. Use the `sample` function to permute the values in the `label` column of this tibble. Then use the `calc_median_diff` function that you created in the previous problem to calculate the median difference between golden and bald eagles based on these permuted labels. Print this permuted difference (do not round).

5. Build on the code that you used in the previous problem. Create a variable called `permuted_diffs` and initialize the value to `NULL`. Repeat the following process 1000 times: 1) create a copy of the original tibble, 2) permute the values in the `label` column in this tibble, 3) calculate the median difference between golden and bald eagles based on these permuted labels, and 4) add this median difference to `permuted_diffs`. In the end, you should have a vector of median differences that form your null distribution. Use `ggplot2` to plot a histogram of this null distribution. Use descriptive axis labels. Add a red, vertical, dashed line that indicates the median difference in the original data (hint: use `geom_vline`). Save the graph to `5.pdf`.

6. Build on the code that you used in the previous problem. Based on `permuted_diffs`, calculate the proportion of empirical null values that are *as far as or further away from* the empirical mean than `true_diff`. Divide this number by the total number of empirical null values that you generated (do not round). Please print this value (your empirical P-value).

7. This problem is based on Assignment Problem 12 from Chapter 19 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter19/chap19q11LoveDarts.csv). In your script, set the random seed to 0. Then generate 1000 bootstrap values of the **Spearman** correlation coefficient between the two variables in the data. Hint: Use the `sample_n` function select rows from the data and then calculate the correlation coefficients on that selected rows. Use `ggplot2` to generate a histogram of these values. Add a red, vertical, dashed line that shows the location of the Spearman correlation coefficient for the original data values. Use descriptive axis labels, and save the graph to `7.pdf`.

8. This problem uses the bootstrap replicate estimates that you generated for the previous problem. Calculate a **99%** confidence interval for the **Spearman** correlation coefficient between the two variables. Print an R vector that contains the lower and upper bounds, respectively, of this confidence interval (do not round).

9. Example 19.1 in the textbook describes a scenario where stage performers claimed to have telepathic powers by asking audience members to think of a two-digit number and then guessed those numbers rather accurately. You can find data that represents the numbers that volunteers selected for such an exercise [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter19/chap19e1TwoDigitNumbers.csv). The book describes using a simulation to evaluate the null hypothesis that audience members choose two-digit numbers with equal probability. First, in your script, set the random seed to 0. Then use R to repeat the 5 step that the book describes, starting at the bottom of page 637. Here are some tips:

a. Count the number of times each number (10-99) was guessed (you can use the `table` function for this). Make sure also to consider that some numbers were guessed 0 times.
b. Under the null hypothesis, the expected frequency of guessing each number is 315 / 90.
c. Calculate the chi-squared statistic as described on page 207. Do this for the observed values. Do the same 1000 times for simulated values that are randomly selected 315 times from 10-99.
d. The chi-squared statistics that you calculate for the simulated values will not match those shown in Table 19.1-1 because they used a different (unknown) random seed.

Use `ggplot2` to create a histogram displaying the simulated chi-squared statistic values. Also add a red, dashed, vertical line that shows the location of the observed chi-squared statistic. Save this graph to `9.pdf`.

10. This problem builds on the previous problem. Instead of creating a graph, calculate a P-value for the simulation analysis. The numerator should be the number of times the simulated chi-squared statistics exceeded the observed chi-squared statistic. The denominator should be the total number of simulations. *Add 1 to the numerator to avoid producing a P-value of zero.*

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