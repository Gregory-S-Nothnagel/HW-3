In this repository are:
  6 output files. To measure performance, I ran 3 rounds of tests using the GNU compiler and 3 rounds of tests using the ICPX compiler. Each round gets its own output file, so the final average times for each thread count use the time for that thread from each of the 3 rounds. In each round, 5000 max iterations for 5000x5000 board size was simulated on the ASC cluster for each of the following thread counts: 1, 2, 3, 4, 8, 10, 16, 20. For example
    the following line occurs in the output file GNU_round_1.o200262, GNU_round_2.o200265, and GNU_round_3.o200270 respectively:
    start /scratch/ualclsd0186/5000.5000.20.txt end: 15, stopped after 5000 iterations
    start /scratch/ualclsd0186/5000.5000.20.txt end: 32, stopped after 5000 iterations
    start /scratch/ualclsd0186/5000.5000.20.txt end: 14, stopped after 5000 iterations
    This means 5000x5000 size board, run for 5000 max iterations, using 20 threads. It took 15 seconds to execute in round 1, 32 seconds in round 2, 14 seconds in round 3, and stopped after 5000 iterations in all 3 rounds. The times are averaged in order to obtain the time listen in the table in the report Word document.

  There are also 3 script files:
    myscriptTEST.sh for testing a small 5x5 board and inspecting the debug.txt file to ensure proper functionality for 1 thread. (using the GNU compiler)
    myscriptGNU.sh for testing the required test cases for the different number of threads, using the GN compiler. Running this script once will achieve 1 round of tests (ie GNU_round_1).
    myscriptICPX.sh for testing the required test cases for the different number of threads, using the ICPX compiler. Running this script once will achieve 1 round of tests (ie GNU_round_1).



To Compile openMP.cpp (the source code for parallel conway implementation), use this script:

#!/bin/bash
source /apps/profiles/modules_asax.sh.dyn
module load intel
icpx -O3 -march=native -flto -funroll-loops -ffast-math -Wall -o openMP openMP.cpp -qopenmp



To Run the resulting output file, use this command:

"./openMP <SIZE> <MAX_GENERATIONS> <NUM_THREADS> <OUTPUT_FILE> <DEBUG_MODE?> <DEBUG_FILE>"
NOTE: DEBUG_MODE simply refers to whether the board state will be outputted to the specified file after each iteration. It should only be used to verify functionality!

for example:

"./openMP 5 100 4 /scratch/$USER/test.txt 1 /scratch/$USER/debug.txt"

if you want to test a 5x5 board to a max 100 iterations, outputting the final board state to /scratch/$USER/test.txt and all intermediate board states to /scratch/$USER/debug.txt

If you want to run with large boards, it is recommended that the second to last <DEBUG_MODE?> argument should be set to 0 to avoid outputting all intermediate board states. The command to run this kind of large board would look like:

./openMP 5000 100 4 /scratch/$USER/test.txt 0 dummy_path.txt

In this case, the dummy_path.txt file will not be created and no intermediate board states will be outputted.
