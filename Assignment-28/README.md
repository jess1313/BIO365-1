# BIO 365 - Assignment 28

### Introduction

The purpose of this assignment is to give you practice coding in R and to help reinforce your understanding of classification.

Please go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-28`. As you work through this assignment, please put your R scripts in that directory. Read the instructions carefully for each problem listed below. For each of the problems, you should write an R script called `X.R`, but replace `X` with the problem number. For example, for problem 1, the R script would be named `1.R`. **Each of these scripts should load any R libraries that you need and should download data, if applicable. Please do not store any data files in your Git repository.**

### Getting Started

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

Your objective will be to apply 5 different classification algorithms to 2 types of data and to evaluate the performance of these algorithms.

Please install the following R packages, which will be used for this exercise, as shown below. (Please do **not** include code to install these packages in your scripts.)

* mlr
* randomForest
* kknn
* gbm
* e1071

For this assignment, you will use the `mlr` package, which acts as a software wrapper around many R packages for machine learning. You can find documentation on the `mlr` package [here](https://mlr.mlr-org.com/index.html).

## Demo using iris data

The following code demonstrates how to do a classification analysis using the iris data that comes with R. Please read through the code and pay attention to the comments, which explain each step.

```
library(mlr)

# We will use a simplified version of the iris data.
# First, we will convert the Species values from a factor object to a character object.
iris2 = iris
iris2$Species <- as.character(iris2$Species)

# Now we will exclude the iris setosa samples.
iris2 <- dplyr::filter(iris2, Species %in% c("virginica", "versicolor"))

# Create a task object that indicates which data will be used.
# It is also necessary to indicate which column contains the class (target) values.
task <- makeClassifTask(data = as.data.frame(iris2), target = "Species")

# Create a learner object that indicates which classification algorithm we want to use.
# Also indicate that we want the algorithm to generate probabilistic predictions.
# In this example, we are using the Support Vector Machines (SVM) algorithm.
learner <- makeLearner("classif.svm", predict.type = "prob")

# Specify the resampling strategy.
# In this case, we indicate that we want to use cross-validation with 10 folds.
resampleDesc = makeResampleDesc("CV", iters = 10)

# Because cross validation relies on random assignments, set a random seed to
#   ensure that we will get consistent results across multiple executions.
set.seed(1)

