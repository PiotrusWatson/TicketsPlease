extends Node

var Names = ["Fakeplace", "Notareal", "Bimbleby", 
	"Shepherds Crease", "Sprunton", "Kabmeelington", 
	"Thankful and be Rested",  "Bromp"]

func MakeDate():
	var dayCalc = (randi() % 29) + 1
	var monthCalc = (randi() % 11) + 1
	
	var _displayOutput = str(dayCalc) + "-" + str(monthCalc) + "-24" 
	pass
