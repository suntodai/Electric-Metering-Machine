/******************************************************************
    ��ʾ�����е�ϵ�����ģ�
*******************************************************************/
#include "unistd.h"
#include "stdio.h"
#include <io.h>
#include "system.h"
#include "alt_types.h"
#include "sys/alt_irq.h"
#include "cut.h"
#include "math.h"
#include "UIPOW.h"
#include "lcm_config.h"
#include "showfig.h"
#include "findmax.h"
#include "showuif.h"
#include "showpqs.h"
#include "fft.h"
#include "showfft.h"
#include "error.h"
#include "welcom.h"
#include "nochoose.h"

#define ADstart  IOWR_32DIRECT(DOUBLE_ADS805_0_BASE,4,1)//write offset = 4 start success
#define ADstop  IOWR_32DIRECT(DOUBLE_ADS805_0_BASE,4,0)
#define ADclear_IRQ   IOWR_32DIRECT(DOUBLE_ADS805_0_BASE,8,1)
#define AD_clear_clear_IRQ IOWR_32DIRECT(DOUBLE_ADS805_0_BASE,8,0)
#define ADLSB 1.0/(pow(2,12)-1)
#define N 512
#define START_FREQ IOWR(FREQ_AVALON_0_BASE,2,1)
#define FREQSYS 80000000
#define adu 2.435//��ʵ��ƫѹֵ����
#define adi 2.238
#define fi 4.89
#define fu 4.97


 volatile alt_u8 sem ;//���ݴ�����־
 unsigned char const a[];//��
 unsigned char const b[];//��
 unsigned char const c[];//��
 unsigned char const d[];//�� 
 

 void AD_isr(void *temp,alt_u32 id) //�жϷ������
{
    //alt_irq_disable(DOUBLE_ADS805_0_IRQ);
    ADclear_IRQ;//clear irq
   
    sem=1;
  //  AD_clear_clear_IRQ;//not always clear irq
  //  alt_irq_enable(DOUBLE_ADS805_0_IRQ);
}
    
     

 void AD_INITIAL(void)//��ʼ����ע���ж�
{
  alt_irq_register(DOUBLE_ADS805_0_IRQ,NULL,AD_isr) ;
   
}


