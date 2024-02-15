CXX = gcc
LDFLAGS = --coverage
OPTION = -Wall -fexceptions -fprofile-arcs -ftest-coverage
INCS = -I.  -I"." 
OBJS = $(SRC:.c=.o)

SRC = ratp.c  main.c cmocka.o


all: $(OBJS)
	$(CXX) $(LDFLAGS) $(INCS) -o testAll  $(OBJS)

	
exec : all
	testAll.exe
%.o: %.c
	$(CXX) $(OPTION)  -c  $< -o $@ $(INCS)
	
clean:
	rm $(OBJS) 


mrproper: clean
	rm testAll
	rm result.xml