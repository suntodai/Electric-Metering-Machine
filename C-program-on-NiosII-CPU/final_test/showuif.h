#ifndef SHOWUIF_H_
#define SHOWUIF_H_

#include "stdio.h"
#include "lcm_config.h"

void showuif(float uresult,float iresult,float umax,float umin,float imax,float imin,float freq)
{  
    char u[40],i[40],ua[40],ui[40],ia[40],ii[40],fr[80]; 
    
  GUI_PutChar(0,0,'U');
     GUI_PutChar(6,0,'=');
    GUI_PutChar(64,0,'I');
    GUI_PutChar(70,0,'=');
    GUI_HLine(0,10,127,1);
    GUI_PutChar(30,13,'m');
    GUI_PutChar(36,13,'a');
    GUI_PutChar(42,13,'x');
    
    
    GUI_PutChar(94,13,'m');
    GUI_PutChar(100,13,'i');
    GUI_PutChar(106,13,'n');
   
    
    
    GUI_PutChar(0,26,'U');
    GUI_PutChar(6,26,':');
   
    GUI_PutChar(0,39,'I');
    GUI_PutChar(6,39,':');
   GUI_HLine(0,50,127,1);
    GUI_PutChar(0,54,'f');
    GUI_PutChar(8,54,'=');//画出各表头
    
  sprintf(u,"%.2fV",uresult*300);
     GUI_PutString(13,0,u);
    sprintf(i,"%.2fA",iresult*30);
    GUI_PutString(77,0,i);  
    
    sprintf(ua,"%.2fV",umax*300);
     GUI_PutString(13,26,ua);
    sprintf(ui,"%.2fV",umin*300);
     GUI_PutString(73,26,ui);
     
     sprintf(ia,"%.2fA",imax*30);
     GUI_PutString(13,39,ia);
     
     sprintf(ii,"%.2fA",imin*30);
     GUI_PutString(73,39,ii);
     
     sprintf(fr,"%fHz",freq);
     GUI_PutString(16,54,fr);
}

#endif /*SHOWUIF_H_*/
