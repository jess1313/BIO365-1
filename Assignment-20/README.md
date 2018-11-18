# BIO 365 - Assignment 20

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of handling violations of assumptions when working with numerical data.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-20`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data (using the `read_csv` function), if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

### Problem Descriptions

These questions are derived from *The Analysis of Biological Data - 2nd Edition*. Please use R code to answer the following.

1. This problem is based on Assignment Problem 18 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q18ZebraFinches.csv). Use the `facet_wrap` functionality in `ggplot2` to plot side-by-side histograms of the PHA values for each treatment. Make sure to use descriptive axis labels. Save this graph to a file called `1.pdf`. Add a brief comment to your code that describes what you infer after looking at the graph.

2. This problem is based on Assignment Problem 18 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q18ZebraFinches.csv). Use the Shapiro-Wilk test to calculate a P-value that indicates whether the PHA values (across both treatments) follow the normal distribution. Print this P-value (**do not round**). Add a brief comment to your code that describes what you infer after seeing this P-value.

3. This problem is based on Assignment Problem 18 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q18ZebraFinches.csv). Use [geom_qq](https://ggplot2.tidyverse.org/reference/geom_qq.html) in `ggplot2` to create a quantile-quantile plot of the PHA values. Save this graph to a file called `3.pdf`. Add a brief comment to your code that describes what you infer after looking at the graph.

4. This problem is based on Assignment Problem 18 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q18ZebraFinches.csv). Even though it may be overly conservative to do so, use the Mann-Whitney U Test to test whether the PHA values are significantly different between the treatment groups. Please print your P-value (**do not round**). Add a brief comment to your code that describes what you infer from this P-value.

5. This problem is based on Assignment Problem 20 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q20SalmonColor.csv). Use `ggplot` to create side-by-side histograms of the data for each species. Make sure to use descriptive axis labels. Save the graph to a file called `5.pdf`.

6. This problem is based on Assignment Problem 20 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q20SalmonColor.csv). Calculate the standard deviation for each of the 2 species. Then calculate the ratio of the standard deviation for the kokanee salmon to the standard deviation for the sockeye salmon. Print this ratio (**round to 1 decimal place**). Add a comment to your code that describes what you infer about this ratio.

7. This problem is based on Assignment Problem 20 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q20SalmonColor.csv). Use `ggplot` to create side-by-side histograms of the data for each species *after* a log transformation. Save the graph to a file called `7.pdf`.

8. This problem is based on Assignment Problem 20 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q20SalmonColor.csv). First, log-transform the data values. Then calculate the the ratio of the standard deviation for the kokanee salmon to the standard deviation for the sockeye salmon. Print this ratio (**round to 2 decimal places**). Add a comment to your code that describes what you infer about this ratio.

9. This problem is based on Assignment Problem 20 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q20SalmonColor.csv). Perform a Mann-Whitney U Test on the *original* data values, comparing the two fish species. Print the P-value (**do not round**). (You may get a warning message, which you can ignore in this case.) Add a brief comment to your code that describes what you infer from this P-value.

10. This problem is based on Assignment Problem 20 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q20SalmonColor.csv). Perform a two-sample t-test (*not* Welch's approximation) on the *log-transformed* version of the data, comparing the two fish species. Print the P-value (**do not round**). Add a brief comment to your code that describes what you infer from the P-value; also consider how this relates to the statistical test you performed in the previous problem.

11. Please write a function called `signTest`. This function should accept 2 arguments: 1) a vector of numeric values and 2) a hypothesized null (numeric) value. Your function should apply the *sign test* to the data and *return* a P-value (**do not round**) for this test. You can find instructions in the textbook about how to perform this test. (Please do *not* use an external package for this.)

12. This problem is based on Assignment Problem 21 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q21StressAndIncompatibleMates.csv). Calculate the difference in blood corticosterone concentration levels for each female between compatible and incompatible males and plot these differences in a `ggplot2` histogram. Use descriptive axis labels, and save the graph to a file called `12.pdf`.

13. This problem is based on Assignment Problem 21 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q21StressAndIncompatibleMates.csv). Print a logical value that indicates whether a log transformation would be an appropriate way to transform the data. Add a brief comment that indicates your reasoning.

14. This problem is based on Assignment Problem 21 from Chapter 13 in the textbook. You can download the data [here](http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q21StressAndIncompatibleMates.csv). Print a logical value that indicates whether the *signed rank test* would be an appropriate way to evaluate whether these differences are significantly different from the null hypothesis value of zero. Add a brief comment that indicates your reasoning.

15. Use the `signTest` function you created earlier to evalate whether these differences are significantly different from the null hypothesis value of zero. Print the P-value (**do not round**). Add a brief comment that describes what you infer from these results.

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