/****************************************************************************
* �ļ�����LCMDRV.C
* ���ܣ�CO0511FPD_SWEͼ��Һ��ģ����������ʹ��ALTERA DE2���GPIO�ڿ��Ʋ�����
*       ����ZLG/GUI�û�ͼ�ν��档
* Һ��ģ����DE2������������ʾ��
*	./CS    --  GPIO_1[10]  
*	./RST		--  GPIO_1[11] 		.
*	.A0		  --	GPIO_1[9]	.
*	.SCK		--  GPIO_1[12]		.
*	.SI   	--	GPIO_1[13]
*
*  ���ߣ�xiaofei
*  ���ڣ�2005/8/19
*  Last Modified : 
*  DATA:2007/8/27
*  FIX A BUG In LCM_DispFill BY xiaofei
****************************************************************************/
#include "lcm_config.h"

#define DATA_WIDTH  		8
#define LCM_STRPAGE		  0xb0    //��ʼҳ��ַ
#define LCM_XL4BIT			0x00		//�е�ַ����λ
#define LCM_XH4BIT			0x10   //�е�ַ����λ
#define LCM_STARTROW		0xc0	/* ��ʾ��ʼ��0��������LCM_STARTROW+y������ʼ�С�(y<64) 		*/
#define LCM_OFFSET 			0x04  //COO511FPD SWE 0-3 point is bad


