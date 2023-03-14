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

The contents differ slightly from the contents in the lesson by using multiple different R versions for testing. 

Here is a copy of the contents:

```
# Workflow derived from https://github.com/r-lib/actions/tree/v2/examples
# Need help debugging build failures? Start at https://github.com/r-lib/actions#where-to-find-help
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

name: test-coverage

jobs:
  test-coverage:
    runs-on: ubuntu-latest
    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}
    strategy:
      matrix:
        R: [ '3.5.3', '3.6.1', '4.1.3' ]
    name: R ${{ matrix.R }} sample
    steps:
      - uses: actions/checkout@v3

      - name: Setup R
        uses: r-lib/actions/setup-r@v2
        with:
          r-version: ${{ matrix.R }}
          use-public-rspm: true
      - uses: r-lib/actions/setup-r-dependencies@v2
        with:
          extra-packages: |
            any::covr
            any::rcmdcheck
          needs: |
            coverage
            check
          working-directory: 'rtestingexample'
      - name: Test coverage
        run: |
          covr::codecov(
            quiet = FALSE,
            clean = FALSE,
            path = "rtestingexample",
            install_path = file.path(Sys.getenv("RUNNER_TEMP"), "package")
          )
        shell: Rscript {0}

      - name: Show testthat output
        if: always()
        run: |
          ## --------------------------------------------------------------------
          find ${{ runner.temp }}/package -name 'testthat.Rout*' -exec cat '{}' \; || true
        shell: bash

      - name: Upload test results
        if: failure()
        uses: actions/upload-artifact@v3
        with:
          name: coverage-test-failures
          path: ${{ runner.temp }}/package          
```         
