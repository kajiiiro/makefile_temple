makefile_temple
===============

まけファイルのサンプル

以下をコピー

#
# 
#
TARGET  	= kajiro
SRC			:= ../src/${TARGET}.cpp
OBJ			:= ${basename ${SRC}}
OBJ			:= ${notdir ${OBJ}}
OBJ			:= ${OBJ:%=%.o}

INCLUDE		:= -I

INSTALL_PATH	= 

CXXFLAGS		= -std=c++0x -Wall
CXXFLAGS_LIB	:= -l

CP				= cp

make:${TARGET}

${TARGET}:${OBJ}
	$(CXX) -shared -o $(TARGET) $(OBJ) $(LIBPATH_SO) $(CXXFLAGS_LIB)

${OBJ}:${SRC}
	$(CXX) -c $(CXXFLAGS) $(INCLUDE) $(SRC)

install:
	$(CP) $(TARGET) $(INSTALL_PATH)$(TARGET)

clean:
	$(RM) *.o *.so $(TARGET)
