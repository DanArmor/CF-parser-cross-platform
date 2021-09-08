Codeforces Parser v2.0
=================

Summary
-------

[Codeforces](http://codeforces.com/) is a website for _competitive programming_. It holds contests, so-called **Codeforces Rounds**, about every week.

This is a python program that parses the sample tests from the contest problem pages. For each problem, it generates the sample input/output files and a shell script to run sample tests.

Originally it was created by [johnathan79717](https://github.com/johnathan79717). [There is a page of the project](https://github.com/johnathan79717/codeforces-parser). But there is no support for Windows, so i decided to modifie the parser a little bit and add some new features in a future. 

Also it has "cfrate" script, which provides rating-list of solved problems for every user whose name you entered.

### Installation

 * If you want to run script from any directory - you can run SETUP script from SETUP dir - it will add script path to your $PATH variable. (And .PY to PATHEXT in Windows to run .py scripts currently from shell. Be aware - SETUP script in Windows may rewrite your USER path variable with SYSTEM path variable and add script path to it. SYSTEM path variable is out of dangeour) 

### Example:
`./cfparse.py contest_number (e.g. ./parse.py 513)`

Where `512` is the contest number, not the round number! Check the URL of the contest on your browser, that is the number you are supposed to use.

### Effect:

Everything is the same for Windows (but there is test.bat, not .sh).

##### What will happen, for example, if `./cfparse.py 512` is executed?

1. Directories `512/A`, `512/B`, `512/C`, `512/D` and so on are created depending on the contest number of problems.
2. For each problem, `main.cc` is copied and renamed to the problem letter to the corresponding directory. **You can put the path of your usual template in `parse.py:20`**.
3. Problem page is downloaded from Codeforces website, and parsed. Sample input/output files are generated, e.g. `input1`, `output1`, `input2`, `output2` and so on. You can create your own test cases after that, just keep the same naming format as others test cases.
4. A script `test.sh` is generated. You can use it to compile and run the sample tests after you finish coding. Just run `./test.sh` in the problem directory.

##### What will happen if `./test.sh` is executed?

1. Compilation: `g++ -g -std=c++0x -Wall $DBG main.cc`. **You can change the compile options in `parse.py:21`**. Variable $DBG is set to -DDEBUG if you start "./test.sh -d", otherwise it is empty. This allows for compilation with and without debug macros. **(In Windows you need to run debug.bat)**

2. Run each sample tests on your program (`a.out`), and check the output by `diff`. If it's correct, print **Accepted**, or else print the sample test that went wrong.
3. Please note that for problems with **multiple correct answers** it might say that your output is incorrect.

##### How to use cfrate?

Enter in the shell `cfrate CF_HANDLE1 CF_HANDLE2 ...` and you will get a list of total number of solved problems for every rating that the users have solved.

### Collaborators and Versions:

##### List of CodeForces Collaborators:
+ [DanArmor](https://codeforces.com/profile/DanArmor)

If you have any suggestions and/or bugs drop a message!

### Versions Changes:

+ **2.0:**
Added support for Windows, setup scripts to configure parser. Now there is a posobility to run cfparser from any directory as you want.
Added "cfrate" script, that provides rating-list of solved problems for every user whose name you entered. 


##### Todo, Bugs & Troubleshootings:

+ In OS X it is necessary to install the `gnu-time` to measure time.
+ Setup script for Unix/Mac.
+ User $PATH variable in Windows ?
