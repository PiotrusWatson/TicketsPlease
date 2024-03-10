class_name Date

var day : int
var month : int
	
func _init(_day, _month):
	day = _day
	month = _month
func make_month(month_number):
	var months = ["JAN", "FEB", "MAR", 
	"APR", "MAY", "JUN", "JUL", "AUG",
	"SEP", "OCT", "NOV", "DEC"]
	return months[month_number - 1]
func equals(otherDate: Date):
	return otherDate.day == day and otherDate.month == month
func _to_string():
	return str(day) + "-" + make_month(month) + "-24" 
