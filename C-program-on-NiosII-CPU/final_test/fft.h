#ifndef FFT_H_
#define FFT_H_

#include "math.h"
#include "stdio.h"
#define N  512                //FFT POINT 
#define M   9            
#define pp 3.14159f
extern const float sin_table[9][256];
extern const float cos_table[9][256];
struct compx 
{     float real;
      float imag;
};
//fft comppute
void  FFT(struct compx *xin,float *result);

#endif //_FFT_H_

