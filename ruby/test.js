lines = "column1,column2,column3\nvalue1,value2,value3\n".split("\n");
console.log(lines);

var index = 0;

while (index < lines.length) {
	var values = lines[index].split(',');
	console.log(values);
	index++;
}
