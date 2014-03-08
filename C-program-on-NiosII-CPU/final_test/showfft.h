#ifndef SHOWFFT_H_
#define SHOWFFT_H_
#include "stdio.h"
#include "lcm_config.h"
#include "unistd.h"

#define ER 1.41421

void showfftu(float *ham,float *ffturesult)
{  char u[40];
   GUI_PutChar(0,0,'0');
   GUI_PutChar(6,0,':');
   GUI_PutChar(0,12,'1');
   GUI_PutChar(6,12,':');
   GUI_PutChar(0,24,'2');
   GUI_PutChar(6,24,':'); 
   GUI_PutChar(0,36,'3');
   GUI_PutChar(6,36,':');
   GUI_PutChar(0,48,'4');
   GUI_PutChar(6,48,':');
   
  sprintf(u,"%.3fV",300*ffturesult[0]);
     GUI_PutString(15,0,u);
     
     sprintf(u,"%.3fV",300*ffturesult[1]*ER);
     GUI_PutString(15,12,u);
     
     sprintf(u,"%.3fV",300*ffturesult[2]*ER);
     GUI_PutString(15,24,u);
     sprintf(u,"%.3fV",300*ffturesult[3]*ER);
     GUI_PutString(15,36,u);
     sprintf(u,"%.3fV",300*ffturesult[4]*ER);
     GUI_PutString(15,48,u);
     
     sprintf(u,"%.0f%%",ham[0]*100);
     GUI_PutString(65,0,u);
     sprintf(u,"%.0f%%",ham[1]*100);
     GUI_PutString(65,12,u);
     sprintf(u,"%.0f%%",ham[2]*100);
     GUI_PutString(65,24,u);
     sprintf(u,"%.0f%%",ham[3]*100);
     GUI_PutString(65,36,u);
     sprintf(u,"%.0f%%",ham[4]*100);
     GUI_PutString(65,48,u);
     
     usleep(5000000);//µÈ´ý5Ãë
     GUI_ClearSCR();
     
     GUI_PutChar(0,0,'5');
   GUI_PutChar(6,0,':');
   GUI_PutChar(0,12,'6');
   GUI_PutChar(6,12,':');
   GUI_PutChar(0,24,'7');
   GUI_PutChar(6,24,':'); 
   GUI_PutChar(0,36,'8');
   GUI_PutChar(6,36,':');
   GUI_PutChar(0,48,'9');
   GUI_PutChar(6,48,':');
   
  sprintf(u,"%.3fV",300*ffturesult[5]*ER);
     GUI_PutString(15,0,u);
     
     sprintf(u,"%.3fV",300*ffturesult[6]*ER);
     GUI_PutString(15,12,u);
     
     sprintf(u,"%.3fV",300*ffturesult[7]*ER);
     GUI_PutString(15,24,u);
     sprintf(u,"%.3fV",300*ffturesult[8]*ER);
     GUI_PutString(15,36,u);
     sprintf(u,"%.3fV",300*ffturesult[9]*ER);
     GUI_PutString(15,48,u);
     
     sprintf(u,"%.0f%%",ham[5]*100);
     GUI_PutString(65,0,u);
     sprintf(u,"%.0f%%",ham[6]*100);
     GUI_PutString(65,12,u);
     sprintf(u,"%.0f%%",ham[7]*100);
     GUI_PutString(65,24,u);
     sprintf(u,"%.0f%%",ham[8]*100);
     GUI_PutString(65,36,u);
     sprintf(u,"%.0f%%",ham[9]*100);
     GUI_PutString(65,48,u);
   
   
}



void showffti(float *ham,float *fftiresult)
{  char u[40];
   GUI_PutChar(0,0,'0');
   GUI_PutChar(6,0,':');
   GUI_PutChar(0,12,'1');
   GUI_PutChar(6,12,':');
   GUI_PutChar(0,24,'2');
   GUI_PutChar(6,24,':'); 
   GUI_PutChar(0,36,'3');
   GUI_PutChar(6,36,':');
   GUI_PutChar(0,48,'4');
   GUI_PutChar(6,48,':');
   
  sprintf(u,"%.3fA",30*fftiresult[0]);
     GUI_PutString(15,0,u);
     
     sprintf(u,"%.3fA",30*fftiresult[1]*ER);
     GUI_PutString(15,12,u);
     
     sprintf(u,"%.3fA",30*fftiresult[2]*ER);
     GUI_PutString(15,24,u);
     sprintf(u,"%.3fA",30*fftiresult[3]*ER);
     GUI_PutString(15,36,u);
     sprintf(u,"%.3fA",30*fftiresult[4]*ER);
     GUI_PutString(15,48,u);
     
     sprintf(u,"%.0f%%",ham[0]*100);
     GUI_PutString(65,0,u);
     sprintf(u,"%.0f%%",ham[1]*100);
     GUI_PutString(65,12,u);
     sprintf(u,"%.0f%%",ham[2]*100);
     GUI_PutString(65,24,u);
     sprintf(u,"%.0f%%",ham[3]*100);
     GUI_PutString(65,36,u);
     sprintf(u,"%.0f%%",ham[4]*100);
     GUI_PutString(65,48,u);
     
     usleep(3500000);//µÈ´ý3.5Ãë
     GUI_ClearSCR();
     
     GUI_PutChar(0,0,'5');
   GUI_PutChar(6,0,':');
   GUI_PutChar(0,12,'6');
   GUI_PutChar(6,12,':');
   GUI_PutChar(0,24,'7');
   GUI_PutChar(6,24,':'); 
   GUI_PutChar(0,36,'8');
   GUI_PutChar(6,36,':');
   GUI_PutChar(0,48,'9');
   GUI_PutChar(6,48,':');
   
  sprintf(u,"%.3fA",30*fftiresult[5]*ER);
     GUI_PutString(15,0,u);
     
     sprintf(u,"%.3fA",30*fftiresult[6]*ER);
     GUI_PutString(15,12,u);
     
     sprintf(u,"%.3fA",30*fftiresult[7]*ER);
     GUI_PutString(15,24,u);
     sprintf(u,"%.3fA",30*fftiresult[8]*ER);
     GUI_PutString(15,36,u);
     sprintf(u,"%.3fA",30*fftiresult[9]*ER);
     GUI_PutString(15,48,u);
     
     sprintf(u,"%.0f%%",ham[5]*100);
     GUI_PutString(65,0,u);
     sprintf(u,"%.0f%%",ham[6]*100);
     GUI_PutString(65,12,u);
     sprintf(u,"%.0f%%",ham[7]*100);
     GUI_PutString(65,24,u);
     sprintf(u,"%.0f%%",ham[8]*100);
     GUI_PutString(65,36,u);
     sprintf(u,"%.0f%%",ham[9]*100);
     GUI_PutString(65,48,u);
   
   
}


#endif /*SHOWFFT_H_*/