/* ������ʾ������ */
TCOLOR  gui_disp_buf[GUI_LCM_YMAX/8][GUI_LCM_XMAX];
uint8 const  DEC_HEX_TAB1[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
//uint8 const  DEC_HEX_TAB1[8] = {0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01};

/***********************************************************************
* ���ƣ�LCM_WrCommand()
* ���ܣ�д�����ӳ���
* ��ڲ�����command  	Ҫд��LCM��������
* ע�����ݿ�ΪSI��(��IO��)
***********************************************************************/
void LCM_WrCommand(uint8 command) 
{ 
	uint8 i;
	LCD_CS_ASSERT; // �Ƚ�CS��Ϊ��				
	LCD_AO_LOW;		//CMD	
	for(i=0;i<DATA_WIDTH;i++)
	{
      LCD_SCK_LOW;
			if(command&DEC_HEX_TAB1[7-i])
			{
					LCD_SI_HIGH;
			}
			else
			{
					LCD_SI_LOW;
			}
		//	LCD_SCK_LOW;
			LCD_SCK_HIGH;
	}
	LCD_CS_DEASSERT; // ��CS��Ϊ��	
}
/***********************************************************************
* ���ƣ�LCM_WrData()
* ���ܣ�д�����ӳ���
* ��ڲ�����wrdata  	Ҫд��LCM������
***********************************************************************/
void LCM_WrData(uint8 wrdata) 
{ 
	uint8 i;
	LCD_CS_ASSERT; // �Ƚ�CS��Ϊ��				
	LCD_AO_HIGH;		//DATA
	for(i=0;i<DATA_WIDTH;i++)
	{
      LCD_SCK_LOW;
			if(wrdata&DEC_HEX_TAB1[7-i])
			{
					LCD_SI_HIGH;
			}
			else
			{
					LCD_SI_LOW;
			}
		//	LCD_SCK_LOW;
			LCD_SCK_HIGH;
	}    
	LCD_CS_DEASSERT; // ��CS��Ϊ��	        
}

/***********************************************************************
* ���ƣ�LCM_WriteByte()
* ���ܣ���ָ����д����(һ�ֽ�)��
* ��ڲ�����x 		x����ֵ(0-127)
*	    	y       y����ֵ(0-63)
*           wrdata	��Ҫд������
* ˵��������������CS1/CS2�������ڲ�ָ��
***********************************************************************/
void LCM_WriteByte(uint8 x, uint8 y, uint8 wrdata) 
{ 
	uint8 l4bit=0;
	uint8 h4bit=0;
	x = x&0x7f;				// ��������
  y = y&0x3f;

 
  
  //������ʾ������
  y = y>>3;//      ת��Ϊҳ��ַ
  gui_disp_buf[y][x] = wrdata;
   
  // ����LCD��ʾ
  				// ѡ��Һ������оƬ(��L4BIT����ǰ16���㣬H4BIT����128����)
  h4bit=(x+LCM_OFFSET)>>4;
  l4bit=(x+LCM_OFFSET)%16;  // ʲô��˼
  LCM_WrCommand(LCM_STRPAGE+y);	// ���õ�ǰҳ��ַ����x����
  LCM_WrCommand(LCM_XH4BIT+h4bit);	// ���õ�ǰ�е�ַ����y����
  LCM_WrCommand(LCM_XL4BIT+l4bit);

  LCM_WrData(wrdata);
}

/***********************************************************************
* ���ƣ�LCM_ReadByte()
* ���ܣ���ȡָ�����ϵ����ݡ�
* ��ڲ�����x 	  x����ֵ(0-127)
*	   	    y     y����ֵ(0-63)
* ���ڲ��������ظõ��ϵ��ֽ����ݡ�
***********************************************************************/
uint8  LCM_ReadByte(uint8 x, uint8 y)
{ x = x&0x7f;				// ��������
  y = y&0x3f;

  y = y>>3;
  return(gui_disp_buf[y][x]);
}
/***********************************************************************
* ���ƣ�LCM_DispFill()
* ���ܣ�����ʾ�������������
* ��ڲ�����filldata  	Ҫд��LCM���������
* ע���˺�����������ʾ��ʼ��Ϊ0���һ��Զ�ѡ��CS1��Ч
***********************************************************************/
void LCM_DispFill(uint8 filldata)
{ uint8  x,y;

  
	
  LCM_WrCommand(LCM_STARTROW);		// ������ʾ��ʼ��Ϊ0

  for(x=0; x<8; x++)
  { LCM_WrCommand(LCM_STRPAGE+x);	// ����ҳ��ַ����y
  	LCM_WrCommand(LCM_XH4BIT);	// ���õ�ǰ�е�ַ����x����
    LCM_WrCommand(LCM_XL4BIT);
   // for(y=0; y<64; y++)
   for(y=0;y<132;y++)
    { 
    	LCM_WrData(filldata);
		}	
  }

 
}
/***********************************************************************
* ���ƣ�LCM_DispIni()
* ���ܣ�LCM��ʾ��ʼ��
* ��ڲ�������
* ���ڲ�������
* ע��������ʾ��������������ʾ��ʼ��Ϊ0
*     �ḴλLCM_DISPCX��LCM_DISPCY.(����ֻѡ��CS1)
***********************************************************************/
void LCM_DispIni(void)
{ uint32  i;



  
  // ��λLCM
  LCD_RST_N_ASSERT;		
  for(i=0; i<5000; i++);
  LCD_RST_N_DEASSERT;  
  for(i=0; i<5000; i++); 
  LCM_WrCommand(0xaf);		//LCD On
	LCM_WrCommand(0x2f);
    		//�����ϵ����ģʽ
   //LCM_WrCommand(0x27);
	LCM_WrCommand(0x81);		//��������ģʽ����ʾ���ȣ�
	LCM_WrCommand(0x05);		//ָ������0x0000~0x003f     ԽСԽ�� 

	//LCM_WrCommand(0x25);		//V5�ڲ���ѹ���ڵ�������
	LCM_WrCommand(0xa3);		//LCDƫѹ���ã�V3ʱѡ

	LCM_WrCommand(0xc0);		//Com ɨ�跽ʽ���� �¶�Ϊ0
	LCM_WrCommand(0xa1);		//Segment����ѡ�� ���ҷ�ת  �������ò���
	LCM_WrCommand(0xa4);		//ȫ������                  /a5��ȫ����ʾ�޷���ʾ����
	LCM_WrCommand(0xa6);		//��������ʾ����ָ��/     / ���� 
	LCM_WrCommand(0xac);		//�رվ�ָ̬ʾ��
	LCM_WrCommand(0x00);		//ָ������               /����˸
	LCM_WrCommand(0x40);		//������ʾ��ʼ�ж�ӦRAM
	LCM_WrCommand(LCM_STRPAGE);	// ����ҳ��ַ����X	
  LCM_WrCommand(LCM_XH4BIT);	// ���õ�ǰ�е�ַ����y����
  LCM_WrCommand(LCM_XL4BIT);
}
/****************************************************************************
* ���ƣ�GUI_FillSCR()
* ���ܣ�ȫ����䡣ֱ��ʹ�����������ʾ��������
* ��ڲ�����dat		��������
* ���ڲ�������
* ˵�����û�����LCM��ʵ�������д�˺�����
****************************************************************************/
void  GUI_FillSCR(TCOLOR dat)
{  uint32 i,j;
  
   // ��仺����
   for(i=0; i<(GUI_LCM_YMAX/8); i++)
   {  for(j=0; j<GUI_LCM_XMAX; j++)
      {  gui_disp_buf[i][j] = dat;
      }
   }
   
   // ���LCM
   LCM_DispFill(dat);
}

/****************************************************************************
* ���ƣ�GUI_Initialize()
* ���ܣ���ʼ��GUI��������ʼ����ʾ����������ʼ��LCM��������
* ��ڲ�������
* ���ڲ�������
* ˵�����û�����LCM��ʵ�������д�˺�����
****************************************************************************/
void  GUI_Initialize(void)
{  LCM_DispIni();					// ��ʼ��LCMģ�鹤��ģʽ����ͼ��ģʽ
   GUI_FillSCR(0x00);				// ��ʼ��������Ϊ0x00���������Ļ(����)
}

/****************************************************************************
* ���ƣ�GUI_Point()
* ���ܣ���ָ��λ���ϻ��㡣
* ��ڲ�����x		ָ���������е�λ��
*           y		ָ���������е�λ��
*           color	��ʾ��ɫ(���ںڰ�ɫLCM��Ϊ0ʱ��Ϊ1ʱ��ʾ)
* ���ڲ���������ֵΪ1ʱ��ʾ�����ɹ���Ϊ0ʱ��ʾ����ʧ�ܡ�
* ˵��������ʧ��ԭ����ָ����ַ������������Χ��
****************************************************************************/
uint8  GUI_Point(uint8 x, uint8 y, TCOLOR color)
{  uint8   bak;
   
   // �������� 
   if(x>=GUI_LCM_XMAX) return(0);
   if(y>=GUI_LCM_YMAX) return(0);
   
   // ������Ӧ�ĵ�Ϊ1��0 
   bak = LCM_ReadByte(x,y);
   if(0==color)
   {  bak &= (~DEC_HEX_TAB1[y&0x07]);
   }
   else
   {  bak |= DEC_HEX_TAB1[y&0x07];
   }
  
   // ˢ����ʾ 
   LCM_WriteByte(x, y, bak);
   return(1);
}
/****************************************************************************
* ���ƣ�GUI_ReadPoint()
* ���ܣ���ȡָ�������ɫ��
* ��ڲ�����x		ָ���������е�λ��
*           y		ָ���������е�λ��
*           ret     ������ɫֵ��ָ��
* ���ڲ���������0��ʾָ����ַ������������Χ
* ˵�������ڵ�ɫ������ret��d0λΪ1��0��4���Ҷ���Ϊd0��d1��Ч��8λRGB��d0--d7��Ч��
*      RGB�ṹ��R��G��B������Ч��
****************************************************************************/
uint8  GUI_ReadPoint(uint8 x, uint8 y, TCOLOR *ret)
{  uint8  bak;

   // ��������
   if(x>=GUI_LCM_XMAX) return(0);
   if(y>=GUI_LCM_YMAX) return(0);
  
   bak = LCM_ReadByte(x,y);
   if( (bak & (DEC_HEX_TAB1[y&0x07])) == 0 ) *ret = 0x00;
     else  *ret = 0x01;
   
   return(1);
}


/****************************************************************************
* ���ƣ�GUI_HLine()
* ���ܣ���ˮƽ�ߡ�
* ��ڲ�����x0		ˮƽ����������е�λ��
*           y0		ˮƽ����������е�λ��
*           x1      ˮƽ���յ������е�λ��
*           color	��ʾ��ɫ(���ںڰ�ɫLCM��Ϊ0ʱ��Ϊ1ʱ��ʾ)
* ���ڲ�������
* ˵��������ʧ��ԭ����ָ����ַ������������Χ��
****************************************************************************/
void  GUI_HLine(uint8 x0, uint8 y0, uint8 x1, TCOLOR color) 
{  uint8  bak;

   if(x0>x1) 						// ��x0��x1��С�������У��Ա㻭ͼ
   {  bak = x1;
      x1 = x0;
      x0 = bak;
   }
   
   do
   {  GUI_Point(x0, y0, color);		// �����ʾ�������ֱ��
      x0++;
   }while(x1>=x0);
}


/***********************************************************************
* ���ƣ�GUI_RLine()
* ���ܣ�����ֱ�ߡ�����Ӳ���ص㣬ʵ�ּ��١�
* ��ڲ�����x0		��ֱ����������е�λ��
*           y0		��ֱ����������е�λ��
*           y1      ��ֱ���յ������е�λ��
*           color	��ʾ��ɫ(���ںڰ�ɫLCM��Ϊ0ʱ��Ϊ1ʱ��ʾ)
* ���ڲ�����	��
* ˵��������ʧ��ԭ����ָ����ַ������������Χ��
***********************************************************************/
void  GUI_RLine(uint8 x0, uint8 y0, uint8 y1, TCOLOR color) 
{  uint8  bak;
   uint8  wr_dat;
  
   if(y0>y1) 		// ��y0��y1��С�������У��Ա㻭ͼ
   {  bak = y1;
      y1 = y0;
      y0 = bak;
   }
   
   do
   {  // �ȶ�ȡ��ǰ����ֽ�����
      bak = LCM_ReadByte(x0,y0);	
      
      // ����'��'/'��'�����󣬽���ȷ������д��LCM
      // ��y0��y1����ͬһ�ֽڣ���y0--��ǰ�ֽڽ�������(y0+8)&0x38��ȫд1������0��
      // ��y0��y1��ͬһ�ֽڣ���y0--y1��Ҫȫд1������0��
      // ������dat=0xff��Ȼ��y0����dat��λ����y1�����λ��
      if((y0>>3) != (y1>>3))		// ��ֱ���Ƿ��Խ�����ֽ�(������)
      {  wr_dat = 0xFF << (y0&0x07);// ��0��λ
      
         if(color)					
         {  wr_dat = bak | wr_dat;	// ��color��Ϊ0������ʾ
         }
         else
         {  wr_dat = ~wr_dat;		// ��colorΪ0���������ʾ
            wr_dat = bak & wr_dat;
         }
         LCM_WriteByte(x0,y0, wr_dat);
         y0 = (y0+8)&0x38;
      }
      else
      {  wr_dat = 0xFF << (y0&0x07);
         wr_dat = wr_dat &  ( 0xFF >> (7-(y1&0x07)) );
              
         if(color)					
         {  wr_dat = bak | wr_dat;	// ��color��Ϊ0������ʾ
         }
         else
         {  wr_dat = ~wr_dat;		// ��colorΪ0���������ʾ
            wr_dat = bak & wr_dat;
         }
         LCM_WriteByte(x0,y0, wr_dat);
         return;
      } // end of if((y0>>3) != (y1>>3))... else...
   }while(y1>=y0);
   

}


				
  



/************************************************************************/