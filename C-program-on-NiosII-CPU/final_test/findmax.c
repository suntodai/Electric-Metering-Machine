#include "findmax.h"

void findum(float uresult,float *findumax,float *findumin)//�����ѹ��Чֵ����ֵ
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

 void findim(float iresult,float *findimax,float*findimin)//���������Чֵ����ֵ
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
 
 void findpm(float presult,float *findpmax,float*findpmin)//����P��ֵ
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
 
 void findqm(float qresult,float *findqmax,float*findqmin)//����Q��ֵ
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
 
 void findsm(float sresult,float *findsmax,float*findsmin)//����S��ֵ
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
 
 
 
 