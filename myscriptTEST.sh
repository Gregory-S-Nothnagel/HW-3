#!/bin/bash
g++ -O3 -march=native -flto -funroll-loops -ffast-math -Wall -o openMP openMP.cpp -fopenmp

./openMP 5 100 1 /scratch/$USER/5.5.1.txt 1 /scratch/$USER/debug.txt