# Make the predictions (combine the data with the algorithm and resampling strategy).
# By specifying "show.info=FALSE", we are telling mlr to only display important information
#   at the console.
results <- resample(learner, task, resampleDesc, show.info=FALSE)
```

Now that we have made predictions, we can see how accurately the SVM classification algorithm was able to predict the iris species for each of the samples. We can see a summary of the predictions that were made using the code shown below. It indicates the resampling strategy that was used and other parameters that were specified (either explicitly or as default values). It also shows prediction information for the first few samples.

```
print(results$pred)
```

To extract the full set of prediction values, we can use the code shown below. The prediction data frame contains a unique identifier for each sample (`id` column), the `true` class (versicolor or virginica), the predicted probability that each sample belongs to each class (`prob.virginica` and `prob.versicolor` columns), the predicted class (`response` column), and the cross-validation fold for which each sample was assigned as a test sample (`iter` column).

```
predictions <- results$pred$data
print(head(predictions))
```

Based on these predictions, we can obtain performance metrics that evaluate the accuracy of the predictions. For example, if we wanted to see the classification *accuracy*, we could use the code shown below. (We have to prefix the "acc" measure with "mlr::" because an ```acc``` function has been defined in multiple R libraries. We tell it to use the ```acc``` function from the mlr package.)

```
accuracy <- performance(results$pred, measures = mlr::acc)
print(accuracy)
```

If we wanted to obtain multiple performance metrics, we could use code such as the following:

```
metrics <- performance(results$pred, measures = list(mlr::acc, auc, tpr, tnr))
print(metrics)
```

If we wanted to obtain the value for one of these specific metrics, we could use code such as the following:

```
print(metrics["acc"])
```

## Idiopathic Pulmonary Fibrosis data

Idiopathic pulmonary fibrosis (IPF) is a disease where tissue deep inside a person's lungs forms scars that prevents the person from breathing properly and eventually may cause lung failure. In most cases, physicians cannot find a cause for this disease, and there is currently [no cure](http://www.nhlbi.nih.gov/health/health-topics/topics/ipf). Accordingly, there is an urgent need for researchers to understand more about this disease.

Researchers at the University of Illinois at Chicago performed a study to examine 115 people who had either been diagnosed with IPF or who were healthy controls. They collected each person's age, ethnicity, and sex. They used gene-expression microarrays to profile blood cells from each person. They sought to identify patterns that were different between these two groups (IPF vs. healthy) in hopes of understanding more about what causes the disease. In addition, they hoped to develop a way to accurately predict who will develop IPF so they could intervene at an early stage of the disease.

The researchers have posted the data [here](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE38958). Cleaned and simplified versions of the data are included in this repository. GSE38958_Clinical.tsv contains clinical information about each person. GSE38958_GeneExpression.tsv contains gene-expression data for the same patients; only 1000 genes are included in GSE38958_GeneExpression.tsv so the algorithms will execute reasonably quickly. Both files contain a "Class" column, which indicates the disease status for each patient; this is the "target" that we want the algorithm to predict.

## Problem Descriptions

*Please let me know if you see any errors in these problem descriptions or in the expected outputs. Thanks!*

Please complete the following using R code.

1. Read the data files into tibble objects in R. Then convert the Ethnicity and Sex columns of the clinical data to factors. Print the first 10 rows of the clinical data. Then print the first 10 rows and first 5 columns of the gene-expression data.

2. Create a function that performs a classification analysis using **5-fold** cross validation. It should generate probabilistic predictions (see example code above). This function should accept four parameters:

    a. A tibble (either the clinical data or gene-expression data).
    b. The name of the column in the tibble that contains the class variable (target).
    c. The name of a classification algorithm implemented in the mlr package--one of the following: `classif.svm`, `classif.randomForest`, `classif.naiveBayes`, `classif.kknn`, `classif.gbm`.
    d. A list of the performance metrics (for example, `list(mlr::acc, auc)`) that you want to use to evaluate the algorithm.
    
    Within the function, specify a random seed of 1 (before resampling) and return the performance results. Make sure you verify that your output matches the expected output.

3. This problem builds on the previous ones. Apply the function you just created to the **clinical data**. Apply the classification algorithms indicated below (in that order) (more details about these algorithms are [here](https://mlr.mlr-org.com/articles/tutorial/integrated_learners.html)).

    * classif.svm (Support Vector Machines)
    * classif.randomForest (Random Forest)
    * classif.naiveBayes (Naive Bayes Classifier)
    * classif.kknn (k-nearest neighbors)
    * classif.gbm (Gradient Boosting Machine)

    Specify that you want to calculate the following metrics: accuracy, AUC, F1 score, and Matthews Correlation Coefficient (details [here](https://mlr.mlr-org.com/articles/tutorial/measures.html)).

    Print the output. (You might get warning messages. Don't worry about those.)

4. Repeat what you did for the previous problem, but use the gene-expression data.

5. Which algorithm resulted in the highest value for each of the metrics for the clinical data? Please write R code to find this; print a named vector with your answers.

6. Which algorithm resulted in the highest value for each of the metrics for the gene-expression data? Please write R code to find this; print a named vector with your answers.

7. On average across all of the algorithms, do we get better area under the receiver operating characteristic curve (AUC) values for clinical data or gene-expression data? Please print "clinical" or "expression".

[Optional] Look at the documentation for the `mlr` package to learn about [filter methods](https://mlr.mlr-org.com/articles/tutorial/filter_methods.html) (also known as feature selection). See if you can identify which genes are most informative for distinguishing between IPF tissues and healthy controls, based on the "randomForest.importance" method.

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