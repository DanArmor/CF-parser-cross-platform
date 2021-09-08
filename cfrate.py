import json
import requests
import sys
import time

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

def Process_handle(handle_num=0):
    if(manual_input):
        print("Write your handle: ", end="")
        handle = input()
    else:
        handle = handles[handle_num]

    try:
        response = requests.get("https://codeforces.com/api/user.status?handle=" + handle) 
    except:
        sys.stderr.write("---------------------------------\n")
        sys.stderr.write("ERROR:\n")
        sys.stderr.write("Something went wrong when we tried to get data from codeforces! No responce!\n")
        sys.stderr.write("---------------------------------\n")
        return

    data = json.loads(response.text)

    names = {}
    high_rates = {}
    low_rates = {}

    total = 0;
    total_low = 0
    total_high = 0

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

    #Outputing data
    print("Information about", handle)

    print("Total: ", total)
    print("--------------------")

    print("Total high ratings: ", total_high)
    for k, v in sorted(high_rates.items(), reverse=True):
        print("Rating: ", k, " = ", v);
    print("--------------------")

    for k, v in sorted(low_rates.items(), reverse=True):
        print("Rating: ", k, " = ", v);
    print("Total low ratings: ", total_low)
    print("--------------------")
    print()

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