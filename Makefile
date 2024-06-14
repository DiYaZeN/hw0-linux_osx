CC = g++
CFLAGS = -g -DGL_GLEXT_PROTOTYPES -DGL_SILENCE_DEPRECATION -I./glm-0.9.7.1 -I./include/ -I/usr/local/include -I/opt/homebrew/Cellar/glew/2.2.0_1/include

ifeq ($(shell uname), Darwin)
LDFLAGS = -L/opt/homebrew/Cellar/freeimage/3.18.0/lib -L/opt/homebrew/Cellar/glew/2.2.0_1/lib -lfreeimage -lGLEW -framework GLUT -framework OpenGL
else
CFLAGS += -I/usr/X11R6/include -I/sw/include -I/usr/sww/include -I/usr/sww/pkg/Mesa/include
LDFLAGS = -L./lib/nix -L/usr/X11R6/lib -L/sw/lib -L/usr/sww/lib -L/usr/sww/bin -L/usr/sww/pkg/Mesa/lib -lGLEW -lglut -lGLU -lGL -lX11 -lfreeimage
endif

RM = /bin/rm -f

all: mytest3

mytest3: mytest3.o shaders.o
	$(CC) $(CFLAGS) -o mytest3 mytest3.o shaders.o $(LDFLAGS)

mytest3.o: mytest3.cpp shaders.h geometry3.h
	$(CC) $(CFLAGS) -c mytest3.cpp

shaders.o: shaders.cpp
	$(CC) $(CFLAGS) -c shaders.cpp

clean:
	$(RM) *.o mytest3
