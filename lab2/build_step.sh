clang -O3 -fno-vectorize -fno-unroll-loops -I./loops/vectorizable/ -DINCLUDE_TEST=\"testN.hpp\" test.cpp -emit-llvm -c -o testN.bc
llvm-extract -func=_ZN8testFunc3runEv testN.bc -o run-fn.bc
llvm-dis run-fn.bc -o no_vec_and_unroll.ll

clang -O3 -fno-vectorize -I./loops/vectorizable/ -DINCLUDE_TEST=\"testN.hpp\" test.cpp -emit-llvm -c -o testN.bc
llvm-extract -func=_ZN8testFunc3runEv testN.bc -o run-fn.bc
llvm-dis run-fn.bc -o no_vec.ll

clang -O3 -fno-unroll-loops -I./loops/vectorizable/ -DINCLUDE_TEST=\"testN.hpp\" test.cpp -emit-llvm -c -o testN.bc
llvm-extract -func=_ZN8testFunc3runEv testN.bc -o run-fn.bc
llvm-dis run-fn.bc -o no_unroll.ll

clang -O3 -I./loops/vectorizable/ -DINCLUDE_TEST=\"testN.hpp\" test.cpp -emit-llvm -c -o testN.bc
llvm-extract -func=_ZN8testFunc3runEv testN.bc -o run-fn.bc
llvm-dis run-fn.bc -o with_all.ll

