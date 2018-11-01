suppressPackageStartupMessages(suppressWarnings(suppressMessages(source("4.R"))))

set.seed(0)

print(getPWithout(rnorm(1000), -3, 1.5))
print(getPWithout(rnorm(1000), 1.0, 1.1))
print(getPWithout(rnorm(1000), -2, 10))
