
#include "unistd.h"
#include "stdio.h"
#include <io.h>
#include "system.h"
#include "alt_types.h"
#include "sys/alt_irq.h"

#define ADstart  IOWR_32DIRECT(DOUBLE_ADS805_0_BASE,4,1)//write offset = 4 start success
#define ADstop  IOWR_32DIRECT(DOUBLE_ADS805_0_BASE,4,0)
#define ADclear_IRQ   IOWR_32DIRECT(DOUBLE_ADS805_0_BASE,8,1)
#define AD_clear_clear_IRQ IOWR_32DIRECT(DOUBLE_ADS805_0_BASE,8,0)
#define N 1024



 volatile alt_u8 sem ;

 void AD_isr(void *temp,alt_u32 id) //中断服务程序
{
   // alt_irq_disable(DOUBLE_ADS805_0_IRQ);
    ADclear_IRQ;//clear irq
   // printf("Enter isr\n");
    sem=1;
  //  AD_clear_clear_IRQ;//not always clear irq
  //  alt_irq_enable(DOUBLE_ADS805_0_IRQ);
}
    
     

 void AD_INITIAL(void)//初始化，注册中断
{
  alt_irq_register(DOUBLE_ADS805_0_IRQ,NULL,AD_isr) ;
   
}


void ADread(alt_u32 *readbuf)
{  
  int i;

  for(i=0;i<N;i++)
  {
    *readbuf=IORD(DOUBLE_ADS805_0_BASE,0 );
    readbuf++;
    
    //printf("data=%lx\n",*readbuf);
 
  }
 
 }


 
int main(void)
{
    alt_u32 readdata[N]={0};
    AD_INITIAL();
    //usleep(1000);
    printf("Register !\n");
    ADstart;
    //start_signal = IORD_32DIRECT(DOUBLE_ADS805_0_BASE,4);//Have read register sucessful

      while(1)
     {
     
        if(sem)
        {
            sem=0;
            ADstop; 
            ADread(readdata);
            int i;       
            for(i=0;i<N;i++)
            {
                printf("readdata%d = %lx\n",i,readdata[i]);   
            }
        
        }
        else
        {
                  ADstart;
                  printf("no data!\n");
        } 
        
        }   
    printf("Program run out of loop!\n");
    return 0;
}
