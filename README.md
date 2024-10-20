# Parallel Conway's Game of Life

This repository contains an implementation of Conway's Game of Life using OpenMP for parallel processing. The performance was evaluated using both the GNU and ICPX compilers with varying thread counts.

## Performance Testing

To measure performance, three rounds of tests were conducted using the GNU compiler and three rounds using the ICPX compiler. Each round produces its own output file, and the final average times for each thread count utilize the time for that thread from each of the three rounds.

### Test Setup

- **Board Size:** 5000 x 5000
- **Max Iterations:** 5000
- **Thread Counts:** 1, 2, 3, 4, 8, 10, 16, 20

### Example Output

The following lines are examples from the output files `GNU_round_1.o200262`, `GNU_round_2.o200265`, and `GNU_round_3.o200270` respectively:

    start /scratch/ualclsd0186/5000.5000.20.txt end: 15, stopped after 5000 iterations
    start /scratch/ualclsd0186/5000.5000.20.txt end: 32, stopped after 5000 iterations
    start /scratch/ualclsd0186/5000.5000.20.txt end: 14, stopped after 5000 iterations

This indicates:
- **Board Size:** 5000 x 5000
- **Max Iterations:** 5000
- **Threads Used:** 20
- **Execution Times:** 15 seconds (Round 1), 32 seconds (Round 2), 14 seconds (Round 3)
- All runs stopped after reaching the maximum iterations.

### Output Files

The output files are named in the format `GNU_round_X.oY`, where `X` is the round number and `Y` is a unique identifier.

## Scripts

There are three script files provided:

1. **myscriptTEST.sh**: 
   - Tests a small 5x5 board.
   - This allows you to inspect `debug.txt` to ensure proper functionality for 1 thread
   - `debug.txt` (the output of myscriptTEST.sh) exists in this repository if you want to manually inspect it like I did
   - (uses the GNU compiler).

2. **myscriptGNU.sh**: 
   - Tests the required cases for different numbers of threads using the GNU compiler.
   - Running this script once will achieve one round of tests (i.e., `GNU_round_X`).

3. **myscriptICPX.sh**: 
   - Tests the required cases for different numbers of threads using the ICPX compiler.
   - Running this script once will achieve one round of tests (i.e., `ICPX_round_X`).

## Compilation

To compile `openMP.cpp` (the source code for the parallel Conway implementation), use the following script:

```bash
#!/bin/bash
source /apps/profiles/modules_asax.sh.dyn
module load intel
icpx -O3 -march=native -flto -funroll-loops -ffast-math -Wall -o openMP openMP.cpp -qopenmp
```


Running the Program
To run the resulting output file, use the following command:

```bash
./openMP <SIZE> <MAX_GENERATIONS> <NUM_THREADS> <OUTPUT_FILE> <DEBUG_MODE?> <DEBUG_FILE>
```
### Arguments

- **`<SIZE>`**: Size of the board (e.g., `5` for a 5x5 board).
- **`<MAX_GENERATIONS>`**: Maximum number of iterations (e.g., `100`).
- **`<NUM_THREADS>`**: Number of threads to use (e.g., `4`).
- **`<OUTPUT_FILE>`**: Path to save the final board state.
- **`<DEBUG_MODE?>`**: Set to `1` to output board state after each iteration; use `0` for no intermediate output.
- **`<DEBUG_FILE>`**: Path for intermediate board states (only used if `DEBUG_MODE` is set to `1`).

### Example Commands
To test a small board (5x5) with a maximum of 100 iterations, outputting both the final and intermediate states:
```bash
./openMP 5 100 4 /scratch/$USER/test.txt 1 /scratch/$USER/debug.txt
```

For a large board, it is recommended to set the second-to-last argument (DEBUG_MODE) to 0 to avoid outputting all intermediate states:

```bash
./openMP 5000 100 4 /scratch/$USER/test.txt 0 dummy_path.txt
```
