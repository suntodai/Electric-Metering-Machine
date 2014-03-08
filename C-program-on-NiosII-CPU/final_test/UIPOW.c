#include "UIPOW.h"


float UU(float *uxin)//计算电压有效值
{
    int i=0;
    float uresult=0;
    
    for(i=0;i<N;i++)
    {
       uresult+=pow(uxin[i],2)/N;   
    }
    
    uresult=(sqrt(uresult));
    return(uresult);     
}

float II(float *ixin)//计算电流有效值
{
    int j;
    
    float iresult=0;
    for(j=0;j<N;j++)
    {
        iresult+=pow(ixin[j],2)/N; 
    }
    
   iresult=(sqrt(iresult));
   return(iresult);
    
}

float PP(float *uxin,float *ixin)//计算有效功率
{
    int k;
    float presult;
    presult=0;
    for(k=0;k<N;k++)
    {
        presult+=uxin[k]*ixin[k]/N;
    }
    return(presult); 
}