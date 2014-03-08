/****************************************************************************
* 文件名：LCMDRV.H
* 功能：CO0511FPD_SWE图形液晶模块驱动程序。使用NIOSII的GPIO_1口控制操作。(头文件)
*       用于ZLG/GUI用户图形界面。
*  
*  作者：xiaofei
*  日期：2007/8/19
****************************************************************************/
#ifndef  LCMDRV_H
#define  LCMDRV_H  

#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"

/* 定义颜色数据类型(可以是数据结构) */
#define  TCOLOR				uint8 

/* 定义LCM像素数宏 */
#define  GUI_LCM_XMAX		128							/* 定义液晶x轴的像素数 */
#define  GUI_LCM_YMAX		64							/* 定义液晶y轴的像素数 */

/******************************************************************
 * User should modify LCD_BASE  as the real base address of LCD core
 */

#ifndef LCD_CS_N_BASE              //modified by zsw 2006.3.20
#define LCD_CS_N_BASE  0xffffffff //define your base address of SPI core here
#endif
#if LCD_CS_N_BASE  == 0xffffffff
#error "No LCD_CS_N for LCD128_64.."
#endif

#ifndef LCD_RST_N_BASE              //modified by zsw 2006.3.20
#define LCD_RST_N_BASE  0xffffffff //define your base address of SPI core here
#endif
#if LCD_RST_N_BASE  == 0xffffffff
#error "No LCD_RST_N for LCD128_64.."
#endif

#ifndef LCD_AO_BASE              //modified by zsw 2006.3.20
#define LCD_AO_BASE  0xffffffff //define your base address of SPI core here
#endif
#if LCD_AO_BASE  == 0xffffffff
#error "No LCD_AO  for LCD128_64.."
#endif

#ifndef LCD_SCK_BASE              //modified by zsw 2006.3.20
#define LCD_SCK_BASE  0xffffffff //define your base address of SPI core here
#endif
#if LCD_SCK_BASE  == 0xffffffff
#error "No LCD_SCK for LCD128_64.."
#endif

#ifndef LCD_SI_BASE              //modified by zsw 2006.3.20
#define LCD_SI_BASE  0xffffffff //define your base address of SPI core here
#endif
#if LCD_SI_BASE  == 0xffffffff
#error "No LCD_SI for LCD128_64.."
#endif

#define LCD_CS_ASSERT     IOWR_ALTERA_AVALON_PIO_DATA(LCD_CS_N_BASE,0)
#define LCD_CS_DEASSERT   IOWR_ALTERA_AVALON_PIO_DATA(LCD_CS_N_BASE,1)

#define LCD_RST_N_ASSERT	IOWR_ALTERA_AVALON_PIO_DATA(LCD_RST_N_BASE,0)
#define LCD_RST_N_DEASSERT	IOWR_ALTERA_AVALON_PIO_DATA(LCD_RST_N_BASE,1)

#define	LCD_AO_LOW				IOWR_ALTERA_AVALON_PIO_DATA(LCD_AO_BASE,0)			//cmd
#define	LCD_AO_HIGH				IOWR_ALTERA_AVALON_PIO_DATA(LCD_AO_BASE,1)			//data
		
#define	LCD_SCK_LOW				IOWR_ALTERA_AVALON_PIO_DATA(LCD_SCK_BASE,0)			
#define	LCD_SCK_HIGH				IOWR_ALTERA_AVALON_PIO_DATA(LCD_SCK_BASE,1)
	
#define	LCD_SI_LOW				IOWR_ALTERA_AVALON_PIO_DATA(LCD_SI_BASE,0)			
#define	LCD_SI_HIGH				IOWR_ALTERA_AVALON_PIO_DATA(LCD_SI_BASE,1)	
/*
#if SD_CS_BASE == 0xffffffff
#error "No SD CS pio..."
#endif*/


