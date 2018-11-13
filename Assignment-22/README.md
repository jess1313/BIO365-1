# BIO 365 - Assignment 22

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of *analysis of variance* (ANOVA).

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-22`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data (using the `read_csv` function), if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

### Problem Descriptions

These questions are derived from *The Analysis of Biological Data - 2nd Edition*. Please use R code to answer the following.

1. This problem is based on Assignment Problem 17 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q17DaphniaResistance.csv). Use the `facet_wrap` functionality of `ggplot2` to create histograms of the data, grouped by Cyanobacterium density (the textbook shows an example). Make sure to use appopriate axis labels, color the bars red in the histogram, and use a `binwidth` value of 0.1. Save the graph to a file called `1.pdf`.

2. This problem is based on Assignment Problem 17 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q17DaphniaResistance.csv). Use the Kruskal-Wallis test to evaluate whether there is a difference among the populations. (**First you must convert the `cyandensity` column to a factor.**) Print the P-value (**do not round**). *Then write a comment that explains why the Kruskal-Wallis method is more appropriate than ANOVA for this dataset.*

3. This problem is based on Assignment Problem 30 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q30FiddlerCrabFans.csv). (After loading the file, you may need to remove the last line in the file...it may have only NA values.) Plot the data in a box plot using `ggplot2` (you should have a single plot with 3 boxes). Use `geom_jitter` to add the individual data points on top of the boxes. Use descriptive axis labels. Save the graph to a file called `3.pdf`.

4. This problem is based on Assignment Problem 30 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q30FiddlerCrabFans.csv). (After loading the file, you may need to remove the last line in the file...it may have only NA values.) Use ANOVA to test whether the mean rate of heat gain differs among the groups. Print the P-value (**use scientific notation, do not round**). *Then write a comment that explains your conclusion based on these results.*

5. This problem is based on Assignment Problem 31 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q30FiddlerCrabFans.csv) (this is the same dataset as Assignment Problem 30). When the researchers originally planned this experiment, they were particularly interested in testing for a difference between the two male groups: "male major removed" and "male minor removed." This can be treated as a *planned comparison*. Using the technique described in section 15.3, calculate the 95% confidence interval for the difference between the means of these two groups. (You can you calculate the mean-squares error using `aov` or using the equations in the book.) Print an R vector that contains the lower and upper bounds, respectively, of this confidence interval (**do not round**).

6. This problem is based on Assignment Problem 31 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q30FiddlerCrabFans.csv). Used the Tukey-Kramer method to perform an *unplanned comparison*, calculating a P-value for each of the group comparisons. From these results, extract the P-value for the "male major removed" vs "male minor removed" comparison and print that P-value (**do not round**).

7. This problem is based on Assignment Problem 27c of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q27NonsenseMathEffect.csv). Calculate the R-squared value for the comparison between degree subject (`areaClassification`) and score difference (`ratingAdvantageOfManipulatedAbstractOverTheOther`) and print this value (**do not round**). (You can you use the output of the `aov` function to help with this calculation.) *Add a comment that indicates what this value means in this scenario.*

8. This problem is based on Assignment Problem 22 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q22WalkingStickHeads.csv). Use ANOVA (random-effects) to calculate a P-value for the relationship between species and head width. First, you'll need to convert one of the columns to a factor. Print the P-value (**do not round**).

9. This problem is based on Assignment Problem 22 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q22WalkingStickHeads.csv). Use ANOVA (random-effects) to estimate the variance *among* the groups (see *Variance components* in section 15.6). Print this value (**do not round**). *Add a comment that indicates what this value means in this scenario.*

10. This problem is based on Assignment Problem 22 of Chapter 15. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q22WalkingStickHeads.csv). Use ANOVA (random-effects) to estimate the *Repeatability* metric (see *Repeatability* in section 15.6). Print this value (**do not round**). *Add a comment that indicates what this value means in this scenario.*

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