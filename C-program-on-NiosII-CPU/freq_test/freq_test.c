#include "system.h"
#include "alt_types.h"
#include "unistd.h"
#include <stdio.h>
#include <io.h>
//--------------------------------------------------------
#define COUNT_FREQ IOWR(FREQ_AVALON_0_BASE,2,1)
//#define STOP_COUNT_FREQ IOWR(FREQ_AVALON_0_BASE,2,0)



int main(void)
{
long unsigned int N=0;
long unsigned int M=0;
while(1)
{
   COUNT_FREQ; 
   if(IORD(FREQ_AVALON_0_BASE,2))
   {
    printf(" read:start = 1\n");
   }
   else
   {
    printf(" read:start failure!\n");
   }
      N=IORD(FREQ_AVALON_0_BASE,0);
      printf("The freq of input signal equals %ld\n ",N);
      M=IORD(FREQ_AVALON_0_BASE,1);
      printf("The freq of output signal equals %ld\n",M);

      usleep(1000);//delay 1s

 /*  STOP_COUNT_FREQ; 
     if(IORD(FREQ_AVALON_0_BASE,2))
   {
    printf(" stop:start = 1\n");
   }
   else
   {
    printf(" stop: stop!\n");
   }
     N=IORD(FREQ_AVALON_0_BASE,0);
     printf("The freq of input signal equals %ld\n ",N);
     M=IORD(FREQ_AVALON_0_BASE,1);
     printf("The freq of output signal equals %ld\n",M);*/
 };

return 0;

}

