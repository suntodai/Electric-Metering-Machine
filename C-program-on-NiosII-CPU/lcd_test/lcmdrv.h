/****************************************************************************
* �ļ�����LCMDRV.H
* ���ܣ�CO0511FPD_SWEͼ��Һ��ģ����������ʹ��NIOSII��GPIO_1�ڿ��Ʋ�����(ͷ�ļ�)
*       ����ZLG/GUI�û�ͼ�ν��档
*  
*  ���ߣ�xiaofei
*  ���ڣ�2007/8/19
****************************************************************************/
#ifndef  LCMDRV_H
#define  LCMDRV_H  

#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"

/* ������ɫ��������(���������ݽṹ) */
#define  TCOLOR				uint8 

/* ����LCM�������� */
#define  GUI_LCM_XMAX		128							/* ����Һ��x��������� */
#define  GUI_LCM_YMAX		64							/* ����Һ��y��������� */

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
* ���ƣ�GUI_Initialize()
* ���ܣ���ʼ��GUI��������ʼ����ʾ����������ʼ��LCM��������
* ��ڲ�������
* ���ڲ�������
* ˵�����û�����LCM��ʵ�������д�˺�����
****************************************************************************/
extern void  GUI_Initialize(void);


/****************************************************************************
* ���ƣ�GUI_FillSCR()
* ���ܣ�ȫ����䡣ֱ��ʹ�����������ʾ��������
* ��ڲ�����dat		��������
* ���ڲ�������
* ˵�����û�����LCM��ʵ�������д�˺�����
****************************************************************************/
extern void  GUI_FillSCR(TCOLOR dat);


/****************************************************************************
* ���ƣ�GUI_ClearSCR()
* ���ܣ�������
* ��ڲ�������
* ���ڲ�������
* ˵�����û�����LCM��ʵ�������д�˺�����
****************************************************************************/
//extern void  GUI_ClearSCR(void);
#define  GUI_ClearSCR()		GUI_FillSCR(0x00)


/****************************************************************************
* ���ƣ�GUI_Point()
* ���ܣ���ָ��λ���ϻ��㡣
* ��ڲ����� x		ָ���������е�λ��
*            y		ָ���������е�λ��
*            color	��ʾ��ɫ(���ںڰ�ɫLCM��Ϊ0ʱ��Ϊ1ʱ��ʾ)
* ���ڲ���������ֵΪ1ʱ��ʾ�����ɹ���Ϊ0ʱ��ʾ����ʧ�ܡ�(����ʧ��ԭ����ָ����ַ������
*          Ч��Χ)
* ˵�����û�����LCM��ʵ�������д�˺�����
****************************************************************************/
extern uint8  GUI_Point(uint8 x, uint8 y, TCOLOR color);


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
extern uint8  GUI_ReadPoint(uint8 x, uint8 y, TCOLOR *ret);



/****************************************************************************
* ���ƣ�GUI_HLine()
* ���ܣ���ˮƽ�ߡ�
* ��ڲ����� x0		ˮƽ����������е�λ��
*           y0		ˮƽ����������е�λ��
*           x1      ˮƽ���յ������е�λ��
*           color	��ʾ��ɫ(���ںڰ�ɫLCM��Ϊ0ʱ��Ϊ1ʱ��ʾ)
* ���ڲ�������
* ˵�������ڵ�ɫ��4���Ҷȵ�Һ������ͨ���޸Ĵ˺�����ͼ����ٶȣ��絥ɫLCM������һ�θ�
*      ��8���㣬������Ҫһ����һ�����д��LCM�С�
****************************************************************************/
extern void  GUI_HLine(uint8 x0, uint8 y0, uint8 x1, TCOLOR color);



/****************************************************************************
* ���ƣ�GUI_RLine()
* ���ܣ�����ֱ�ߡ�
* ��ڲ����� x0		��ֱ����������е�λ��
*           y0		��ֱ����������е�λ��
*           y1      ��ֱ���յ������е�λ��
*           color	��ʾ��ɫ
* ���ڲ�������
* ˵�������ڵ�ɫ��4���Ҷȵ�Һ������ͨ���޸Ĵ˺�����ͼ����ٶȣ��絥ɫLCM������һ�θ�
*      ��8���㣬������Ҫһ����һ�����д��LCM�С�
****************************************************************************/
extern void  GUI_RLine(uint8 x0, uint8 y0, uint8 y1, TCOLOR color);




/****************************************************************************
* ���ƣ�GUI_CmpColor()
* ���ܣ��ж���ɫֵ�Ƿ�һ�¡�
* ��ڲ�����color1		��ɫֵ1
*		   color2		��ɫֵ2
* ���ڲ���������1��ʾ��ͬ������0��ʾ����ͬ��
* ˵����������ɫ����TCOLOR�����ǽṹ���ͣ�������Ҫ�û���д�ȽϺ�����
****************************************************************************/
//extern int  GUI_CmpColor(TCOLOR color1, TCOLOR color2);
#define  GUI_CmpColor(color1, color2)	( (color1&0x01) == (color2&0x01) )

/****************************************************************************
* ���ƣ�GUI_CopyColor()
* ���ܣ���ɫֵ���ơ�
* ��ڲ�����color1		Ŀ����ɫ����
*		   color2		Դ��ɫ����
* ���ڲ�������
* ˵����������ɫ����TCOLOR�����ǽṹ���ͣ�������Ҫ�û���д���ƺ�����
****************************************************************************/
//extern void  GUI_CopyColor(TCOLOR *color1, TCOLOR color2);
#define  GUI_CopyColor(color1, color2) 	*color1 = color2&0x01


#endif
