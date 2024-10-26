
_heater:

;fortyfiveK.c,69 :: 		void heater()
;fortyfiveK.c,71 :: 		PWM4_Init(1000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       124
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;fortyfiveK.c,72 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;fortyfiveK.c,73 :: 		PWM4_Set_Duty(90);
	MOVLW       90
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;fortyfiveK.c,74 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;fortyfiveK.c,75 :: 		PORTB.RB1 = 1;
	BSF         PORTB+0, 1 
;fortyfiveK.c,76 :: 		Delay_MS(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_heater0:
	DECFSZ      R13, 1, 1
	BRA         L_heater0
	DECFSZ      R12, 1, 1
	BRA         L_heater0
	DECFSZ      R11, 1, 1
	BRA         L_heater0
	NOP
	NOP
;fortyfiveK.c,77 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;fortyfiveK.c,78 :: 		PORTB.RB1 = 0;
	BCF         PORTB+0, 1 
;fortyfiveK.c,79 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;fortyfiveK.c,80 :: 		}
L_end_heater:
	RETURN      0
; end of _heater

_cooler:

;fortyfiveK.c,82 :: 		void cooler()
;fortyfiveK.c,84 :: 		PWM3_Init(1000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       124
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;fortyfiveK.c,85 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;fortyfiveK.c,86 :: 		PWM3_Set_Duty(90);
	MOVLW       90
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;fortyfiveK.c,87 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;fortyfiveK.c,88 :: 		PORTB.RB4 = 1;
	BSF         PORTB+0, 4 
;fortyfiveK.c,89 :: 		Delay_MS(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_cooler1:
	DECFSZ      R13, 1, 1
	BRA         L_cooler1
	DECFSZ      R12, 1, 1
	BRA         L_cooler1
	DECFSZ      R11, 1, 1
	BRA         L_cooler1
	NOP
	NOP
;fortyfiveK.c,90 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;fortyfiveK.c,91 :: 		PORTB.RB4 = 0;
	BCF         PORTB+0, 4 
;fortyfiveK.c,92 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;fortyfiveK.c,93 :: 		}
L_end_cooler:
	RETURN      0
; end of _cooler

_fan_stop:

;fortyfiveK.c,94 :: 		fan_stop()
;fortyfiveK.c,96 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;fortyfiveK.c,97 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;fortyfiveK.c,98 :: 		}
L_end_fan_stop:
	RETURN      0
; end of _fan_stop

_main:

;fortyfiveK.c,99 :: 		void main() {
;fortyfiveK.c,100 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;fortyfiveK.c,101 :: 		ANSELA = 0;
	CLRF        ANSELA+0 
;fortyfiveK.c,102 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;fortyfiveK.c,104 :: 		TRISA = 0X07;
	MOVLW       7
	MOVWF       TRISA+0 
;fortyfiveK.c,105 :: 		PORTA = 0X00;
	CLRF        PORTA+0 
;fortyfiveK.c,106 :: 		TRISA.RA2=0;
	BCF         TRISA+0, 2 
;fortyfiveK.c,107 :: 		TRISA.RA3=0;
	BCF         TRISA+0, 3 
;fortyfiveK.c,108 :: 		TRISB = 0B00000001;
	MOVLW       1
	MOVWF       TRISB+0 
;fortyfiveK.c,109 :: 		PORTB = 0X00;
	CLRF        PORTB+0 
;fortyfiveK.c,110 :: 		TRISC.RC3=0;
	BCF         TRISC+0, 3 
;fortyfiveK.c,111 :: 		TRISC.RC4 =0;
	BCF         TRISC+0, 4 
;fortyfiveK.c,113 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;fortyfiveK.c,114 :: 		TRISD2_bit = 1;
	BSF         TRISD2_bit+0, BitPos(TRISD2_bit+0) 
;fortyfiveK.c,115 :: 		TRISB = 0X00;
	CLRF        TRISB+0 
;fortyfiveK.c,116 :: 		TRISD = 0B11110100;
	MOVLW       244
	MOVWF       TRISD+0 
;fortyfiveK.c,118 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;fortyfiveK.c,119 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;fortyfiveK.c,120 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;fortyfiveK.c,123 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;fortyfiveK.c,124 :: 		INT0IE_bit=1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;fortyfiveK.c,125 :: 		GIE_bit=1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;fortyfiveK.c,126 :: 		INTEDG0_bit = 1;
	BSF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;fortyfiveK.c,127 :: 		OSCCON = 0X76;
	MOVLW       118
	MOVWF       OSCCON+0 
;fortyfiveK.c,129 :: 		while(1)
L_main2:
;fortyfiveK.c,132 :: 		Lcd_Out(1,1,"Elevator Information");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_fortyfiveK+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_fortyfiveK+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,133 :: 		ADCResult = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ADCResult+0 
	MOVF        R1, 0 
	MOVWF       _ADCResult+1 
;fortyfiveK.c,134 :: 		pressure = (ADCResult*5.0)/1024.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _pressure+0 
	MOVF        R1, 0 
	MOVWF       _pressure+1 
	MOVF        R2, 0 
	MOVWF       _pressure+2 
	MOVF        R3, 0 
	MOVWF       _pressure+3 
;fortyfiveK.c,135 :: 		pressure = (pressure + 0.475)/0.0475+4.0;
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       115
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       92
	MOVWF       R4 
	MOVLW       143
	MOVWF       R5 
	MOVLW       66
	MOVWF       R6 
	MOVLW       122
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _pressure+0 
	MOVF        R1, 0 
	MOVWF       _pressure+1 
	MOVF        R2, 0 
	MOVWF       _pressure+2 
	MOVF        R3, 0 
	MOVWF       _pressure+3 
;fortyfiveK.c,136 :: 		FloatToStr(pressure, txt2);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt2+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;fortyfiveK.c,138 :: 		temp = ADC_Read(22);
	MOVLW       22
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
;fortyfiveK.c,139 :: 		mV = temp*5000.0/1024.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       139
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _mV+0 
	MOVF        R1, 0 
	MOVWF       _mV+1 
	MOVF        R2, 0 
	MOVWF       _mV+2 
	MOVF        R3, 0 
	MOVWF       _mV+3 
;fortyfiveK.c,140 :: 		actualTemp = (mV/10.0)+7.6;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       115
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _ActualTemp+0 
	MOVF        R1, 0 
	MOVWF       _ActualTemp+1 
;fortyfiveK.c,141 :: 		IntToStr(actualTemp,Txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;fortyfiveK.c,143 :: 		Lcd_Out(2,1,"Temperature");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_fortyfiveK+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_fortyfiveK+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,144 :: 		Lcd_Out(2,12,Txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _Txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_Txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,145 :: 		Lcd_Out(3,1,"Pressure :");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_fortyfiveK+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_fortyfiveK+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,146 :: 		Lcd_Out(3,12,txt2);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,147 :: 		Lcd_Out(4,1,"Day :");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_fortyfiveK+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_fortyfiveK+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,148 :: 		Lcd_Out(4,7,day);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _day+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_day+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,150 :: 		Delay_MS(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;fortyfiveK.c,151 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;fortyfiveK.c,153 :: 		Lcd_Out(1,1,"       WELCOME");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_fortyfiveK+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_fortyfiveK+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,154 :: 		Lcd_Out(2,1,"       THE");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_fortyfiveK+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_fortyfiveK+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,155 :: 		Lcd_Out(3,1,"       TOZ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_fortyfiveK+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_fortyfiveK+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,156 :: 		Lcd_Out(4,1,"       COMPANY");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_fortyfiveK+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_fortyfiveK+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;fortyfiveK.c,157 :: 		Delay_MS(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;fortyfiveK.c,159 :: 		if(PORTD.RD4==1)
	BTFSS       PORTD+0, 4 
	GOTO        L_main6
;fortyfiveK.c,161 :: 		PORTA.RA2 =1;
	BSF         PORTA+0, 2 
;fortyfiveK.c,162 :: 		PORTA.RA3 =0;
	BCF         PORTA+0, 3 
;fortyfiveK.c,163 :: 		}
	GOTO        L_main7
L_main6:
;fortyfiveK.c,164 :: 		else if(PORTD.RD4==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_main8
;fortyfiveK.c,166 :: 		PORTA.RA3 =1;
	BSF         PORTA+0, 3 
;fortyfiveK.c,167 :: 		PORTA.RA2 =0;
	BCF         PORTA+0, 2 
;fortyfiveK.c,168 :: 		}
L_main8:
L_main7:
;fortyfiveK.c,171 :: 		if(PORTD.RD7 == 1)
	BTFSS       PORTD+0, 7 
	GOTO        L_main9
;fortyfiveK.c,173 :: 		PORTB.RB3=1;
	BSF         PORTB+0, 3 
;fortyfiveK.c,174 :: 		if(actualTemp>26.5)
	MOVF        _ActualTemp+0, 0 
	MOVWF       R0 
	MOVF        _ActualTemp+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       84
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;fortyfiveK.c,176 :: 		PWM3_Init(1000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       124
	MOVWF       PR2+0, 0
	CALL        _PWM3_Init+0, 0
;fortyfiveK.c,177 :: 		PWM3_Start();
	CALL        _PWM3_Start+0, 0
;fortyfiveK.c,178 :: 		PWM3_Set_Duty(90);
	MOVLW       90
	MOVWF       FARG_PWM3_Set_Duty_new_duty+0 
	CALL        _PWM3_Set_Duty+0, 0
;fortyfiveK.c,179 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;fortyfiveK.c,180 :: 		PORTB.RB4 = 1;
	BSF         PORTB+0, 4 
;fortyfiveK.c,181 :: 		Delay_MS(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
	NOP
;fortyfiveK.c,182 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;fortyfiveK.c,183 :: 		PORTB.RB4 = 0;
	BCF         PORTB+0, 4 
;fortyfiveK.c,184 :: 		PWM3_Stop();
	CALL        _PWM3_Stop+0, 0
;fortyfiveK.c,185 :: 		}
	GOTO        L_main12
L_main10:
;fortyfiveK.c,186 :: 		else if(actualTemp<25.5)
	MOVF        _ActualTemp+0, 0 
	MOVWF       R0 
	MOVF        _ActualTemp+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
;fortyfiveK.c,188 :: 		PWM4_Init(1000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       124
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;fortyfiveK.c,189 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;fortyfiveK.c,190 :: 		PWM4_Set_Duty(90);
	MOVLW       90
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;fortyfiveK.c,191 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;fortyfiveK.c,192 :: 		PORTB.RB1 = 1;
	BSF         PORTB+0, 1 
;fortyfiveK.c,193 :: 		Delay_MS(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
	NOP
;fortyfiveK.c,194 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;fortyfiveK.c,195 :: 		PORTB.RB1 = 0;
	BCF         PORTB+0, 1 
;fortyfiveK.c,196 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;fortyfiveK.c,197 :: 		}
	GOTO        L_main15
L_main13:
;fortyfiveK.c,200 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;fortyfiveK.c,201 :: 		PORTB.RB1 = 0;
	BCF         PORTB+0, 1 
;fortyfiveK.c,202 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;fortyfiveK.c,203 :: 		PORTB.RB4 = 0;
	BCF         PORTB+0, 4 
;fortyfiveK.c,204 :: 		}
L_main15:
L_main12:
;fortyfiveK.c,205 :: 		}
	GOTO        L_main16
L_main9:
;fortyfiveK.c,206 :: 		else if(PORTD.RD7 == 0)
	BTFSC       PORTD+0, 7 
	GOTO        L_main17
;fortyfiveK.c,208 :: 		PORTB.RB3=1;
	BSF         PORTB+0, 3 
;fortyfiveK.c,209 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;fortyfiveK.c,210 :: 		PORTB.RB1 = 0;
	BCF         PORTB+0, 1 
;fortyfiveK.c,211 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;fortyfiveK.c,212 :: 		PORTB.RB4 = 0 ;
	BCF         PORTB+0, 4 
;fortyfiveK.c,213 :: 		}
L_main17:
L_main16:
;fortyfiveK.c,215 :: 		}
	GOTO        L_main2
;fortyfiveK.c,217 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
