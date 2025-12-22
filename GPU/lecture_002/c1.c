#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/**
 * @brief Computes the dot product of two float vectors.
 [cite_start]* [cite: 185-190]
 */
float dp(long N, float *pA, float *pB) {
    float R = 0.0;
    int j;
    for (j = 0; j < N; j++) {
        R += pA[j] * pB[j];
    }
    return R;
}

int main(int argc, char *argv[]) {
    // --- 1. Input Validation and Parsing ---
    if (argc != 3) {
        // Provide usage instructions if arguments are incorrect
        fprintf(stderr, "Usage: %s <vector_size> <repetitions>\n", argv[0]);
        return 1; // Exit with an error code
    }

    // Convert command-line arguments from strings to numbers
    long N = atol(argv[1]);    // Use atol for long integers
    int reps = atoi(argv[2]);  // Use atoi for integers

    // --- 2. Memory Allocation ---
    float *pA = (float *)malloc(N * sizeof(float));
    float *pB = (float *)malloc(N * sizeof(float));

    // CRITICAL: Always check if malloc succeeded
    if (pA == NULL || pB == NULL) {
        fprintf(stderr, "Error: Failed to allocate memory for vectors.\n");
        free(pA); // free() is safe to call on a NULL pointer
        free(pB);
        return 1; // Exit with an error code
    }

    // --- 3. Data Initialization ---
    [cite_start]// Initialize vector elements to 1.0f as specified [cite: 184]
    for (long i = 0; i < N; i++) {
        pA[i] = 1.0f;
        pB[i] = 1.0f;
    }

    // --- 4. Measurement Loop ---
    double total_time = 0.0;
    // Use 'volatile' to prevent the compiler from optimizing away the dp() call
    volatile float result;
    struct timespec start, end;
    
    [cite_start]// We only time the second half of the repetitions [cite: 195]
    int start_rep = reps / 2;

    for (int i = 0; i < reps; i++) {
        [cite_start]// Measure time using CLOCK_MONOTONIC [cite: 193]
        clock_gettime(CLOCK_MONOTONIC, &start);
        result = dp(N, pA, pB);
        clock_gettime(CLOCK_MONOTONIC, &end);

        // Accumulate time only for the second half of the runs
        if (i >= start_rep) {
            double duration = (end.tv_sec - start.tv_sec) +
                              (end.tv_nsec - start.tv_nsec) / 1e9; // Convert nanoseconds to seconds
            total_time += duration;
        }
    }

    // --- 5. Performance Calculation ---
    int measured_reps = reps - start_rep;
    double avg_time = total_time / measured_reps;

    // Bandwidth: 2 arrays * N elements/array * 4 bytes/element
    double bytes_per_run = (double)2 * N * sizeof(float);
    double bandwidth = bytes_per_run / avg_time / 1e9; // Convert from B/s to GB/s

    // Throughput: N multiplications + N additions = 2*N FLOPs
    double flops_per_run = (double)2 * N;
    double throughput = flops_per_run / avg_time; // Result is in FLOP/sec

    // --- 6. Output ---
    [cite_start]// Print results in the specified format [cite: 196-198]
    printf("N: %ld <T>: %f sec B: %f GB/sec F: %f FLOP/sec\n",
           N, avg_time, bandwidth, throughput);

    // --- 7. Cleanup ---
    free(pA);
    free(pB);

    return 0; // Exit successfully
}