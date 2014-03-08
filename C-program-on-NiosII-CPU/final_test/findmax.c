#include "findmax.h"

void findum(float uresult,float *findumax,float *findumin)//计算电压有效值的最值
{
    if(uresult>*findumax)
    {
        *findumax=uresult;
    }
    if(uresult<*findumin)
    {
        *findumin=uresult;
    }
}

 void findim(float iresult,float *findimax,float*findimin)//计算电流有效值的最值
 {
    if(iresult>*findimax)
    {
        *findimax=iresult;
    }
    if(iresult<*findimin)
    {
        *findimin=iresult;
    }
 }
 
 void findpm(float presult,float *findpmax,float*findpmin)//计算P最值
 {
    if(presult>*findpmax)
    {
        *findpmax=presult;
    }
    if(presult<*findpmin)
    {
        *findpmin=presult;
    }
 }
 
 void findqm(float qresult,float *findqmax,float*findqmin)//计算Q最值
 {
    if(qresult>*findqmax)
    {
        *findqmax=qresult;
    }
    if(qresult<*findqmin)
    {
        *findqmin=qresult;
    }
 }
 
 void findsm(float sresult,float *findsmax,float*findsmin)//计算S最值
 {
    if(sresult>*findsmax)
    {
        *findsmax=sresult;
    }
    if(sresult<*findsmin)
    {
        *findsmin=sresult;
    }
 }
 
 
 
 