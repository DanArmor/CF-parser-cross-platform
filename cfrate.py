import json
import requests
import sys
import time

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

is_plot = False
manual_input = True
n = len(sys.argv)
if n > 1:
    handles = []
    for arg in sys.argv[1:]:
        if(arg == "-g"):
            is_plot = True
        else:
            manual_input = False
            handles.append(arg)

try:
    if(n > 1 and len(handles) > 1):
        is_plot = False
except:
    pass

try:
    import matplotlib.pyplot as plt
except:
    is_plot = False

#YOU CAN CHANGE THAT VALUE
Border_of_low_rating = 1100 #All problems under that value are defined as low rating problems
##########################

def getInfoByResponse(response):
    try:
        response = requests.get(response) 
    except:
        sys.stderr.write("---------------------------------\n")
        sys.stderr.write("ERROR:\n")
        sys.stderr.write("Something went wrong when we tried to get data from codeforces! No responce!\n")
        sys.stderr.write("---------------------------------\n")
        return
    data = json.loads(response.text)
    return data

def checkData(data):
    if data["status"] != "OK":
        try:
            sys.stderr.write("---------------------------------\n")
            sys.stderr.write("ERROR:\n")
            sys.stderr.write("Something went wrong when we tried to get data from codeforces! The end data is wrong!\n")
            sys.stderr.write("Codeforces comment about error is:", data["comment"],"\n")
            sys.stderr.write("---------------------------------\n")
            return
        except:
            sys.stderr.write("Something went wrong with getting codeforces comment\n")
            sys.stderr.write("---------------------------------\n")
            return

def fancyOutput(message, first, second):
    numberForPerc = first / second
    percentage = "{:.1%}".format(numberForPerc)
    print(bcolors.BOLD + message + bcolors.ENDC + str(first) + " = " + bcolors.OKBLUE + str(first) + bcolors.ENDC + "/" + bcolors.OKGREEN + str(second) + bcolors.WARNING + " (" + str(percentage) + ")" + bcolors.ENDC)

def fancyOutputAdv(message, first, second, third):
    numberForPerc = second / third
    percentage = "{:.1%}".format(numberForPerc)
    print(bcolors.BOLD + message + bcolors.ENDC + str(first) + " = " + bcolors.OKBLUE + str(second) + bcolors.ENDC + "/" + bcolors.OKGREEN + str(third) + bcolors.WARNING + " (" + str(percentage) + ")" + bcolors.ENDC)

def Process_handle(handle_num=0):
    if(manual_input):
        print("Write your handle: ", end="")
        handle = input()
    else:
        handle = handles[handle_num]

    data = getInfoByResponse("https://codeforces.com/api/user.status?handle=" + handle)

    names = {}
    high_rates = {}
    low_rates = {}

    tags = {}
    tagsAll = {}
    ratingsAll = {}

    total = 0;
    total_low = 0
    total_high = 0

    checkData(data)

    for t in data["result"]:

        if(t["verdict"] != "OK"):
            continue
        
        try:
            rate = t["problem"]["rating"]
        except KeyError:
            continue
        
        key = str(t["problem"]["contestId"]) + t["problem"]["index"]

        if key in names:
            continue
        else:
            names[key] = 1

        for tag in t["problem"]["tags"]:
            if tag in tags:
                tags[tag] += 1
            else:
                tags[tag] = 1

        high_rate = True
        if(rate < Border_of_low_rating):
            high_rate = False

        if(high_rate):
            total_high += 1
            if rate in high_rates:
                high_rates[rate] += 1
            else:
                high_rates[rate] = 1
        else:
            total_low += 1
            if rate in low_rates:
                low_rates[rate] += 1
            else:
                low_rates[rate] = 1

        total += 1

    data = getInfoByResponse("https://codeforces.com/api/problemset.problems")

    checkData(data)
    
    for t in data["result"]["problems"]:
        try:
            rate = t["rating"]
            for tag in t["tags"]:
                if tag in tagsAll:
                    tagsAll[tag] += 1
                else:
                    tagsAll[tag] = 1
            if t["rating"] in ratingsAll:
                ratingsAll[t["rating"]] += 1
            else:
                ratingsAll[t["rating"]] = 1
        except:
            pass
    
    totalLowFromAll = 0
    totalHighFromAll = 0
    for k, v in sorted(ratingsAll.items(), reverse=True):
        if(int(k) < Border_of_low_rating):
            totalLowFromAll += v
        else:
            totalHighFromAll += v

    #Outputing data
    print("Information about", handle)
    numberForTotal = numberForPerc = total / (totalLowFromAll + totalHighFromAll)
    percentageTotal = "{:.1%}".format(numberForTotal)
    
    fancyOutput("Total: ", total, totalLowFromAll + totalHighFromAll)
    print("--------------------")

    numberForTotal = numberForPerc = total_high / totalHighFromAll
    percentageTotal = "{:.1%}".format(numberForTotal)

    fancyOutput("Total high ratings: ", total_high, totalHighFromAll)

    for k, v in sorted(high_rates.items(), reverse=True):
        fancyOutputAdv("Rating: ", k, v, ratingsAll[k])
    print("--------------------")

    for k, v in sorted(low_rates.items(), reverse=True):
        fancyOutputAdv("Rating: ", k, v, ratingsAll[k])
    
    numberForTotal = numberForPerc = total_low / totalLowFromAll
    percentageTotal = "{:.1%}".format(numberForTotal)
    fancyOutput("Total low ratings: ", total_low, totalLowFromAll)

    print("--------------------")
    print()

    print("By tags:")
    for k, v in sorted(tagsAll.items(), reverse=True):
        tagSolved = 0
        try:
            tagSolved = tags[k]
        except:
            tagSolved = 0
        fancyOutputAdv("--: ", k, tagSolved, tagsAll[k])


    if is_plot:
        data_for_plot = sorted(list(high_rates.items()) + list(low_rates.items()), reverse=True)
        x = []
        y = []
        for pair in data_for_plot:
            x.append(pair[0])
            y.append(pair[1])
        plt.plot(x, y)
        plt.xlabel('x - ratings of problems')
        plt.ylabel('y - number of solved problems')
        plt.title('Codeforces graph for ' + handle)
        plt.show()


handle_num = 0
if(__name__ == "__main__"):
    print("[[rating < ", Border_of_low_rating, " is low rate]]", sep="")
    print("[[Problems without rating are not counted]]")
    print()
    if(manual_input):
        Process_handle()
    else:
        for i in range(0, len(handles)):
            time.sleep(0.5)
            Process_handle(i)
