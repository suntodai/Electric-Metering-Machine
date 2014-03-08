#ifndef CUT_H_
#define CUT_H_

#include  "system.h"
#include  "math.h"
#include "alt_types.h"
#include <stdio.h>
#define ADLSB 1.0/(pow(2,12)-1)
#define N 512

void cut(alt_u32 *readdata,alt_u16 *udata,alt_u16 *idata)
{
    int i;
    
   
    for(i=0;i<N+1;i++)
    {
        *udata=(alt_u16)(*readdata>>16);
        udata++;
        *idata=(alt_u16)(*readdata);
        idata++;
        readdata++;
    }
}

#endif /*CUT_H_*/
