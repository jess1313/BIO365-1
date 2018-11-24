# BIO 365 - Assignment 26

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of principal component analysis.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-26`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data, if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

This assignment uses DNA variant data from the [1000 Genomes Project](http://www.internationalgenome.org). For that project, DNA was collected and sequenced for individuals from geographical locations around the world. I downloaded the data (VCF files) and annotated the variants using the [Variant Effect Predictor](http://www.ensembl.org/info/docs/tools/vep/index.html) tool. These annotations indicate the predicted severity of each DNA variant. For example, they indicate whether a variant has a low, medium, or high likelihood of affecting the function of the protein(s) associated with each DNA variant. For simplicity, I have filtered the data so that it only includes DNA variants that are most likely to affect protein function. I have also limited the data to variants from chromosomes 22 and X. [This document](Data_Prep.md) contains the scripts/code that I used for annotating and filtering the variants. If you are interested, feel free to exam that document (not required).

This repository includes data files to support this assignment. These files are described below. Each file is *tab-separated*.

* SampleInfo.tsv. This file contains "metadata" about each 1000 Genomes Project participant. Each row contains data for a specific person. The SampleID column is a unique identifier for each participant. In some cases, the 1000 Genomes Project obtained data for multiple individuals per family. In these cases, all individuals from the same family are grouped using a FamilyID value; otherwise, the FamilyID value is the same as the SampleID value. The Population column indicates the geographical population from which each participant came. You can learn more about these populations [here](http://www.internationalgenome.org/category/population).

* chr22.HIGH.variants.tsv. This file contains genotype values for chromosome 22. Each row in this file contains all the genotype values for a given participant. These genotypes are represented as 0, 1, or 2. A person who was [homozygous](https://en.wikipedia.org/wiki/Zygosity) for the reference allele would have a value of 0; a person who was heterozygous would have a value of 1, a homozygous non-reference genotype would be represented as 2. The rows in this file are in the same order as the rows in SampleInfo.tsv.

* chrX.HIGH.variants.tsv. This file contains genotype values for chromosome X and is structured the same as chr22.HIGH.variants.tsv.

### Problem Descriptions

Please use R code to answer the following. You will need to use `readr`, `dplyr`, and `ggplot2` packages, which are part of the `tidyverse`.

1. Read the data files into R objects (hint: use `read_tsv` function). Call these objects `sampleData`, `chr22Data`, `chrXData`, respectively. Print the first 3 rows and first 3 columns of `sampleData`, `chr22Data`, `chrXData` (in that order).

2. This problem builds on the previous one. Please do the following:

    a. Modify `sampleData` so that it only includes patients from the following populations: CEU (Utah), YRI (Yoruba, Nigeria), GWD (The Gambia, Africa), ASW (African ancestry in American Southwest), GBR (Great Britain), TSI (Tuscany, Italy), CHS (Southern Han Chinese), and JPT (Tokyo, Japan). Use the `dim` function to print the dimensions of `sampleData`.

    b. Use the `group_by` and `summarize` functions to create a tibble called `populationData`. This tibble should be derived from `sampleData` and should indicate the number of individuals in `sampleData` from each of these populations. In `populationData`, name the columns "Population" and "Count". Print this tibble.

    c. Filter `chr22Data` so that it only contains data for the samples now in `sampleData`. Also exclude the first column (SampleID) from `chr22Data` and convert it to a *matrix* object. Print the first 3 rows and first 3 columns of `chr22Data`. Make sure the data values are integers, not strings.

    d. Filter `chrXData` so that it only contains data for the samples now in `sampleData`. Also exclude the first column (SampleID) from `chrXData` and convert it to a *matrix* object. Print the first 3 rows and first 3 columns of `chrXData`. Make sure the data values are integers, not strings.

3. This problem builds on the previous one. Please do the following.

    a. Apply the `prcomp` function to `chr22Data` to calculate the principal components of that object. Store the result in an object called `chr22PC`. Because the genotypes are discrete values, you do not need to scale the data.
    
    b. Use `ggplot2` to create a scatterplot with the 1st principal component on the x-axis and the 2nd principal component on the y-axis. Obtain these values from the `$x` variable in `chr22PC`. Because `ggplot2` only accepts tibbles, you will need to first put these values in a tibble. This tibble should also include an integer column that indicates which principal component each of these values represents.

    c. Color the points according to the `Population` values specified for each patient in `sampleData`.

    d. Use descriptive axis labels and change the title of the legend to "Population".

    e. Save the graph to `3.pdf` (make sure your graph looks like the expected output).

    f. Add a comment to your code that describes what you conclude from this graph about genetic similarities and dissimilarities among these populations.

4. This problem builds on the previous one. Calculate the percent variance explained by the principal components. (See the slides for an example of how to do this.) Use `ggplot2` to create a bar graph that illustrates the percent variance explained for the *first four* principal components. Save this graph to `4.pdf` (make sure your graph looks like the expected output). Add a comment to your code that describes what you interpret from the graph.

5. This problem builds on problem #3. Repeat the steps you completed for that problem, but use the data from chromosome X. This time, color the points by the values for Gender rather than Population. Save this graph to `5.pdf` (make sure your graph looks like the expected output). Add a comment to your code that describes what you interpret from the graph.

[Optional] Use principal component analysis to evaluate the genetic similarity among individuals from the same family. It might be a little tricky to plot this for the whole data set, so you might limit your analysis to 5-10 families from the CEU population.

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