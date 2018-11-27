# BIO 365 - Assignment 27

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of clustering.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-27`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data, if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

For this assignment, you will work with a dataset that describes the location of bramble (blackberry) bushes on a square plot of land. You can access the data [here](http://vincentarelbundock.github.io/Rdatasets/csv/boot/brambles.csv). This file has 4 columns. The first is a unique identifier for each bush; you can ignore this column. The second column indicates the x (horizontal) coordinate of each bush; the third column indicates the y (vertical) coordinate of each bush. The fourth column indicates the age of each bush. Please use R code to complete the following problems.

1. Download the dataset. Based on this dataset, create a matrix called `coordinates` that indicates the x and y coordinates of each bush. Print the first 6 rows of `coordinates`.

2. This problem builds on the previous problem. Use the `set.seed` function to set R's random seed to 0. Then use the `kmeans` function to apply the k-means clustering algorithm to `coordinates`. Specify that you want to identify 3 clusters (look at the documentation for the `kmeans` function to find how to do this). Print the vector of cluster assignments that this function produced.

3. This problem builds on the previous problem. Create a tibble that consists of the original tibble that you downloaded, merged with the cluster assignments (hint: use the `cbind` function). Use `ggplot2` to create a scatterplot of the x/y coordinates. Color each of the points based on the cluster assignments. Save the graph to `3.pdf`. *Add a brief comment to your code that describes what you interpret from this graph.*

4. Repeat what you did for the previous problem. But this time specify that you want to use the "Forgy" algorithm for identifying clusters (look at the documentation for the `kmeans` function). Save the graph to `4.pdf`. *Add a comment to your code that describes whether you think these clustering assignments are better or worse than what you observed in the previous problem (there is not a wrong or right answer on this). Briefly describe your reasoning.*

5. Repeat what you did for problem 4. This time specify that you want to identify 10 clusters rather than 3. Save the graph to `5.pdf`. *Add a comment to your code that describes whether you think these clustering assignments are better or worse than what you observed in the previous problem (no wrong or right answer). Briefly describe your reasoning.*

6. This problem builds on the previous problem. Instead of creating a graph, you will use some metrics to assess the quality of the cluster assignments. The `kmeans` function provides the "total within-cluster sum of squares" and "between-cluster sum of squares" metrics. These indicate how cohesive the clusters are and how distinct the clusters are from each other, respectively. Please print the value of these two metrics (on separate lines) after you have generated 10 clusters and used the "Forgy" algorithm. Make sure to set the random seed to 3.

7. This problem builds on the previous problem. Choosing the number of clusters to identify (k) is an arbitrary decision. But we can attempt to pick an optimal *k* value based on the data. First set the random seed to 3. Then try using *k* values between 2 and 20. Use the "Forgy" algorithm and set `iter.max` to 1000. For each *k* value, record the "total within-cluster sum of squares" and "between-cluster sum of squares" metrics. Print an R vector that indicates your answers to the questions below. *Also add a comment about why this might not be an ideal approach for selecting k.*

    1. What *k* value gives you the optimal result for "total within-cluster sum of squares"?

    2. What *k* value gives you the optimal result for "between-cluster sum of squares"?

8. Sometimes the best way to demonstrate that cluster assignments are valid is to associate them with phenotypic observations. In this dataset, we have the age of each bramble bush. There are 3 different ages listed (0, 1, or 2), so let's go back to defining 3 clusters. (Continue to use a random seed of 3, the "Forgy" algorithm, and an `iter.max` value of 1000.) For the bramble bushes of age "0", what proportion of times were they assigned to cluster "1", "2", or "3" (in that order)? Please print an R vector that indicates these proportions (**round to 2 decimal places**). *Add a brief comment that describes what you interpret from this finding.*

9. This problem builds on the previous problem. Use `ggplot2` to create a scatterplot that illustrates the clustering assignments in combination with the age values. Change the `size` of the points based on each bush's age. (Hint: convert the cluster assignments and age to factors before plotting.) Save the graph to `9.pdf`. *Add a brief comment about what you interpret from this graph.*

### Submitting the assignment

After you complete the problems, *commit* and *push* your answers to GitHub. You can commit your code using the following three commands (replace `<message>` with an actual message):

`
git add --all *.R
git commit -m "<message>"
git push origin master
`

After committing your solutions, make sure they show up properly on GitHub. You don't need to submit anything via Learning Suite for this assignment.

### Checking your assignment

You can use [this site](http://bonsai.byu.edu:9000) to check your code after you have committed it to GitHub. It will tell you whether your code produces output that matches the expected output. Let me know if you encounter any problems as you use this site. **This site is only available from BYU campus.**