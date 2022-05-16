# C compiler
CC = g++
CC_FLAGS = -O3 -fopenmp  

CC_FLAGS+=$(CXXFLAGS) -I include 
bfs: bfs.o
	$(CC) $(CC_FLAGS) bfs.o -o bfs

%.o: %.[ch]
	$(CC) $(CC_FLAGS) $< -c

bfs.o: bfs.cpp 
	$(CC) $(CC_FLAGS) bfs.cpp -c

all: bfs

clean:
	rm -f *.o *~ bfs result.txt 
