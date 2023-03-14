# This is simple test repository for automated testing.

This repository is used for automated testing as described on the [CodeRefinery Testing Lecture](https://coderefinery.github.io/testing/continuous-integration/).

If you follow the instructions on that page, you can use this repository as a basis for the exercise and skip Steps 1 and 2. Simply [fork](https://github.com/AaltoRSE/RTestingExample/fork) it to your own github repositories, make a local clone
```
git clone https://github.com/<yourGitHubName>/RTestingExample
```
and then follow steps 3.-9. in the instructions.

The structure of the Repo is set up to follow that of an R package and you will need to update the DESCRIPTION file. Tests are tested with testthat as described in the [testing chapter](https://r-pkgs.org/testing-basics.html) for R packages.

The "Solution" branch contains a version with all tests corrected and set up along with a template for the github action necessary.

The workflow file that can be used to test the packages is under `.github/workflows/r.yml` and is derived from the R actions that can be found [here](https://github.com/r-lib/actions)
