/*
 * Test_no_ASF.c
 *
 * Created: 11/12/2016 12:56:31 PM
 * Author : John
 */ 

#define len(x)   ( sizeof(x) / (sizeof(x[0]) )
#define mod(x,m) (((x < 0) ? ((x % m) + m) : x) % m)

#include "sam.h"

////////////////////////////////////////////////////////////

#define IO_LEN 1000

/* 
 * Sample Input Signal
 * Linear Chirp, 0 Hz -> 3 kHz
 * 8 kHz sample rate, 32 bit
 */
int32_t input[IO_LEN] = {0};

/* Filtered Output Signal */
int32_t output[IO_LEN] = {0};
    
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/* FIR Functions & Variables */

#define FIR_LEN     21
/* 
 * FIR Bandpass Filter
 * 21 Taps
 * 32 bit precision
 * See MATLAB for more details
 */
int32_t fir_coeffs[FIR_LEN] = { -1318, -3829, -4009, -717, 3359, 2177, -3706, -5613, 4154, 20372, 28471, 20372, 4154, -5613, -3706, 2177, 3359, -717, 4009, -3829, -1318 };   
    
    
/*
 * fir_int32
 * 32-bit fixed point FIR filter
 *
 * @param input: Pointer to input array to filter
 * @param output: Pointer to output array to store filtered result
 * @param io_length: Length of input and output arrays (should be the same)
 * @param fir_coeffs: Pointer to FIR coefficient array
 * @param num_taps: Number of FIR taps (should be length of fir_coeffs)
 * @param dot_n: n value in fixed point Qm.n notation
 */
void fir_int32(int32_t *input, int32_t *output, uint32_t io_length, int32_t *fir_coeffs, uint32_t num_taps, uint32_t dot_n) {
    static int32_t  delay_line[FIR_LEN]  = {0};
    static uint32_t delay_line_index     =  0;
           uint32_t io_index             =  0;    // Index for input and output buffers
           uint32_t fir_index            =  0;    // Index for FIR filter
           int64_t  fir_acc              =  0;    // FIR accumulator
           int32_t  delay_val            =  0;    // Delayed input value
    
    for(io_index = 0; io_index < io_length; io_index++) {
        fir_acc = 0;
        delay_line[delay_line_index] = input[io_index];                                 // Copy input value to delay line
        for(fir_index = 0; fir_index < num_taps; fir_index++) {                         // Convolve delay line with FIR coefficients
            delay_val = delay_line[ mod((delay_line_index - fir_index), num_taps) ];      
            fir_acc += (int64_t)(delay_val * fir_coeffs[fir_index]);                    
        }
        output[io_index] = (int32_t)(fir_acc >> dot_n);                                  // Finish fixed-point math and output FIR conv result
        delay_line_index++;                                                              
        if(delay_line_index >= num_taps) {                                               // Reset delay line index on overflow
            delay_line_index = 0;                                                        
        }
    }   
}

////////////////////////////////////////////////////////////

int main(void) {
    /* Initialize the SAM system */
    SystemInit();    

    /* Replace with your application code */
    while (1) {
        fir_int32(input, output, IO_LEN, fir_coeffs, FIR_LEN, 31);
    }
}
