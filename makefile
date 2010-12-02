UNAME := $(shell uname)

CC=g++

STK_SOURCES = stk/Stk.o stk/PitShift.o stk/DelayL.o stk/Delay.o stk/LentPitShift.o stk/Echo.o
SOURCES = butcher.o RtAudio.o blade.o board.o kitchen.o interface.o graphics.o sauce.o $(STK_SOURCES)
OBJECTS = $(SOURCES:.cpp=.o)
EXECUTABLE = butcher

CFLAGS= -D__MACOSX_CORE__ -c -g
LIBS=-framework CoreAudio -framework CoreMIDI -framework CoreFoundation \
	 -framework IOKit -framework Carbon \
	 -framework OpenGL -framework GLUT -framework Foundation -framework AppKit \
	 -lsndfile -lm

all:	$(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $(EXECUTABLE) $(OBJECTS) $(LIBS)

%.o: %.cpp
	$(CC) $< $(CFLAGS) -o $@

clean:
	rm -f $(EXECUTABLE) $(OBJECTS)

