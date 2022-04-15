###**Get required packages**
'sudo apt install git'
'sudo apt install clang'
'sudo apt install cmake'

###**Clone llvm repo**
'git clone https://github.com/llvm/llvm-project.git'

###**Build preparation**
'cd llvm-project'
'mkdir build'
'cd build'

###**Build**
'cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm'
'make'

###**Add llvm to PARH**
'export PATH=$PATH:<your path to llvm-project>/llvm/build/bin'

###**Usage example**
'clang++ filename.cpp -S -emit-llvm -o -O0'
