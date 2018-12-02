# BIO 365 - Assignment 29

### Introduction

The purpose of this assignment is to help you gain experience with Jupyter notebooks, which are used by millions of people around the world each year for literate programming (a form of computational reproducibility).

Please complete the following steps:

1. Go to [http://jupyter.org/try](http://jupyter.org/try).

2. Click on Try Jupyter with R. After clicking, wait a few seconds, and it will give you an example Jupyter notebook to play with. Delete all the existing cells in that Jupyter notebook (see the Edit menu within the notebook). Then create a new cell. Within that cell, write R code to load the `ggplot2` library. Then create a second cell. Within the second cell, write R code to create a boxplot based on the `iris` data (this data comes with R when you install it). Put `Species` on the x-axis and `Petal.Length` on the y-axis. Indicate that you want the *fill color* of the boxes to be determined by Species. Then remove the figure legend (you don't need it because the species names are listed under each box). You may need to do an Internet search to find how to change the fill color and remove the legend. (As an example, see the file called [Iris_Image.png](Iris_Image.png) in this directory.)

3. Run the cells within your Jupyter notebook to make sure the code works properly.

4. Use the File menu within the notebook to download the notebook as an .ipynb file to your local computer.

5. On your GitHub account, create a new repository (**not** a new directory within your current repository). Call this new repository "Reproducibility_Demo".

6. Clone this new repository to your local computer (not within any other git repository).

7. Move the .ipynb file that you downloaded in step 3 into the root of this new repository.

8. The next step is to integrate with [mybinder.org](https://mybinder.org). The purpose of [mybinder.org](https://mybinder.org) is to enable researchers to execute Jupyter notebooks from their browser without having to host their own server. To use [mybinder.org](https://mybinder.org), you must configure a GitHub repository a certain way. In the repository, you need a file called `runtime.txt` that indicates what programming language(s) you want to use (R in our case). You also need a script that will install any packages that are needed for that programming language. [Here](https://github.com/binder-examples/r) you can find an example of how to configure a GitHub repository to execute R code within a Jupyter notebook and to work with [mybinder.org](https://mybinder.org). Modify your new Reproducibility_Demo GitHub repository to follow this pattern. You can just copy their `runtime.txt`. Create an `install.R` script; because this is a simple project, you only need to install the `ggplot2` package within this script. Create a simple `README.md` file. Commit these changes to your GitHub repository.

9. Go to [mybinder.org](https://mybinder.org).

    a. In the first box, specify the URL of your new GitHub repository.

    b. For the Git branch, specify `master`.

    c. In the 3rd box, specify the name of your .ipynb file.

    d. Click on the Launch button. It may take a few minutes, but in the end, you should see a Jupyter notebook that looks like the one you created earlier. You should be able to execute code within the notebook.

    *Why did I ask you to go through all these steps rather than just send me your .ipynb file? Two reasons: 1) it enables me to ensure that your code executes properly without having to install anything locally, and 2) you will need to use this same process for your Reproducibility Project.*

10. After you have completed all of the above tasks, go to the `BIO365` Git repository you created for a previous assignment. Create a directory called `Assignment-29`. In that directory, create a script called `1.R`. In that script, print `TRUE` to indicate that you have completed these tasks successfully.

### Submitting the assignment

*Commit* and *push* your answers to GitHub. You can commit your code using the following three commands (replace `<message>` with an actual message):

```
git add --all *.R
git commit -m "<message>"
git push origin master
```

After committing your solutions, make sure they show up properly on GitHub. You don't need to submit anything via Learning Suite for this assignment.

### Checking your assignment

You can use [this site](http://bonsai.byu.edu:9000) to check your code after you have committed it to GitHub. It will tell you whether your code produces output that matches the expected output. Let me know if you encounter any problems as you use this site. **This site is only available from BYU campus.**