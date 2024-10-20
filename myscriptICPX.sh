#!/bin/bash
source /apps/profiles/modules_asax.sh.dyn
module load intel
icpx -O3 -march=native -flto -funroll-loops -ffast-math -Wall -o openMP openMP.cpp -qopenmp

./openMP 5000 5000 20 /scratch/$USER/5000.5000.20.txt 0 /scratch/$USER/debug.txt
./openMP 5000 5000 16 /scratch/$USER/5000.5000.16.txt 0 /scratch/$USER/debug.txt
./openMP 5000 5000 10 /scratch/$USER/5000.5000.10.txt 0 /scratch/$USER/debug.txt
./openMP 5000 5000 8 /scratch/$USER/5000.5000.8.txt 0 /scratch/$USER/debug.txt
./openMP 5000 5000 4 /scratch/$USER/5000.5000.4.txt 0 /scratch/$USER/debug.txt
./openMP 5000 5000 2 /scratch/$USER/5000.5000.2.txt 0 /scratch/$USER/debug.txt
./openMP 5000 5000 1 /scratch/$USER/5000.5000.1.txt 0 /scratch/$USER/debug.txt