.PHONY : eqsolv3 all gen clean print
all:
	./gen/bin/gen ./symbol ./core/src/symbol.gen.c ./core/include/symbol.gen.h ./core/src/data.gen.c ./core/include/data.gen.h 0
	cd ./core && make
debug:
	sed -i "" -e 's:.*#define LEAKDETECT.*:#define LEAKDETECT 0:' 'mylib/include/utilities.h'
	./gen/bin/gen ./symbol ./core/src/symbol.gen.c ./core/include/symbol.gen.h ./core/src/data.gen.c ./core/include/data.gen.h 0
	cd ./core && make ../bin/eqsolv3d
debug0:
	sed -i "" -e 's:.*#define LEAKDETECT.*:#define LEAKDETECT 0:' 'mylib/include/utilities.h'
	./gen/bin/gen ./symbol ./core/src/symbol.gen.c ./core/include/symbol.gen.h ./core/src/data.gen.c ./core/include/data.gen.h 1
	cd ./core && make ../bin/eqsolv3d
debug1:
	sed -i "" -e 's:.*#define LEAKDETECT.*:#define LEAKDETECT 1:' 'mylib/include/utilities.h'
	./gen/bin/gen ./symbol ./core/src/symbol.gen.c ./core/include/symbol.gen.h ./core/src/data.gen.c ./core/include/data.gen.h 1
	cd ./core && make ../bin/eqsolv3d
release:
	sed -i "" -e 's:.*#define LEAKDETECT.*://#define LEAKDETECT 0:' 'mylib/include/utilities.h'
	./gen/bin/gen ./symbol ./core/src/symbol.gen.c ./core/include/symbol.gen.h ./core/src/data.gen.c ./core/include/data.gen.h 0
	cd ./core && make
eqsolv3:
	cd ./core && make
gen:
	sed -i "" -e 's:.*#define LEAKDETECT.*:#define LEAKDETECT 0:' 'mylib/include/utilities.h'
	cd ./gen && make
gen_debug0:
	sed -i "" -e 's:.*#define LEAKDETECT.*:#define LEAKDETECT 0:' 'mylib/include/utilities.h'
	cd ./gen && make
clean: 	
	-rm -f ./symbol/*/src/*.c
	-rm -f ./symbol/*/obj/*.o
	cd ./core && make clean
	cd ./gen && make clean
print:
	cd ./core && make print
