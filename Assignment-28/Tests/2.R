suppressPackageStartupMessages(suppressWarnings(suppressMessages(source("2.R"))))

iris2 = iris
iris2$Species <- as.character(iris2$Species)
iris2 <- dplyr::filter(iris2, Species %in% c("virginica", "versicolor"))

print(classify(iris2, "Species", "classif.svm", list(mlr::acc, auc)))