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


### **Build preparation**

```bash
cmake -DLLVM_ENABLE_PROJECTS=clang-G "Unix Makefiles" ../llvm
```

### **Extra swap file to prevent build failure due to lack of RAM**

```bash
sudo swapoff -a
```

```bash
sudo rm -f /swapfile
```

```bash
sudo fallocate -l 16G /swapfile
```

```bash
sudo chmod 600 /swapfile
```

```bash
sudo mkswap /swapfile
```

```bash
sudo swapon /swapfile
```

### **Build**

```bash
make -j <Number of CPU threads div 2>
```
#### If you have errors try to reduce threads (maybe it's better to use one thread, I have 12 and I used 4)


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
