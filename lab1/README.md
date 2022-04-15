### **Get required packages**

```bash
sudo apt install git
```

```bash
sudo apt install clang
```

```bash
sudo apt install cmake
```


### **Clone llvm repo**

```bash
git clone https://github.com/llvm/llvm-project.git
```


### **Build preparation**

```bash
cd llvm-project
```

```bash
mkdir build
```

```bash
cd build
```


### **Build**

```bash
cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm
```

```bash
make -j <Number of CPU threads - 2>
```


### **Add llvm to PATH**

```bash
export PATH=$PATH:<your path to llvm-project>/llvm/build/bin
```

  
### **Usage example**
  
```bash
clang++ filename.cpp -S -emit-llvm -o -O0 > filename.ll
```

```bash
clang++ filename.cpp -S -emit-llvm -o -O1 > filename.ll
```