void ADread(alt_u32 *readbuf)
{  
  int i;

  for(i=0;i<N+1;i++)
  {
    *readbuf=IORD(DOUBLE_ADS805_0_BASE,0 );
    readbuf++;
    
    //printf("data=%lx\n",*readbuf);
 
  }
 
 }

 
 
 int main()
 {
    alt_u32 readdata[513]={0};
    alt_u16 udata[513];
    alt_u16 idata[513];
    alt_u8 key;//�洢��ֵ
    alt_u8 oldkey;// ����һ��ѭ���ļ�ֵ
    int cnt;//ѭ������ 
    
    int ifigdata[128];
    int ufigdata[128];//���ڻ�ͼ�����ݵ�
    //int udatamax;
    //int idatamax;
    
    float  ixin[512];
    float uxin[512];//���ڼ�������ݵ�
    float iresult,uresult,presult,sresult,qresult,pfresult;
    float umax,umin,imax,imin,pmax,pmin,qmax,qmin,smax,smin;
    float *findumax,*findumin,*findimax,*findimin,*findpmax,*findpmin,*findqmax,*findqmin,*findsmax,*findsmin;
    findumax=&umax;
    findumin=&umin;
    findpmax=&pmax;
    findpmin=&pmin;
    findqmax=&qmax;
    findqmin=&qmin;
    findsmax=&smax;
    findsmin=&smin;
    findimax=&imax;
    findimin=&imin;
   
   // char p[40],s[40],q[40],pf[40]��u[40],i[40];//��Чֵ��������ʾ�ַ���
    alt_u32 Ncheck;
    Ncheck=0;
    float freq;
    //alt_u32 a
    
    struct compx fftu[N];
    struct compx ffti[N];
    float ffturesult[N/2];
    float fftiresult[N/2];
    float ham[10];
    
    int j,k,m,n;
    
    GUI_Initialize();//��ʼ��Һ��
     GUI_ClearSCR();//����
     welcom();
     usleep(2000000);//��ʾ��ӭ��������
    AD_INITIAL();//AD��ʼ��
    START_FREQ;
    key=0;
    oldkey=0x00;//��ʼ��ֵ
 
    ADstart;//����AD
   
   while(1)
   {
    if(sem)
    {
        sem=0;
            
            ADstop; 
            ADread(readdata);//��ȡ��ֵ
            
            cut(readdata,udata,idata);//����ѹ�������ݷֱ���г�����������
            
      key=IORD(BUTTON_PIO_BASE,0);
      
      
      if(key^oldkey)
      {
         cnt=0;
        umax=imax=pmax=qmax=smax=0;
        umin=imin=pmin=qmin=smin=10000;     
      }//��ֵ�ı䣬����ֵǿ��Ϊ�㣬���ֵ�������㣬��Сֵ��һ����ֵ
      oldkey=key;
      //aa=0x02;
     //switch(aa)
      
     switch(key)
     {
 case 0x00:            //δ����
 
       GUI_ClearSCR();
        please();
             break;
        
        
 case 0x01:            //��ʾ���� 
        
      /*  udatamax=udata[0];
        idatamax=idata[0];
        
        for(k=1;k<N+1,k++)
        {
            if(udata[k]>udatamax)
            {
                udatamax=udata[k];
            }
        }//�ҳ����ֵ���Ա�������ʾ��С
        
        for(k=1;k<N+1;k++)
        {
            if(idatamax>idata[k])
            {
                idatamax=idata[k];
            }
        }*/
        
        n=0;
        
       /* for(m=1;m<N+1;m=m+4)
        {
           ifigdata[n]=(int)(idata[m]*46/((float)idatamax+5));   
           ufigdata[n]=(int)(udata[m]*52/((float)udatamax)+2��;//��ѹ��ֵ����Ϊ52�����ص�
           n++; 
        }*/
        
        if(cnt==0)
        {
            for(m=1;m<N+1;m=m+4)
        {
            ifigdata[n]=(int)(idata[m]*52*ADLSB+2);  //��ֵ���ƣ����¶���Һ���߽��������ص�
            ufigdata[n]=(int)(udata[m]*52*ADLSB+2);
            n++;
        }
            GUI_ClearSCR();
            usleep(100000);//��������ʱ0.1��
            
            showfig(ufigdata,ifigdata);//     ��������ʱ�䣡����������������������������
        }
        
        cnt++;
        if(cnt==20)//ÿˢ��һ��ѭ������
        {
            cnt=0;
        }
        
         break;
         
        
 case 0x02:  //��ʾU,I,F
     for(k=0;k<N;k++)
   {
   ixin[k]=fi*idata[k+1]*ADLSB-adi;
   uxin[k]=fu*udata[k+1]*ADLSB-adu;
   }//ת����ʵ�ʵ�ѹֵ1-5V
   
   uresult=UU(uxin);
   iresult=II(ixin);  //������Чֵ
   
     findum(uresult,findumax,findumin);
   findim(iresult,findimax,findimin);//ÿ�۲�һ�ζ�Ҫ������ֵ�������Ƿ���Ҫˢ��
     
        
     if(cnt==0)
     {
       
      Ncheck=0;
   
   for(j=0;j<20;j++)
   {
    
    Ncheck+=IORD(FREQ_AVALON_0_BASE,0);
    
   }
   
   freq=FREQSYS/((float)Ncheck/20); //����Ƶ��
   GUI_ClearSCR();
   showuif(uresult,iresult,umax,umin,imax,imin,freq);//������ʾ
   
   
   
   }
   cnt++;
   
   if(cnt==10)
   {
    cnt=0;
   }
   
       
        
        break;
        
 case 0x04:            //��ʾP,Q,S,PF
 
    for(k=0;k<N;k++)
   {
   ixin[k]=fi*idata[k+1]*ADLSB-adi;
   uxin[k]=fu*udata[k+1]*ADLSB-adu;
   }//ת����ʵ�ʵ�ѹֵ1-5V
   
    uresult=UU(uxin);
   iresult=II(ixin);  //������Чֵ
   
    presult=PP(uxin,ixin);//�й�����
   sresult=uresult*iresult;//���ڹ���
   qresult=sqrt(fabs(pow(sresult,2)-pow(presult,2)));//�޹�����
   pfresult=presult/sresult;
  findum(presult,findpmax,findpmin);
  findum(qresult,findqmax,findqmin);
  findum(sresult,findsmax,findsmin);//������ֵ 
   
  if(cnt==0)
  {
    GUI_ClearSCR();
    
   showpqs(presult,qresult,sresult,pmax,pmin,qmax,qmin,smax,smin,pfresult);//������ʾ
   
   
  }
  
  cnt++;
   
   if(cnt==20)
   {
    cnt=0;
   }
        
        break;
        
        case 0x08:            //��ʾ��ѹг��
      for(k=0;k<N;k++)
   {
   uxin[k]=fu*udata[k+1]*ADLSB-adu;//��Ҫʵ�ʵ�����
   }//ת����ʵ�ʵ�ѹֵ1-5V   
        
    for(m=0;m<N;m++)   
    {
      fftu[m].real=uxin[m];
      fftu[m].imag=0;   
    }
        
    /* FFT(fftu,ffturesult);
     
     for(n=0;n<10;n++)
     {
        ham[n]=ffturesult[n]/ffturesult[1];
     }*/
   if(cnt==0)
   {
    FFT(fftu,ffturesult);
     
     for(n=0;n<10;n++)
     {
        ham[n]=ffturesult[n]/ffturesult[1];
     }
    GUI_ClearSCR();
    showfftu( ham,ffturesult);//������ʾг��
    
   }
    cnt++;
   
   if(cnt==15)
   {
    cnt=0;
   }
   
     
        
        
        break;
        
        case 0x10:            //��ʾ����г��
   for(k=0;k<N;k++)
   {
   ixin[k]=fi*idata[k+1]*ADLSB-adi;
   }//ת����ʵ�ʵ�ѹֵ1-5V   
        
    for(m=0;m<N;m++)   
    {
      ffti[m].real=ixin[m];
      ffti[m].imag=0;   
    }
        
     /*FFT(ffti,fftiresult);
     
     for(n=0;n<10;n++)
     {
        ham[n]=fftiresult[n]/fftiresult[1];
     }   */   
        
     if(cnt==0)
   {
    FFT(ffti,fftiresult);
     
     for(n=0;n<10;n++)
     {
        ham[n]=fftiresult[n]/fftiresult[1];
     }      
        
    GUI_ClearSCR();
    showffti( ham,fftiresult);//������ʾг��
    
   }
    cnt++;
   
   if(cnt==15)
   {
    cnt=0;
   }   
        
        
        break;
        
        
        default:
        GUI_ClearSCR();
        error();
    //���������ʾ
        
        break;
        
        }//switch
     
    ADstart;  //���������ٴ�����
            
    }//if sem
     
   }//while
    
    
    
  }//main