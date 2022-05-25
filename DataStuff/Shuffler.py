import random
import time

users = []

for i in range (0, 20):
	users.append("user" + str(i))

print(users)

random.shuffle(users)

print(users)

class User:
	def __init__(self, name, ID):
		target = 0 
		chaser = 0

		if ID == 0:
			target = ID+1
			chaser = len(users)-1
		elif ID == len(users):
			target = 0
			chaser = ID-1
		else:
			target = ID+1
			chaser = ID-1


		self.target = target
		self.chaser = chaser
		self.name = name
		self.ID = ID
		self.alive = True

		self.readOut = "Person " + self.name + " is hunting " + str(self.target) + " and is being hunted by " + str(self.chaser)
db = []

for i in range(len(users)):
	db.append(User(users[i], i))

out = 0


while True:
	i = random.randint(0, len(db)-1)


	if db[i].alive == True:
		time.sleep(1)
		print(db[i].name + " is tagging out...")
		print(db[i].name + "'s ID is " + str(db[i].ID))

		
		print(db[i].name + " was chasing " + db[db[i].target].name + " but got tagged by " + db[db[i].chaser].name)
		

		db[db[i].chaser].target = db[i].target
		print(db[db[i].chaser].name + " is now chasing " + db[db[i].target].name)
		
	
		db[db[i].target].chaser = db[i].chaser
		print(db[db[i].target].name + " is now being chased by " + db[db[i].chaser].name)

		print("\n\n\n\n")
		db[i].alive = False
		out+=1

		



		
	if len(db)-out<4:
		print("\n\n\n\n\n\n\n\n FINAL THREE")
		break

for d in db:
	if d.alive:
		print(d.name + " is hunting " + db[d.target].name + " and being hunted by " + db[d.chaser].name)











