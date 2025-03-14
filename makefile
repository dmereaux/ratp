CXX = gcc
LDFLAGS = --coverage
OPTION = -Wall -fexceptions -fprofile-arcs -ftest-coverage
INCS = -I.  -I"." 
OBJS = $(SRC:.c=.o)

SRC = ratp.c  main.c cmocka.o


all: $(OBJS)
	$(CXX) $(LDFLAGS) $(INCS) -o testAll  $(OBJS)

	
exec : all
	./testAll

%.o: %.c
	$(CXX) $(OPTION)  -c  $< -o $@ $(INCS)
	
clean:
	rm -f $(OBJS) testAll

mrproper: clean
	rm -f $(EXEC) result.xml ratp.gcda ratp.gcno cmocka.gcda cmocka.gcno main.gcda main.gcno