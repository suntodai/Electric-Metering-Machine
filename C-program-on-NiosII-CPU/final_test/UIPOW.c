#include "UIPOW.h"


float UU(float *uxin)//�����ѹ��Чֵ
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

float II(float *ixin)//���������Чֵ
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

float PP(float *uxin,float *ixin)//������Ч����
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