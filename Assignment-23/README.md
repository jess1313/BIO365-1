# BIO 365 - Assignment 23

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of correlation analysis.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-23`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data (using the `read_csv` function), if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

### Problem Descriptions

These questions are derived from *The Analysis of Biological Data - 2nd Edition*. Please use R code to answer the following.

1. This problem is based on Assignment Problem 15 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q15LanguageGreyMatter.csv). Use `ggplot2` to create a scatterplot of the `proficiency` (x axis) and `greymatter` (y axis) variables. Use descriptive axis labels. Save the file as `1.pdf`.

2. This problem is based on Assignment Problem 15 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q15LanguageGreyMatter.csv). Calculate the Pearson's correlation coefficient for the relationship between `proficiency` and `greymatter`. Print this coefficient (**do not round**).

3. This problem is based on Assignment Problem 15 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q15LanguageGreyMatter.csv). Test the null hypothesis that the correlation coefficient between `proficiency` and `greymatter` is zero. Print the P-value for this test (**use scientific notation, do not round**).

4. This problem is based on Assignment Problem 15 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q15LanguageGreyMatter.csv). Test the null hypothesis that the correlation coefficient between `proficiency` and `greymatter` is zero. Print an R vector that contains two elements: the lower and upper bounds of the **95%** confidence interval (**do not round**). [This page](https://stackoverflow.com/questions/38150211/r-how-to-extract-confidence-interval-from-cor-test-function) may be helpful for extracting the actual interval values.

5. This problem is based on Assignment Problem 15 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q15LanguageGreyMatter.csv). Test the null hypothesis that the correlation coefficient between `proficiency` and `greymatter` is zero. Print an R vector that contains two elements: the lower and upper bounds of the **99%** confidence interval (**do not round**).

6. This problem is based on Assignment Problem 16 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q16GreenSpaceBiodiversity.csv). Calculate the Pearson correlation coefficient for the relationship between `attachment` and each of the following variables: `butterfly`, `bird`, and `ln.plant`. Print an R vector that contains these coefficients (in the order indicated above, do not round).

7. This problem is based on Assignment Problem 18 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q18SalmonSalmonberries.csv). Use `ggplot2` to create a scatterplot that illustrates the relationship between `streamSalmonDensity` (x axis) and `salmonberryDensity` (y axis). Use descriptive axis labels. Save the file as `7.pdf`. # Add a comment that indicates what you see in this graph vs. the one shown in the textbook.

8. This problem is based on Assignment Problem 18 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q18SalmonSalmonberries.csv). Calculate the Pearson correlation coefficient using the **transformed** versions of the data (in additional columns in the data file). Print this value (do not round).

9. This problem is based on Assignment Problem 18 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q18SalmonSalmonberries.csv).  Calculate the Spearman correlation coefficient using the **non-transformed** versions of the data. Print this value (**do not round**). Add a comment that describes your conclusions about the importance (or not) of using a nonparametric test on this dataset.

10. This problem is based on Assignment Problem 20 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q20SleepAndPerformance.csv). Calculate the Pearson correlation coefficient for the relationship between `sleep` and `improvement`. Print this value (**do not round**).

11. This problem is based on Assignment Problem 20 of Chapter 16. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q20SleepAndPerformance.csv). Calculate the standard error of the Pearson correlation coefficient for the relationship between `sleep` and `improvement`. The book describes how to calculate this (use the Pearson correlation coefficient for `r`). Print the standard error (**do not round**).

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