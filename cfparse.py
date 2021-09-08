#!/usr/bin/python

# Python 2->3 libraries that were renamed.
try:
    from urllib2 import urlopen
except:
    from urllib.request import urlopen
try:
    from HTMLParser import HTMLParser
except:
    from html.parser import HTMLParser

# Other libraries.
from sys import argv
from subprocess import call
from functools import partial, wraps

import re
import argparse
import platform

import os
import shutil
try:
    import stat
except:
    pass

###########################
# User modifiable constants
###########################

#TODO G++ .EXE
#TODO 
language_params = {}
if(platform.system() == "Windows"):
    language_params = {
            'c++14' : {
                'TEMPLATE'    : 'main.cc',
                'DEBUG_FLAGS' : '-DDEBUG',
                'COMPILE_CMD' : 'g++.exe -g -std=c++14 -Wall $DBG',
                'RUN_CMD'     : './a.out'
                },
            'go'    : {
                'TEMPLATE'    : 'main.go',
                'COMPILE_CMD' : 'go build $DBG -o a.out',
                'DEBUG_FLAGS' : '''"-ldflags '-X=main.DEBUG=Y'"''',
                'RUN_CMD'     : './a.out'
                },
            'kotlin'    : {
                'TEMPLATE'    : 'main.kt',
                'COMPILE_CMD' : 'kotlinc -include-runtime -d out.jar',
                'DEBUG_FLAGS' : "-d",
                'RUN_CMD'     : 'java -jar out.jar $DBG'
                },
            }
else:
    language_params = {
            'c++14' : {
                'TEMPLATE'    : 'main.cc',
                'DEBUG_FLAGS' : '-DDEBUG',
                'COMPILE_CMD' : 'g++ -g -std=c++14 -Wall $DBG',
                'RUN_CMD'     : './a.out'
                },
            'go'    : {
                'TEMPLATE'    : 'main.go',
                'COMPILE_CMD' : 'go build $DBG -o a.out',
                'DEBUG_FLAGS' : '''"-ldflags '-X=main.DEBUG=Y'"''',
                'RUN_CMD'     : './a.out'
                },
            'kotlin'    : {
                'TEMPLATE'    : 'main.kt',
                'COMPILE_CMD' : 'kotlinc -include-runtime -d out.jar',
                'DEBUG_FLAGS' : "-d",
                'RUN_CMD'     : 'java -jar out.jar $DBG'
                },
            }

CURRENTDIR = os.getcwd()
SCRIPTDIR = os.path.dirname(os.path.realpath(__file__))

SAMPLE_INPUT='input'
SAMPLE_OUTPUT='output'
MY_OUTPUT='my_output'

# Do not modify these!
VERSION='CodeForces Parser v2.0 https://github.com/DanArmor/CF-parser-cross-platform'
RED_F='\033[31m'
GREEN_F='\033[32m'
BOLD='\033[1m'
NORM='\033[0m'
if (platform.system() == "Darwin"):
    TIME_CMD='`which gtime` -o time.out -f "(%es)"'
else:
    TIME_CMD='`which time` -o time.out -f "(%es)"'
TIME_AP='`cat time.out`'

# Problems parser.
class CodeforcesProblemParser(HTMLParser):

    def __init__(self, folder):
        HTMLParser.__init__(self)
        self.folder = folder
        self.num_tests = 0
        self.testcase = None
        self.start_copy = False

    def handle_starttag(self, tag, attrs):
        if tag == 'div':
            if attrs == [('class', 'input')]:
                self.num_tests += 1
                self.testcase = open(
                    '%s/%s%d' % (self.folder, SAMPLE_INPUT, self.num_tests), 'wb')
            elif attrs == [('class', 'output')]:
                self.testcase = open(
                    '%s/%s%d' % (self.folder, SAMPLE_OUTPUT, self.num_tests), 'wb')
        elif tag == 'pre':
            if self.testcase != None:
                self.start_copy = True

    def handle_endtag(self, tag):
        if tag == 'br':
            if self.start_copy:
                self.testcase.write('\n'.encode('utf-8'))
                self.end_line = True
        if tag == 'pre':
            if self.start_copy:
                if not self.end_line:
                    self.testcase.write('\n'.encode('utf-8'))
                self.testcase.close()
                self.testcase = None
                self.start_copy = False

    def handle_entityref(self, name):
        if self.start_copy:
            self.testcase.write(self.unescape(('&%s;' % name)).encode('utf-8'))

    def handle_data(self, data):
        if self.start_copy:
            self.testcase.write(data.strip('\n').encode('utf-8'))
            self.end_line = False

