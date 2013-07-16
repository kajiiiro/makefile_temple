#
# TARGETにプログラム名として入れたいものを指定する
#
TARGET			= sample_program
SRC			:= ../src/${TARGET}.cpp
OBJ			:= ${basename ${SRC}}
OBJ			:= ${notdir ${OBJ}}
OBJ			:= ${OBJ:%=%.o}

#
# -Iで指定するものとか
#
INCLUDE			:= 

#
# デフォルトでパスが通る場所{例えば/usr/local/lib/とか}を指定する
# 最後にスラッシュを入れること
#
INSTALL_PATH		= /usr/local/lib/

#
# コンパイルオプションがあればここ
#
CXXFLAGS		= -std=c++0x -Wall

#
# -lで指定するものとか
#
CXXFLAGS_LIB		:= 

#
# 動的リンクを作成したければコメントを展開する
#
#SHARED_OPT		= -shared
SHARED_OPT		= 

CP			= cp

make:${TARGET}

${TARGET}:${OBJ}
	${CXX} ${SHARED_OPT} -o ${TARGET} ${OBJ} ${CXXFLAGS_LIB}

${OBJ}:${SRC}
	${CXX} -c ${CXXFLAGS} ${INCLUDE} ${SRC}

#
# make install時の動作
# とりあえずコピーするだけ
#
install:
	${CP} ${TARGET} ${INSTALL_PATH}${TARGET}

#
# make clean時の動作
# カレントディレクトリのものを削除する
#
clean:
	${RM} *.o *.so ${TARGET}

#
# make uninstall時の動作
# installでコピーしたものを削除する
#
uninstall:
	${RM} ${INSTALL_PATH}${TARGET}
