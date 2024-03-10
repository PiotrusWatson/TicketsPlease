class_name Date

var day : int
var month : int
	
func _init(_day, _month):
	day = _day
	month = _month

func equals(otherDate: Date):
	return otherDate.day == day and otherDate.month == month
func _to_string():
	return str(day) + "-" + make_month(month) + "-24" 
	
static func generate_date():
	var dayCalc = (randi() % 29) + 1
	var monthCalc = (randi() % 11) + 1
	return Date.new(dayCalc, monthCalc)
	
static func make_month(month_number):
	var months = ["JAN", "FEB", "MAR", 
	"APR", "MAY", "JUN", "JUL", "AUG",
	"SEP", "OCT", "NOV", "DEC"]
	return months[month_number - 1]

static func generate_bad_date(correct_date: Date):
	var date = correct_date
	while date.equals(correct_date):
		date = generate_date()
	return date
