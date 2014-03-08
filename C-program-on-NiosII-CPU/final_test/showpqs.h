#ifndef SHOWPQS_H_
#define SHOWPQS_H_


#include "stdio.h"
#include "lcm_config.h"

void showpqs(float presult,float qresult,float sresult,float pmax,float pmin,float qmax,float qmin,float smax,float smin,float pfresult)
{  
    char p[40],q[40],s[40],pm[40],pi[40],qm[40],qi[40],sm[40],si[40],pf[40]; 
    
    GUI_PutChar(0,0,'P');
     GUI_PutChar(6,0,'=');
    GUI_PutChar(64,0,'Q');
    GUI_PutChar(70,0,'=');
    GUI_PutChar(0,10,'S');
    GUI_PutChar(6,10,'=');
    GUI_PutChar(64,10,'P');
    GUI_PutChar(72,10,'F');
    GUI_PutChar(78,10,'=');
    
    GUI_HLine(0,19,127,1);
    GUI_PutChar(30,22,'m');
    GUI_PutChar(36,22,'a');
    GUI_PutChar(42,22,'x');
    
    
    GUI_PutChar(94,22,'m');
    GUI_PutChar(100,22,'i');
    GUI_PutChar(106,22,'n');
   
    
    
    GUI_PutChar(0,32,'P');
    GUI_PutChar(6,32,':');
   
    GUI_PutChar(0,43,'Q');
    GUI_PutChar(6,43,':');
    
    GUI_PutChar(0,54,'S');
    GUI_PutChar(6,54,':');//画出各表头
    
  sprintf(p,"%.2fkw",presult*9);
     GUI_PutString(13,0,p);
    sprintf(q,"%.2fkvar",qresult*9);
    GUI_PutString(77,0,q);  
    
    sprintf(s,"%.2fkVA",sresult*9);
     GUI_PutString(13,10,s);
    sprintf(pf,"%.2f",pfresult);
     GUI_PutString(84,10,pf);
     
     sprintf(pm,"%.2fkw",pmax*9);
     GUI_PutString(13,32,pm);
     
     sprintf(pi,"%.2fkw",pmin*9);
     GUI_PutString(73,32,pi);
     
     sprintf(qm,"%.2fkvar",qmax*9);
     GUI_PutString(13,43,qm);
     
     sprintf(qi,"%.2fkvar",qmin*9);
     GUI_PutString(73,43,qi);
     
     sprintf(sm,"%.2fkVA",smax*9);
     GUI_PutString(13,54,sm);
     
     sprintf(si,"%.2fkVA",smin*9);
     GUI_PutString(73,54,si);
     
     
}


#endif /*SHOWPQS_H_*/
