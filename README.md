To Compile, use this script:

#!/bin/bash
source /apps/profiles/modules_asax.sh.dyn
module load intel
icpx -O3 -march=native -flto -funroll-loops -ffast-math -Wall -o openMP openMP.cpp -fopenmp

To Run, use this command:

./openMP <SIZE> <MAX_GENERATIONS> <NUM_THREADS> <OUTPUT_FILE> <DEBUG_MODE?> <DEBUG_FILE>

for example:

./openMP 5 100 4 /scratch/$USER/test.txt 1 /scratch/$USER/debug.txt

or, for no debugging (only debug with small board sizes)

./openMP 5 100 4 /scratch/$USER/test.txt 0 dummy_path.txt




NOTE: DEBUG_MODE simply refers to whether the board state will be outputted to the specified file after each iteration. It should only be used to verify functionality!
