#line 1 "C:/Users/beast/OneDrive/Masaüstü/45k/fortyfiveK.c"
unsigned short Temp_Ref;
unsigned char temp_glcd;
char ref_temp[]="26";
int temperature_reference,temperature_value;
int ActualTemp;
unsigned int temp;
float mV;
unsigned short Txt[14];
unsigned short txt2[14];
unsigned short day[]="Tuesday";
char time[15];
char date[16];
unsigned int ADCResult=0;
float pressure;

sbit LCD_EN at RC1_bit;
sbit LCD_RS at RC0_bit;
sbit LCD_D4 at RC2_bit;
sbit LCD_D5 at RD0_bit;
sbit LCD_D6 at RA5_bit;
sbit LCD_D7 at RC5_bit;

sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_D4_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISD0_bit;
sbit LCD_D6_Direction at TRISA5_bit;
sbit LCD_D7_Direction at TRISC5_bit;
#line 69 "C:/Users/beast/OneDrive/Masaüstü/45k/fortyfiveK.c"
 void heater()
 {
 PWM4_Init(1000);
 PWM4_Start();
 PWM4_Set_Duty(90);
 PORTB.RB6 = 0;
 PORTB.RB1 = 1;
 Delay_MS(1500);
 PORTB.RB6 = 0;
 PORTB.RB1 = 0;
 PWM4_Stop();
 }

 void cooler()
 {
 PWM3_Init(1000);
 PWM3_Start();
 PWM3_Set_Duty(90);
 PORTB.RB2 = 0;
 PORTB.RB4 = 1;
 Delay_MS(1500);
 PORTB.RB2 = 0;
 PORTB.RB4 = 0;
 PWM3_Stop();
 }
 fan_stop()
 {
 PWM3_Stop();
 PWM4_Stop();
 }
void main() {
ANSELC = 0;
ANSELA = 0;
ANSELD = 0;

TRISA = 0X07;
PORTA = 0X00;
TRISA.RA2=0;
TRISA.RA3=0;
TRISB = 0B00000001;
PORTB = 0X00;
TRISC.RC3=0;
TRISC.RC4 =0;

ADC_Init();
TRISD2_bit = 1;
TRISB = 0X00;
TRISD = 0B11110100;

Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);


INT0IF_bit=0;
INT0IE_bit=1;
GIE_bit=1;
INTEDG0_bit = 1;
OSCCON = 0X76;

 while(1)
 {

 Lcd_Out(1,1,"Elevator Information");
 ADCResult = ADC_Read(0);
 pressure = (ADCResult*5.0)/1024.0;
 pressure = (pressure + 0.475)/0.0475+4.0;
 FloatToStr(pressure, txt2);

 temp = ADC_Read(22);
 mV = temp*5000.0/1024.0;
 actualTemp = (mV/10.0)+7.6;
 IntToStr(actualTemp,Txt);

 Lcd_Out(2,1,"Temperature");
 Lcd_Out(2,12,Txt);
 Lcd_Out(3,1,"Pressure :");
 Lcd_Out(3,12,txt2);
 Lcd_Out(4,1,"Day :");
 Lcd_Out(4,7,day);

 Delay_MS(1500);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,"       WELCOME");
 Lcd_Out(2,1,"       THE");
 Lcd_Out(3,1,"       TOZ");
 Lcd_Out(4,1,"       COMPANY");
 Delay_MS(1500);

 if(PORTD.RD4==1)
 {
 PORTA.RA2 =1;
 PORTA.RA3 =0;
 }
 else if(PORTD.RD4==0)
 {
 PORTA.RA3 =1;
 PORTA.RA2 =0;
 }


 if(PORTD.RD7 == 1)
 {
 PORTB.RB3=1;
 if(actualTemp>26.5)
 {
 PWM3_Init(1000);
 PWM3_Start();
 PWM3_Set_Duty(90);
 PORTB.RB2 = 0;
 PORTB.RB4 = 1;
 Delay_MS(1500);
 PORTB.RB2 = 0;
 PORTB.RB4 = 0;
 PWM3_Stop();
 }
 else if(actualTemp<25.5)
 {
 PWM4_Init(1000);
 PWM4_Start();
 PWM4_Set_Duty(90);
 PORTB.RB6 = 0;
 PORTB.RB1 = 1;
 Delay_MS(1500);
 PORTB.RB6 = 0;
 PORTB.RB1 = 0;
 PWM4_Stop();
 }
 else
 {
 PORTB.RB6 = 0;
 PORTB.RB1 = 0;
 PORTB.RB2 = 0;
 PORTB.RB4 = 0;
 }
 }
 else if(PORTD.RD7 == 0)
 {
 PORTB.RB3=1;
 PORTB.RB6 = 0;
 PORTB.RB1 = 0;
 PORTB.RB2 = 0;
 PORTB.RB4 = 0 ;
 }

 }

}
