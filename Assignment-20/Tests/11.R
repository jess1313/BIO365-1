suppressPackageStartupMessages(suppressWarnings(suppressMessages(source("11.R"))))

print(signTest(c(43, -47, 154, 64, 127, 296, 16, -100, -980, -290, 1090, -8, -78, 70, 20400, -3, 2, 8, 12, 227, 1, 61, 1, 79, 78), 0))

set.seed(33)
print(signTest(rnorm(100), 0))
print(signTest(rnorm(10000), 0))
print(signTest(rnorm(10000, mean=0.1), 0))
print(signTest(rnorm(10000, mean=-0.1), 0))