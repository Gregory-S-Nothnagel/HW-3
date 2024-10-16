To Compile, use this script:

#!/bin/bash
source /apps/profiles/modules_asax.sh.dyn
module load intel
icpx -O3 -march=native -flto -funroll-loops -ffast-math -Wall -o openMP openMP.cpp -fopenmp

To Run, use this command:

./openMP <SIZE> <MAX_GENERATIONS> <NUM_THREADS> <OUTPUT_FILE>

for example:

./openMP 100 100 1 /scratch/$USER/test.txt
