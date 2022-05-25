import csv 
import random
import json


file = open("Gotcha_v1.0.csv")
csvreader = csv.reader(file)

rows = []
for row in csvreader:
        rows.append(row)


emails = []

for row in rows:
	for item in row:
		emails.append(item)


emails.pop(0)

random.shuffle(emails)

targets = []
chasers = []

i = 0
for email in emails:

	if i == len(emails)-1:
		targets.append(emails[0])
		chasers.append(emails[i-1])


	elif i == 0:
		chasers.append(emails[len(emails)-1])
		targets.append(emails[i+1])


	else:
		targets.append(emails[i+1])
		chasers.append(emails[i-1])


	i+=1





data = []


c = 0
for email in emails:
	

	samp = email

	splitSamp = samp.split("_")
	fN = str(splitSamp[0])
	lN = str(splitSamp[1].split("2")[0])

	clss = samp.split("@")[0]
	clss = clss[-2:]

	if clss == "23":
		clss = "senior"
	elif clss=="24":
		clss = "junior"
	elif clss=="25":
		clss = "sophomore"
	elif clss=="26":
		clss = "freshman"
	else: 
		clss = "N/A"



	user = {

		
		"firstName": fN,
		"lastName": lN,
		"class" : clss,
		"target": targets[c],
		"chaser": chasers[c],
		"alive": True,
		"tags": 0,
		"lastWords": "",
		"ToTO": ""

	}

	data.append(user)

	c+=1






with open('gotcha_data.json', 'w') as f:
	json.dump(data, f, indent = 2)
    #print("The json file is created")







