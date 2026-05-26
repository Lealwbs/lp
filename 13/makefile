main: tests

tests: intlist int

compile_il:
	javac src/IntList.java -d obj
	
compile_i:
	javac src/Int.java -d obj

intlist: compile_il
	java -ea -cp obj IntList

int: compile_i
	java -ea -cp obj Int

clean:
	if exist obj rd /s /q obj