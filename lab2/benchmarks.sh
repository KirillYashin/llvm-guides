clang++ -O3 -fno-vectorize -fno-unroll-loops -Rpass=loop-vectorize ./benchmark_app/main.cpp -I ./loops/vectorizable/ -DINCLUDE_TEST=\"testN.hpp\" -o ./benchmark_app_test_0
./benchmark_app_test_0

clang++ -O3 -fno-vectorize -Rpass=loop-vectorize ./benchmark_app/main.cpp -I ./loops/vectorizable/ -DINCLUDE_TEST=\"testN.hpp\" -o ./benchmark_app_test_1
./benchmark_app_test_1

clang++ -O3 -fno-unroll-loops -Rpass=loop-vectorize ./benchmark_app/main.cpp -I ./loops/vectorizable/ -DINCLUDE_TEST=\"testN.hpp\" -o ./benchmark_app_test_2
./benchmark_app_test_2

clang++ -O3 -Rpass=loop-vectorize ./benchmark_app/main.cpp -I ./loops/vectorizable/ -DINCLUDE_TEST=\"testN.hpp\" -o ./benchmark_app_test_3
./benchmark_app_test_3
