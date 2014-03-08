/******************************************************************
    显示函数中的系数更改！
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
#define adu 2.435//按实际偏压值调整
#define adi 2.238
#define fi 4.89
#define fu 4.97


 volatile alt_u8 sem ;//数据存满标志
 unsigned char const a[];//操
 unsigned char const b[];//作
 unsigned char const c[];//错
 unsigned char const d[];//误 
 

 void AD_isr(void *temp,alt_u32 id) //中断服务程序
{
    //alt_irq_disable(DOUBLE_ADS805_0_IRQ);
    ADclear_IRQ;//clear irq
   
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
    alt_u8 key;//存储键值
    alt_u8 oldkey;// 存上一次循环的键值
    int cnt;//循环计数 
    
    int ifigdata[128];
    int ufigdata[128];//用于画图的数据点
    //int udatamax;
    //int idatamax;
    
    float  ixin[512];
    float uxin[512];//用于计算的数据点
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
   
   // char p[40],s[40],q[40],pf[40]，u[40],i[40];//有效值及功率显示字符串
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
    
    GUI_Initialize();//初始化液晶
     GUI_ClearSCR();//清屏
     welcom();
     usleep(2000000);//显示欢迎屏两秒钟
    AD_INITIAL();//AD初始化
    START_FREQ;
    key=0;
    oldkey=0x00;//初始键值
 
    ADstart;//启动AD
   
   while(1)
   {
    if(sem)
    {
        sem=0;
            
            ADstop; 
            ADread(readdata);//读取数值
            
            cut(readdata,udata,idata);//将电压电流数据分别剪切出来，待处理
            
      key=IORD(BUTTON_PIO_BASE,0);
      
      
      if(key^oldkey)
      {
         cnt=0;
        umax=imax=pmax=qmax=smax=0;
        umin=imin=pmin=qmin=smin=10000;     
      }//键值改变，计数值强制为零，最大值变量置零，最小值赋一个大值
      oldkey=key;
      //aa=0x02;
     //switch(aa)
      
     switch(key)
     {
 case 0x00:            //未操作
 
       GUI_ClearSCR();
        please();
             break;
        
        
 case 0x01:            //显示波形 
        
      /*  udatamax=udata[0];
        idatamax=idata[0];
        
        for(k=1;k<N+1,k++)
        {
            if(udata[k]>udatamax)
            {
                udatamax=udata[k];
            }
        }//找出最大值，以备调整显示大小
        
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
           ufigdata[n]=(int)(udata[m]*52/((float)udatamax)+2）;//电压幅值限制为52个像素点
           n++; 
        }*/
        
        if(cnt==0)
        {
            for(m=1;m<N+1;m=m+4)
        {
            ifigdata[n]=(int)(idata[m]*52*ADLSB+2);  //幅值限制，最下端离液晶边界两个像素点
            ufigdata[n]=(int)(udata[m]*52*ADLSB+2);
            n++;
        }
            GUI_ClearSCR();
            usleep(100000);//清屏后延时0.1秒
            
            showfig(ufigdata,ifigdata);//     调整暂留时间！！！！！！！！！！！！！！！
        }
        
        cnt++;
        if(cnt==20)//每刷新一次循环次数
        {
            cnt=0;
        }
        
         break;
         
        
 case 0x02:  //显示U,I,F
     for(k=0;k<N;k++)
   {
   ixin[k]=fi*idata[k+1]*ADLSB-adi;
   uxin[k]=fu*udata[k+1]*ADLSB-adu;
   }//转化成实际电压值1-5V
   
   uresult=UU(uxin);
   iresult=II(ixin);  //计算有效值
   
     findum(uresult,findumax,findumin);
   findim(iresult,findimax,findimin);//每观察一次都要更改最值，无论是否需要刷新
     
        
     if(cnt==0)
     {
       
      Ncheck=0;
   
   for(j=0;j<20;j++)
   {
    
    Ncheck+=IORD(FREQ_AVALON_0_BASE,0);
    
   }
   
   freq=FREQSYS/((float)Ncheck/20); //计算频率
   GUI_ClearSCR();
   showuif(uresult,iresult,umax,umin,imax,imin,freq);//调用显示
   
   
   
   }
   cnt++;
   
   if(cnt==10)
   {
    cnt=0;
   }
   
       
        
        break;
        
 case 0x04:            //显示P,Q,S,PF
 
    for(k=0;k<N;k++)
   {
   ixin[k]=fi*idata[k+1]*ADLSB-adi;
   uxin[k]=fu*udata[k+1]*ADLSB-adu;
   }//转化成实际电压值1-5V
   
    uresult=UU(uxin);
   iresult=II(ixin);  //计算有效值
   
    presult=PP(uxin,ixin);//有功功率
   sresult=uresult*iresult;//视在功率
   qresult=sqrt(fabs(pow(sresult,2)-pow(presult,2)));//无功功率
   pfresult=presult/sresult;
  findum(presult,findpmax,findpmin);
  findum(qresult,findqmax,findqmin);
  findum(sresult,findsmax,findsmin);//更改最值 
   
  if(cnt==0)
  {
    GUI_ClearSCR();
    
   showpqs(presult,qresult,sresult,pmax,pmin,qmax,qmin,smax,smin,pfresult);//调用显示
   
   
  }
  
  cnt++;
   
   if(cnt==20)
   {
    cnt=0;
   }
        
        break;
        
        case 0x08:            //显示电压谐波
      for(k=0;k<N;k++)
   {
   uxin[k]=fu*udata[k+1]*ADLSB-adu;//需要实际调参数
   }//转化成实际电压值1-5V   
        
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
    showfftu( ham,ffturesult);//分屏显示谐波
    
   }
    cnt++;
   
   if(cnt==15)
   {
    cnt=0;
   }
   
     
        
        
        break;
        
        case 0x10:            //显示电流谐波
   for(k=0;k<N;k++)
   {
   ixin[k]=fi*idata[k+1]*ADLSB-adi;
   }//转化成实际电压值1-5V   
        
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
    showffti( ham,fftiresult);//分屏显示谐波
    
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
    //错误操作提示
        
        break;
        
        }//switch
     
    ADstart;  //完成任务后再次启动
            
    }//if sem
     
   }//while
    
    
    
  }//main