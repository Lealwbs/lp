main: compile tests

compile:
	javac IntList.java -d classes
	javac Int.java -d classes

tests:
	java -ea -cp classes IntList
	java -ea -cp classes Int

intlist: 
	javac IntList.java -d classes
	java -ea -cp classes IntList

int: 
	javac Int.java -d classes
	java -ea -cp classes Int

clean:
	if exist classes rd /s /q classes