# Contest parser.
class CodeforcesContestParser(HTMLParser):

    def __init__(self, contest):
        HTMLParser.__init__(self)
        self.contest = contest
        self.start_contest = False
        self.start_problem = False
        self.name = ''
        self.problem_name = ''
        self.problems = []
        self.problem_names = []

    def handle_starttag(self, tag, attrs):
        if self.name == '' and attrs == [('style', 'color: black'), ('href', '/contest/%s' % (self.contest))]:
                self.start_contest = True
        elif tag == 'option':
            if len(attrs) == 1:
                regexp = re.compile(r"'[A-Z][0-9]?'") # The attrs will be something like: ('value', 'X'), or ('value', 'X1')
                string = str(attrs[0])
                search = regexp.search(string)
                if search is not None:
                    self.problems.append(search.group(0).split("'")[-2])
                    self.start_problem = True

    def handle_endtag(self, tag):
        if tag == 'a' and self.start_contest:
            self.start_contest = False
        elif self.start_problem:
            self.problem_names.append(self.problem_name)
            self.problem_name = ''
            self.start_problem = False

    def handle_data(self, data):
        if self.start_contest:
            self.name = data
        elif self.start_problem:
            self.problem_name += data

# Parses each problem page.
def parse_problem(folder, contest, problem):
    url = 'http://codeforces.com/contest/%s/problem/%s' % (contest, problem)
    html = urlopen(url).read()
    parser = CodeforcesProblemParser(folder)
    parser.feed(html.decode('utf-8'))
    # .encode('utf-8') Should fix special chars problems?
    return parser.num_tests

# Parses the contest page.
def parse_contest(contest):
    url = 'http://codeforces.com/contest/%s' % (contest)
    html = urlopen(url).read()
    parser = CodeforcesContestParser(contest)
    parser.feed(html.decode('utf-8'))
    return parser

# Generates the test script.
def generate_test_script(folder, language, num_tests, problem):
    param = language_params[language]
    if platform.system() == "Windows":
        with open(os.path.join(folder, 'innertest.ps1'), "w") as test:
            test.write(
                ('$DBG=""\n'
                'foreach ($arg in $args) {{\n'
                '    switch ($arg) {{\n'
                '        -d {{echo "-d was selected; compiling in DEBUG mode!"\n'
                '             $DBG="' + param["DEBUG_FLAGS"] + '"\n'
                '            }}\n'
                '        Default {{echo "Invalid option: $arg"}}\n'
                '    }}\n'
                '}}\n'
                '\n'+
                param["COMPILE_CMD"] + ' {0}.{1}\n'
                'if(!$?)\n'
                '{{\n'
                '    exit\n'
                '}}\n'
                '\n'
                '$INPUT_NAME='+ '"' + SAMPLE_INPUT + '"' + '\n'
                '$OUTPUT_NAME='+ '"' + SAMPLE_OUTPUT + '"' + '\n'
                '$MY_NAME='+ '"' + MY_OUTPUT + '"' + '\n'

                'del $MY_NAME*\n').format(problem, param["TEMPLATE"].split('.')[1]))
            test.write(
                'Get-ChildItem "." -Filter $INPUT_NAME* | ForEach-Object {{\n'
                '    $name = $_.Name\n'
                '    $test_case = $name.Substring($INPUT_NAME.Length)\n'
                '    $time = Measure-Command {{$proc = Start-Process ./a.exe -RedirectStandardInput .\$INPUT_NAME$test_case -RedirectStandardOutput .\$MY_NAME$test_case -NoNewWindow -PassThru -Wait}}\n'
                '    if($proc.get_ExitCode())\n'
                '    {{\n'
                '        Write-Host {1}{4}"Sample test ${{test_case}}: Runtime Error:"{2} $time.Milliseconds "ms" -NoNewline\n'
                '        Write-Host\n'
                '        Write-Host "========================================"\n'
                '        Write-Host "Sample Input $test_case"\n'
                '        cat $INPUT_NAME$test_case\n'
                '    }}\n' 
                '    else\n'
                '    {{\n'
                '        if(! ({7}\win\\bin\diff.exe --brief --ignore-space-change {8}\$OUTPUT_NAME$test_case {8}\$MY_NAME$test_case))\n'
                '        {{\n'
                '            Write-Host {1}{3}"Sample test ${{test_case}}: Accepted"{2} $time.Milliseconds "ms" -NoNewline\n'
                '            Write-Host\n'
                '        }}\n'
                '        else\n'
                '        {{\n'
                '            Write-Host "{1}{4}Sample test ${{test_case}}: Wrong Answer"{2} $time.Milliseconds "ms" -NoNewline\n'
                '            Write-Host\n'
                '            Write-Host "========================================"\n'
                '            Write-Host "Sample Input $test_case"\n'
                '            cat $INPUT_NAME$test_case\n'
                '            Write-Host "========================================"\n'
                '            Write-Host "Sample Output $test_case"\n'
                '            cat $OUTPUT_NAME$test_case\n'
                '            Write-Host "========================================"\n'
                '            Write-Host "My Output $test_case"\n'
                '            cat $MY_NAME$test_case\n'
                '            Write-Host "========================================"\n'
                '        }}\n'
                '    }}\n'
                '}}\n'
                'echo Done\n'
                .format(num_tests, BOLD, NORM, GREEN_F, RED_F, TIME_CMD, TIME_AP, SCRIPTDIR, folder, run_cmd=param["RUN_CMD"]))
        with open(os.path.join(folder, 'test.bat'), "w") as test:
            test.write('powershell -ExecutionPolicy ByPass -File .\innertest.ps1')
        with open(os.path.join(folder, 'debug.bat'), "w") as test:
            test.write('powershell -ExecutionPolicy ByPass -File .\innertest.ps1 -d')
    else:
        with open(os.path.join(folder, 'test.sh'), 'w') as test:
            test.write(
                ('#!/bin/bash\n'
                'DBG=""\n'
                'while getopts ":d" opt; do\n'
                '  case $opt in\n'
                '    d)\n'
                '      echo "-d was selected; compiling in DEBUG mode!" >&2\n'
                '      DBG=' + param["DEBUG_FLAGS"] +'\n'
                '      ;;\n'
                '    \?)\n'
                '      echo "Invalid option: -$OPTARG" >&2\n'
                '      ;;\n'
                '  esac\n'
                'done\n'
                '\n'
                'if ! ' + param["COMPILE_CMD"] +' {0}.{1}; then\n'
                '    exit\n'
                'fi\n'
                'INPUT_NAME='+SAMPLE_INPUT+'\n'
                'OUTPUT_NAME='+SAMPLE_OUTPUT+'\n'
                'MY_NAME='+MY_OUTPUT+'\n'
                'rm -R $MY_NAME* &>/dev/null\n').format(problem, param["TEMPLATE"].split('.')[1]))
            test.write(
                'for test_file in $INPUT_NAME*\n'
                'do\n'
                '    i=$((${{#INPUT_NAME}}))\n'
                '    test_case=${{test_file:$i}}\n'
                '    if ! {5} {run_cmd} < $INPUT_NAME$test_case > $MY_NAME$test_case; then\n'
                '        echo {1}{4}Sample test \#$test_case: Runtime Error{2} {6}\n'
                '        echo ========================================\n'
                '        echo Sample Input \#$test_case\n'
                '        cat $INPUT_NAME$test_case\n'
                '    else\n'
                '        if diff --brief --ignore-space-change $MY_NAME$test_case $OUTPUT_NAME$test_case; then\n'
                '            echo {1}{3}Sample test \#$test_case: Accepted{2} {6}\n'
                '        else\n'
                '            echo {1}{4}Sample test \#$test_case: Wrong Answer{2} {6}\n'
                '            echo ========================================\n'
                '            echo Sample Input \#$test_case\n'
                '            cat $INPUT_NAME$test_case\n'
                '            echo ========================================\n'
                '            echo Sample Output \#$test_case\n'
                '            cat $OUTPUT_NAME$test_case\n'
                '            echo ========================================\n'
                '            echo My Output \#$test_case\n'
                '            cat $MY_NAME$test_case\n'
                '            echo ========================================\n'
                '        fi\n'
                '    fi\n'
                'done\n'
                .format(num_tests, BOLD, NORM, GREEN_F, RED_F, TIME_CMD, TIME_AP, run_cmd=param["RUN_CMD"]))
            st = os.stat(os.path.join(folder, 'test.sh'))
            os.chmod(os.path.join(folder, 'test.sh'), st.st_mode | stat.S_IEXEC)


