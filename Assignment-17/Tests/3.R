suppressPackageStartupMessages(suppressWarnings(suppressMessages(source("3.R"))))

set.seed(0)

print(getPWithin(rnorm(1000), -3, 1.5))
print(getPWithin(rnorm(1000), 1.0, 1.1))
print(getPWithin(rnorm(1000), -2, 10))