/****************************************************************************
* 名称：GUI_Initialize()
* 功能：初始化GUI，包括初始化显示缓冲区，初始化LCM并清屏。
* 入口参数：无
* 出口参数：无
* 说明：用户根据LCM的实际情况编写此函数。
****************************************************************************/
extern void  GUI_Initialize(void);


/****************************************************************************
* 名称：GUI_FillSCR()
* 功能：全屏填充。直接使用数据填充显示缓冲区。
* 入口参数：dat		填充的数据
* 出口参数：无
* 说明：用户根据LCM的实际情况编写此函数。
****************************************************************************/
extern void  GUI_FillSCR(TCOLOR dat);


/****************************************************************************
* 名称：GUI_ClearSCR()
* 功能：清屏。
* 入口参数：无
* 出口参数：无
* 说明：用户根据LCM的实际情况编写此函数。
****************************************************************************/
//extern void  GUI_ClearSCR(void);
#define  GUI_ClearSCR()		GUI_FillSCR(0x00)


/****************************************************************************
* 名称：GUI_Point()
* 功能：在指定位置上画点。
* 入口参数： x		指定点所在列的位置
*            y		指定点所在行的位置
*            color	显示颜色(对于黑白色LCM，为0时灭，为1时显示)
* 出口参数：返回值为1时表示操作成功，为0时表示操作失败。(操作失败原因是指定地址超出有
*          效范围)
* 说明：用户根据LCM的实际情况编写此函数。
****************************************************************************/
extern uint8  GUI_Point(uint8 x, uint8 y, TCOLOR color);


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
extern uint8  GUI_ReadPoint(uint8 x, uint8 y, TCOLOR *ret);



/****************************************************************************
* 名称：GUI_HLine()
* 功能：画水平线。
* 入口参数： x0		水平线起点所在列的位置
*           y0		水平线起点所在行的位置
*           x1      水平线终点所在列的位置
*           color	显示颜色(对于黑白色LCM，为0时灭，为1时显示)
* 出口参数：无
* 说明：对于单色、4级灰度的液晶，可通过修改此函数作图提高速度，如单色LCM，可以一次更
*      新8个点，而不需要一个点一个点的写到LCM中。
****************************************************************************/
extern void  GUI_HLine(uint8 x0, uint8 y0, uint8 x1, TCOLOR color);



/****************************************************************************
* 名称：GUI_RLine()
* 功能：画垂直线。
* 入口参数： x0		垂直线起点所在列的位置
*           y0		垂直线起点所在行的位置
*           y1      垂直线终点所在行的位置
*           color	显示颜色
* 出口参数：无
* 说明：对于单色、4级灰度的液晶，可通过修改此函数作图提高速度，如单色LCM，可以一次更
*      新8个点，而不需要一个点一个点的写到LCM中。
****************************************************************************/
extern void  GUI_RLine(uint8 x0, uint8 y0, uint8 y1, TCOLOR color);




/****************************************************************************
* 名称：GUI_CmpColor()
* 功能：判断颜色值是否一致。
* 入口参数：color1		颜色值1
*		   color2		颜色值2
* 出口参数：返回1表示相同，返回0表示不相同。
* 说明：由于颜色类型TCOLOR可以是结构类型，所以需要用户编写比较函数。
****************************************************************************/
//extern int  GUI_CmpColor(TCOLOR color1, TCOLOR color2);
#define  GUI_CmpColor(color1, color2)	( (color1&0x01) == (color2&0x01) )

/****************************************************************************
* 名称：GUI_CopyColor()
* 功能：颜色值复制。
* 入口参数：color1		目标颜色变量
*		   color2		源颜色变量
* 出口参数：无
* 说明：由于颜色类型TCOLOR可以是结构类型，所以需要用户编写复制函数。
****************************************************************************/
//extern void  GUI_CopyColor(TCOLOR *color1, TCOLOR color2);
#define  GUI_CopyColor(color1, color2) 	*color1 = color2&0x01


#endif