# Main function.
def main():
    print (VERSION)
    parser = argparse.ArgumentParser()
    parser.add_argument('--language', '-l', default="c++14", help="The programming language you want to use "
            "(c++14, go)")
    parser.add_argument('contest', help="")
    args = parser.parse_args()

    contest = args.contest
    language = args.language

    # Find contest and problems.
    print ('Parsing contest %s for language %s, please wait...' % (contest, language))
    content = parse_contest(contest)
    print (BOLD+GREEN_F+'*** Round name: '+content.name+' ***'+NORM)
    print ('Found %d problems!' % (len(content.problems)))

    #TODO extension for output file
    # Find problems and test cases.
    TEMPLATE = language_params[language]["TEMPLATE"]
    for index, problem in enumerate(content.problems):
        print ('Downloading Problem %s: %s...' % (problem, content.problem_names[index]))
        folder = os.path.join(os.getcwd(), contest + language, problem)
        os.makedirs(folder)
        with open(os.path.join(SCRIPTDIR, TEMPLATE), "r") as input:
            with open(os.path.join(folder, problem + '.' + TEMPLATE.split('.')[1]), "w") as output:
                shutil.copyfileobj(input, output)
        num_tests = parse_problem(folder, contest, problem)
        print('%d sample test(s) found.' % num_tests)
        generate_test_script(folder, language, num_tests, problem)
        print ('========================================')

    if platform.system() == "Windows":
        print ('Use ./test.bat to run sample tests in each directory.')
    else:
        print ('Use ./test.sh to run sample tests in each directory.');


if __name__ == '__main__':
    main()
# .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY
