/****************************************************************************
* 文件名：LCMDRV.C
* 功能：CO0511FPD_SWE图形液晶模块驱动程序。使用ALTERA DE2板的GPIO口控制操作。
*       用于ZLG/GUI用户图形界面。
* 液晶模块与DE2的连接如下所示：
*	./CS    --  GPIO_1[10]  
*	./RST		--  GPIO_1[11] 		.
*	.A0		  --	GPIO_1[9]	.
*	.SCK		--  GPIO_1[12]		.
*	.SI   	--	GPIO_1[13]
*
*  作者：xiaofei
*  日期：2005/8/19
*  Last Modified : 
*  DATA:2007/8/27
*  FIX A BUG In LCM_DispFill BY xiaofei
****************************************************************************/
#include "lcm_config.h"

#define DATA_WIDTH  		8
#define LCM_STRPAGE		  0xb0    //起始页地址
#define LCM_XL4BIT			0x00		//列地址低四位
#define LCM_XH4BIT			0x10   //列地址高四位
#define LCM_STARTROW		0xc0	/* 显示起始行0，可以用LCM_STARTROW+y设置起始行。(y<64) 		*/
#define LCM_OFFSET 			0x04  //COO511FPD SWE 0-3 point is bad


/* 定义显示缓冲区 */
TCOLOR  gui_disp_buf[GUI_LCM_YMAX/8][GUI_LCM_XMAX];
uint8 const  DEC_HEX_TAB1[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
//uint8 const  DEC_HEX_TAB1[8] = {0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01};

/***********************************************************************
* 名称：LCM_WrCommand()
* 功能：写命令子程序
* 入口参数：command  	要写入LCM的命令字
* 注：数据口为SI口(作IO口)
***********************************************************************/
void LCM_WrCommand(uint8 command) 
{ 
	uint8 i;
	LCD_CS_ASSERT; // 先将CS置为低				
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
	LCD_CS_DEASSERT; // 将CS置为高	
}
/***********************************************************************
* 名称：LCM_WrData()
* 功能：写数据子程序
* 入口参数：wrdata  	要写入LCM的数据
***********************************************************************/
void LCM_WrData(uint8 wrdata) 
{ 
	uint8 i;
	LCD_CS_ASSERT; // 先将CS置为低				
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
	LCD_CS_DEASSERT; // 将CS置为高	        
}

/***********************************************************************
* 名称：LCM_WriteByte()
* 功能：向指定点写数据(一字节)。
* 入口参数：x 		x坐标值(0-127)
*	    	y       y坐标值(0-63)
*           wrdata	所要写的数据
* 说明：会重新设置CS1/CS2，及其内部指针
***********************************************************************/
void LCM_WriteByte(uint8 x, uint8 y, uint8 wrdata) 
{ 
	uint8 l4bit=0;
	uint8 h4bit=0;
	x = x&0x7f;				// 参数过滤
  y = y&0x3f;

 
  
  //更新显示缓冲区
  y = y>>3;//      转化为页地址
  gui_disp_buf[y][x] = wrdata;
   
  // 更新LCD显示
  				// 选择液晶控制芯片(即L4BIT控制前16个点，H4BIT控制128个点)
  h4bit=(x+LCM_OFFSET)>>4;
  l4bit=(x+LCM_OFFSET)%16;  // 什么意思
  LCM_WrCommand(LCM_STRPAGE+y);	// 设置当前页地址，即x坐标
  LCM_WrCommand(LCM_XH4BIT+h4bit);	// 设置当前列地址，即y坐标
  LCM_WrCommand(LCM_XL4BIT+l4bit);

  LCM_WrData(wrdata);
}

/***********************************************************************
* 名称：LCM_ReadByte()
* 功能：读取指定点上的数据。
* 入口参数：x 	  x坐标值(0-127)
*	   	    y     y坐标值(0-63)
* 出口参数：返回该点上的字节数据。
***********************************************************************/
uint8  LCM_ReadByte(uint8 x, uint8 y)
{ x = x&0x7f;				// 参数过滤
  y = y&0x3f;

  y = y>>3;
  return(gui_disp_buf[y][x]);
}
/***********************************************************************
* 名称：LCM_DispFill()
* 功能：向显示缓冲区填充数据
* 入口参数：filldata  	要写入LCM的填充数据
* 注：此函数会设置显示起始行为0，且会自动选中CS1有效
***********************************************************************/
void LCM_DispFill(uint8 filldata)
{ uint8  x,y;

  
	
  LCM_WrCommand(LCM_STARTROW);		// 设置显示起始行为0

  for(x=0; x<8; x++)
  { LCM_WrCommand(LCM_STRPAGE+x);	// 设置页地址，即y
  	LCM_WrCommand(LCM_XH4BIT);	// 设置当前列地址，即x坐标
    LCM_WrCommand(LCM_XL4BIT);
   // for(y=0; y<64; y++)
   for(y=0;y<132;y++)
    { 
    	LCM_WrData(filldata);
		}	
  }

 
}
/***********************************************************************
* 名称：LCM_DispIni()
* 功能：LCM显示初始化
* 入口参数：无
* 出口参数：无
* 注：初化显示后，清屏并设置显示起始行为0
*     会复位LCM_DISPCX，LCM_DISPCY.(并会只选中CS1)
***********************************************************************/
void LCM_DispIni(void)
{ uint32  i;



  
  // 复位LCM
  LCD_RST_N_ASSERT;		
  for(i=0; i<5000; i++);
  LCD_RST_N_DEASSERT;  
  for(i=0; i<5000; i++); 
  LCM_WrCommand(0xaf);		//LCD On
	LCM_WrCommand(0x2f);
    		//设置上电控制模式
   //LCM_WrCommand(0x27);
	LCM_WrCommand(0x81);		//电量设置模式（显示亮度）
	LCM_WrCommand(0x05);		//指令数据0x0000~0x003f     越小越亮 

	//LCM_WrCommand(0x25);		//V5内部电压调节电阻设置
	LCM_WrCommand(0xa3);		//LCD偏压设置，V3时选

	LCM_WrCommand(0xc0);		//Com 扫描方式设置 下端为0
	LCM_WrCommand(0xa1);		//Segment方向选择 左右反转  后四列用不上
	LCM_WrCommand(0xa4);		//全屏点亮                  /a5将全屏显示无法显示其他
	LCM_WrCommand(0xa6);		//正向反向显示控制指令/     / 正向 
	LCM_WrCommand(0xac);		//关闭静态指示器
	LCM_WrCommand(0x00);		//指令数据               /不闪烁
	LCM_WrCommand(0x40);		//设置显示起始行对应RAM
	LCM_WrCommand(LCM_STRPAGE);	// 设置页地址，即X	
  LCM_WrCommand(LCM_XH4BIT);	// 设置当前列地址，即y坐标
  LCM_WrCommand(LCM_XL4BIT);
}
/****************************************************************************
* 名称：GUI_FillSCR()
* 功能：全屏填充。直接使用数据填充显示缓冲区。
* 入口参数：dat		填充的数据
* 出口参数：无
* 说明：用户根据LCM的实际情况编写此函数。
****************************************************************************/
void  GUI_FillSCR(TCOLOR dat)
{  uint32 i,j;
  
   // 填充缓冲区
   for(i=0; i<(GUI_LCM_YMAX/8); i++)
   {  for(j=0; j<GUI_LCM_XMAX; j++)
      {  gui_disp_buf[i][j] = dat;
      }
   }
   
   // 填充LCM
   LCM_DispFill(dat);
}

/****************************************************************************
* 名称：GUI_Initialize()
* 功能：初始化GUI，包括初始化显示缓冲区，初始化LCM并清屏。
* 入口参数：无
* 出口参数：无
* 说明：用户根据LCM的实际情况编写此函数。
****************************************************************************/
void  GUI_Initialize(void)
{  LCM_DispIni();					// 初始化LCM模块工作模式，纯图形模式
   GUI_FillSCR(0x00);				// 初始化缓冲区为0x00，并输出屏幕(清屏)
}

/****************************************************************************
* 名称：GUI_Point()
* 功能：在指定位置上画点。
* 入口参数：x		指定点所在列的位置
*           y		指定点所在行的位置
*           color	显示颜色(对于黑白色LCM，为0时灭，为1时显示)
* 出口参数：返回值为1时表示操作成功，为0时表示操作失败。
* 说明：操作失败原因是指定地址超出缓冲区范围。
****************************************************************************/
uint8  GUI_Point(uint8 x, uint8 y, TCOLOR color)
{  uint8   bak;
   
   // 参数过滤 
   if(x>=GUI_LCM_XMAX) return(0);
   if(y>=GUI_LCM_YMAX) return(0);
   
   // 设置相应的点为1或0 
   bak = LCM_ReadByte(x,y);
   if(0==color)
   {  bak &= (~DEC_HEX_TAB1[y&0x07]);
   }
   else
   {  bak |= DEC_HEX_TAB1[y&0x07];
   }
  
   // 刷新显示 
   LCM_WriteByte(x, y, bak);
   return(1);
}
/****************************************************************************
* 名称：GUI_ReadPoint()
* 功能：读取指定点的颜色。
* 入口参数：x		指定点所在列的位置
*           y		指定点所在行的位置
*           ret     保存颜色值的指针
* 出口参数：返回0表示指定地址超出缓冲区范围
* 说明：对于单色，设置ret的d0位为1或0，4级灰度则为d0、d1有效，8位RGB则d0--d7有效，
*      RGB结构则R、G、B变量有效。
****************************************************************************/
uint8  GUI_ReadPoint(uint8 x, uint8 y, TCOLOR *ret)
{  uint8  bak;

   // 参数过滤
   if(x>=GUI_LCM_XMAX) return(0);
   if(y>=GUI_LCM_YMAX) return(0);
  
   bak = LCM_ReadByte(x,y);
   if( (bak & (DEC_HEX_TAB1[y&0x07])) == 0 ) *ret = 0x00;
     else  *ret = 0x01;
   
   return(1);
}


/****************************************************************************
* 名称：GUI_HLine()
* 功能：画水平线。
* 入口参数：x0		水平线起点所在列的位置
*           y0		水平线起点所在行的位置
*           x1      水平线终点所在列的位置
*           color	显示颜色(对于黑白色LCM，为0时灭，为1时显示)
* 出口参数：无
* 说明：操作失败原因是指定地址超出缓冲区范围。
****************************************************************************/
void  GUI_HLine(uint8 x0, uint8 y0, uint8 x1, TCOLOR color) 
{  uint8  bak;

   if(x0>x1) 						// 对x0、x1大小进行排列，以便画图
   {  bak = x1;
      x1 = x0;
      x0 = bak;
   }
   
   do
   {  GUI_Point(x0, y0, color);		// 逐点显示，描出垂直线
      x0++;
   }while(x1>=x0);
}


/***********************************************************************
* 名称：GUI_RLine()
* 功能：画竖直线。根据硬件特点，实现加速。
* 入口参数：x0		垂直线起点所在列的位置
*           y0		垂直线起点所在行的位置
*           y1      垂直线终点所在行的位置
*           color	显示颜色(对于黑白色LCM，为0时灭，为1时显示)
* 出口参数：	无
* 说明：操作失败原因是指定地址超出缓冲区范围。
***********************************************************************/
void  GUI_RLine(uint8 x0, uint8 y0, uint8 y1, TCOLOR color) 
{  uint8  bak;
   uint8  wr_dat;
  
   if(y0>y1) 		// 对y0、y1大小进行排列，以便画图
   {  bak = y1;
      y1 = y0;
      y0 = bak;
   }
   
   do
   {  // 先读取当前点的字节数据
      bak = LCM_ReadByte(x0,y0);	
      
      // 进行'与'/'或'操作后，将正确的数据写回LCM
      // 若y0和y1不是同一字节，则y0--当前字节结束，即(y0+8)&0x38，全写1，或者0。
      // 若y0和y1是同一字节，则y0--y1，要全写1，或者0。
      // 方法：dat=0xff，然后按y0清零dat低位，按y1清零高位。
      if((y0>>3) != (y1>>3))		// 竖直线是否跨越两个字节(或以上)
      {  wr_dat = 0xFF << (y0&0x07);// 清0低位
      
         if(color)					
         {  wr_dat = bak | wr_dat;	// 若color不为0，则显示
         }
         else
         {  wr_dat = ~wr_dat;		// 若color为0，则清除显示
            wr_dat = bak & wr_dat;
         }
         LCM_WriteByte(x0,y0, wr_dat);
         y0 = (y0+8)&0x38;
      }
      else
      {  wr_dat = 0xFF << (y0&0x07);
         wr_dat = wr_dat &  ( 0xFF >> (7-(y1&0x07)) );
              
         if(color)					
         {  wr_dat = bak | wr_dat;	// 若color不为0，则显示
         }
         else
         {  wr_dat = ~wr_dat;		// 若color为0，则清除显示
            wr_dat = bak & wr_dat;
         }
         LCM_WriteByte(x0,y0, wr_dat);
         return;
      } // end of if((y0>>3) != (y1>>3))... else...
   }while(y1>=y0);
   

}


				
  



/************************************************************************/