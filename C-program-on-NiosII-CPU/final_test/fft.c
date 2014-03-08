#include "fft.h"


struct compx EE(struct compx b1,struct compx b2)
{
    struct compx b3;
    b3.real=b1.real*b2.real-b1.imag*b2.imag;
    b3.imag=b1.real*b2.imag+b1.imag*b2.real;
    return(b3);
}//���帴������㷨

void FFT(struct compx *xin,float *result)
{
    int f,LH,nm,i,k,j,L;
    double p , ps ;
    int B,ip,le;
    struct compx w,t;
    LH=N/2;
    f=N; 
    // for(m=1;(f=f/2)!=1;m++){;} 
    nm=N-2;    
    j=N/2;
    /*��ַ����*/
    for(i=1;i<=nm;i++)
    {
      if(i<j){t=xin[j];xin[j]=xin[i];xin[i]=t;}
      k=LH;
      while(j>=k){j=j-k;k=k/2;}
     
      j=j+k;
    }//���ص�ת����


  for(L=1;L<=M;L++)
  {  
    le=pow(2,L);
    B=pow(2,L-1); //modified by xiaofei
    for(j=0;j<=B-1;j++)//jΪ�̶���˺�����ϵ��
    {
    p=pow(2,M-L)*j;
    ps=2*pp/N*p;// ָ��
   // w.real=cos(ps); //modified by xiaofei
    //w.imag=-sin(ps);
    w.real=cos_table[L-1][j];//��������������Լ�1
    w.imag=-sin_table[L-1][j];//����ÿ����Wֵ
    for(i=j;i<=N-1;i=i+le)
      { 
        ip=i+B;//��˺˺�����Ԫ�ر��
        t=EE(xin[ip],w);//����Ӧ���źų��Ժ˺���
        xin[ip].real=xin[i].real-t.real;
        xin[ip].imag=xin[i].imag-t.imag;
        xin[i].real=xin[i].real+t.real;
        xin[i].imag=xin[i].imag+t.imag;//����������һ���������ٷ��ؼ�����һ��
      }
    }
  }
  //select mode
  
  for(i=0;i<N/2;i++)
  {
    result[i]=sqrt(pow(xin[i].real,2)+pow(xin[i].imag,2))/N;
  }
  //�������г����ֵ������ֱ������
  
  
 }   
