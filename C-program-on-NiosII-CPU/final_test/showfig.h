#ifndef SHOWFIG_H_
#define SHOWFIG_H_
#include "lcm_config.h"
#include "math.h"

void showfig(int *figudata,int *figidata)
{
   GUI_PutChar(4,0,'U');
   GUI_PutChar(12,0,':');
   GUI_HLine(20,3,50,1);
   GUI_HLine(20,4,50,1);
   
   GUI_PutChar(60,0,'I');
   GUI_PutChar(68,0,':');
   GUI_HLine(76,3,106,1);
   
   int i,j,k;
   j=0;
   for(i=0;i<128;i++) 
     
    {  
       if(j==127)
       {
        j=j-128;
       }
       if(figudata[i]==figudata[j+1])
       {
        GUI_Point(i,(63-figudata[i]),1);
       }
       else
       {
        GUI_RLine(i,(63-figudata[i]),(63-figudata[j+1]),1);
       }
      
    j++;   
        
    }
    
   for(k=0;k<128;k++)
    {
        GUI_Point(k,(63-figidata[k]),1);
    }
   
    
}

#endif /*SHOWFIG_H_*/
