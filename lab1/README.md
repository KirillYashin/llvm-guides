### Ubuntu installing
#### Instruction - [link](https://losst.ru/ustanovka-linux-ryadom-s-windows-10)
#### I recommend to allocate minumum 150 gb to Ubuntu

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
cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm
```

### **Extra swap file to prevent build failure due to lack of RAM**
#### I have 16 GB RAM and 24 GB swap file
#### If you have less RAM try to allocate more memory for swap file 

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
#### If you have build failure on 80+ per cents, try to do make again with less threads (make can continue build, you don't need to do all the steps again)
#### Useful advice: install htop
``` bash
sudo apt install htop
```
```bash
htop
```
#### You can check your PC resources with it and it can help you to configure swap file size

### **Add llvm to PATH**

```bash
export PATH=$PATH:<your path to llvm-project>/build/bin
```

  
### **Usage example**
  
```bash
clang++ filename.cpp -S -emit-llvm -o -O0 > filename.ll
```

```bash
clang++ filename.cpp -S -emit-llvm -o -O1 > filename.ll
```

```bash
clang++ licm_10.cpp -O1 -o licm_10_optimized
```

```bash
clang++ licm_10.cpp -O0 -o licm_10_no_optimized
```

### Benchmarking
#### FYI: you need to install some packages (cset and some pkgs for perf stat command)
#### Terminal will give you the names of these pkgs
#### Disable turboboost (1st command for Intel CPUs, 2nd for AMD)

```bash
sudo bash -c "echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo"
````

```bash
sudo bash -c "echo 0 > /sys/devices/system/cpu/cpufreq/boost"
````

```bash
sudo bash -c "echo 0 > /proc/sys/kernel/randomize_va_space"
```
#### Do this for every CPU thread (X in range 0..11 if you have 12 threads for example)
```bash
sudo bash -c "echo performance > /sys/devices/system/cpu/cpuX/cpufreq/scaling_governor"
```

#### Find siblings CPUs (N is CPU number, you will see it sibling)
```bash
sudo nano /sys/devices/system/cpu/cpuN/topology/thread_siblings_list
```
#### You will get 2 CPU numbers (1 and 7 for example). Next, do this (numbers can be different for you)
```bash
sudo cset shield -c 1-7 -k on
```

```bash
sudo bash -c "echo 0 > /sys/devices/system/cpu/cpu1/online"
```

```bash
sudo bash -c "echo 0 > /sys/devices/system/cpu/cpu7/online"
```
#### Finally, benchmarking
```bash
sudo cset shield --exec -- perf stat -r 10 <path to compiled files (for example, ./build/licm_10_optimized)>
```

### Most difficult part - disable LICM (source code changing)
#### You need to change LICM.cpp file
#### 1st change - runOnLoop function should always return false
#### 2nd change - LoopInvariantCodeMotion should always return false
#### Then rebuild llvm+clang, compile files again and do benchmarking

### FAST AND EASY
