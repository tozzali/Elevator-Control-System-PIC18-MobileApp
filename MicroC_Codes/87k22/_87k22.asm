
_interrupt:

;_87k22.c,188 :: 		void interrupt()
;_87k22.c,190 :: 		GIE_Bit=0;
	BCF         GIE_bit+0, BitPos(GIE_bit+0) 
;_87k22.c,191 :: 		if(INT0IF_bit==1)
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt0
;_87k22.c,193 :: 		PORTE.RE5 = 1;
	BSF         PORTE+0, 5 
;_87k22.c,194 :: 		Delay_MS(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_interrupt1
	NOP
	NOP
;_87k22.c,195 :: 		PORTE.RE5 = 0;
	BCF         PORTE+0, 5 
;_87k22.c,196 :: 		PORTF.F7=1;
	BSF         PORTF+0, 7 
;_87k22.c,197 :: 		}
L_interrupt0:
;_87k22.c,198 :: 		if(INT1IF_bit==1)
	BTFSS       INT1IF_bit+0, BitPos(INT1IF_bit+0) 
	GOTO        L_interrupt2
;_87k22.c,200 :: 		PORTE.RE5 = 1;
	BSF         PORTE+0, 5 
;_87k22.c,201 :: 		Delay_MS(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	DECFSZ      R11, 1, 1
	BRA         L_interrupt3
	NOP
	NOP
;_87k22.c,202 :: 		PORTE.RE5 = 0;
	BCF         PORTE+0, 5 
;_87k22.c,203 :: 		}
L_interrupt2:
;_87k22.c,205 :: 		GIE_Bit =1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;_87k22.c,206 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;_87k22.c,207 :: 		INT1IF_Bit=0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;_87k22.c,208 :: 		INT2IF_Bit=0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;_87k22.c,209 :: 		}
L_end_interrupt:
L__interrupt75:
	RETFIE      1
; end of _interrupt

_motor_up:

;_87k22.c,213 :: 		void motor_up()
;_87k22.c,215 :: 		PWM4_Init(1000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       124
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;_87k22.c,216 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;_87k22.c,217 :: 		PWM4_Set_Duty(80);
	MOVLW       80
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;_87k22.c,218 :: 		PORTE.RE2 = 1;
	BSF         PORTE+0, 2 
;_87k22.c,219 :: 		PORTE.RE3 = 0;
	BCF         PORTE+0, 3 
;_87k22.c,220 :: 		Delay_MS(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_motor_up4:
	DECFSZ      R13, 1, 1
	BRA         L_motor_up4
	DECFSZ      R12, 1, 1
	BRA         L_motor_up4
	DECFSZ      R11, 1, 1
	BRA         L_motor_up4
	NOP
;_87k22.c,221 :: 		PORTE.RE2 = 0;
	BCF         PORTE+0, 2 
;_87k22.c,222 :: 		PORTE.RE3 = 0;
	BCF         PORTE+0, 3 
;_87k22.c,223 :: 		PWM4_Stop();
	CALL        _PWM4_Stop+0, 0
;_87k22.c,224 :: 		}
L_end_motor_up:
	RETURN      0
; end of _motor_up

_motor_down:

;_87k22.c,226 :: 		void motor_down()
;_87k22.c,228 :: 		PWM5_Init(1000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       124
	MOVWF       PR2+0, 0
	CALL        _PWM5_Init+0, 0
;_87k22.c,229 :: 		PWM5_Start();
	CALL        _PWM5_Start+0, 0
;_87k22.c,230 :: 		PWM5_Set_Duty(80);
	MOVLW       80
	MOVWF       FARG_PWM5_Set_Duty_new_duty+0 
	CALL        _PWM5_Set_Duty+0, 0
;_87k22.c,231 :: 		PORTE.RE0 = 0;
	BCF         PORTE+0, 0 
;_87k22.c,232 :: 		PORTE.RE1 = 1;
	BSF         PORTE+0, 1 
;_87k22.c,233 :: 		Delay_MS(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_motor_down5:
	DECFSZ      R13, 1, 1
	BRA         L_motor_down5
	DECFSZ      R12, 1, 1
	BRA         L_motor_down5
	DECFSZ      R11, 1, 1
	BRA         L_motor_down5
	NOP
;_87k22.c,234 :: 		PORTE.RE0 = 0;
	BCF         PORTE+0, 0 
;_87k22.c,235 :: 		PORTE.RE1 = 0;
	BCF         PORTE+0, 1 
;_87k22.c,236 :: 		PWM5_Stop();
	CALL        _PWM5_Stop+0, 0
;_87k22.c,237 :: 		}
L_end_motor_down:
	RETURN      0
; end of _motor_down

_choice_detect:

;_87k22.c,239 :: 		int choice_detect()
;_87k22.c,241 :: 		if(PORTD.RD0==1)
	BTFSS       PORTD+0, 0 
	GOTO        L_choice_detect6
;_87k22.c,243 :: 		choice = 0;
	CLRF        _choice+0 
	CLRF        _choice+1 
;_87k22.c,244 :: 		PORTF.RF1 = 1;
	BSF         PORTF+0, 1 
;_87k22.c,245 :: 		}
L_choice_detect6:
;_87k22.c,246 :: 		if(PORTD.RD1==1)
	BTFSS       PORTD+0, 1 
	GOTO        L_choice_detect7
;_87k22.c,248 :: 		choice = 1;
	MOVLW       1
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,249 :: 		PORTF.RF2 = 1;
	BSF         PORTF+0, 2 
;_87k22.c,250 :: 		}
L_choice_detect7:
;_87k22.c,251 :: 		if(PORTD.RD2==1)
	BTFSS       PORTD+0, 2 
	GOTO        L_choice_detect8
;_87k22.c,253 :: 		choice = 2;
	MOVLW       2
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,254 :: 		PORTF.RF3 = 1;
	BSF         PORTF+0, 3 
;_87k22.c,255 :: 		}
L_choice_detect8:
;_87k22.c,256 :: 		if(PORTD.RD3==1)
	BTFSS       PORTD+0, 3 
	GOTO        L_choice_detect9
;_87k22.c,258 :: 		choice = 3;
	MOVLW       3
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,259 :: 		PORTF.RF4 = 1;
	BSF         PORTF+0, 4 
;_87k22.c,260 :: 		}
L_choice_detect9:
;_87k22.c,261 :: 		if(PORTD.RD4==1)
	BTFSS       PORTD+0, 4 
	GOTO        L_choice_detect10
;_87k22.c,263 :: 		choice = 4;
	MOVLW       4
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,264 :: 		PORTF.RF5 = 1;
	BSF         PORTF+0, 5 
;_87k22.c,265 :: 		}
L_choice_detect10:
;_87k22.c,266 :: 		if(PORTD.RD5==1)
	BTFSS       PORTD+0, 5 
	GOTO        L_choice_detect11
;_87k22.c,268 :: 		choice = 5;
	MOVLW       5
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,269 :: 		PORTF.RF6 = 1;
	BSF         PORTF+0, 6 
;_87k22.c,270 :: 		}
L_choice_detect11:
;_87k22.c,272 :: 		return choice;
	MOVF        _choice+0, 0 
	MOVWF       R0 
	MOVF        _choice+1, 0 
	MOVWF       R1 
;_87k22.c,273 :: 		}
L_end_choice_detect:
	RETURN      0
; end of _choice_detect

_main:

;_87k22.c,276 :: 		void main()
;_87k22.c,279 :: 		TRISC = 0B11100000;  // input
	MOVLW       224
	MOVWF       TRISC+0 
;_87k22.c,280 :: 		TRISE = 0B10000000; // output
	MOVLW       128
	MOVWF       TRISE+0 
;_87k22.c,281 :: 		TRISA = 0x00; // output
	CLRF        TRISA+0 
;_87k22.c,282 :: 		TRISH = 0B00000000;
	CLRF        TRISH+0 
;_87k22.c,283 :: 		TRISB = 0B00000111;
	MOVLW       7
	MOVWF       TRISB+0 
;_87k22.c,284 :: 		TRISG = 0X00;
	CLRF        TRISG+0 
;_87k22.c,286 :: 		TRISD = 0b01111111;
	MOVLW       127
	MOVWF       TRISD+0 
;_87k22.c,287 :: 		TRISF = 0X00;
	CLRF        TRISF+0 
;_87k22.c,289 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;_87k22.c,290 :: 		INT0IE_bit=1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;_87k22.c,291 :: 		GIE_bit=1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;_87k22.c,292 :: 		INTEDG0_bit = 1;
	BSF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;_87k22.c,294 :: 		INT1IF_bit=0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;_87k22.c,295 :: 		INT1IE_bit=1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;_87k22.c,296 :: 		INTEDG1_bit = 1;
	BSF         INTEDG1_bit+0, BitPos(INTEDG1_bit+0) 
;_87k22.c,299 :: 		TRISG.RG3 = 0;
	BCF         TRISG+0, 3 
;_87k22.c,300 :: 		TRISG.RG4 = 0;
	BCF         TRISG+0, 4 
;_87k22.c,301 :: 		ADCON1 = 0B00000110;
	MOVLW       6
	MOVWF       ADCON1+0 
;_87k22.c,302 :: 		OSCCON = 0X76;
	MOVLW       118
	MOVWF       OSCCON+0 
;_87k22.c,303 :: 		Glcd_Init();
	CALL        _Glcd_Init+0, 0
;_87k22.c,306 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;_87k22.c,309 :: 		UART1_Init(9600); // Initialize UART module at 9600 bps
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;_87k22.c,310 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
;_87k22.c,311 :: 		UART1_Write_Text("Bluetooth connection is successful \r\n");
	MOVLW       ?lstr1__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,315 :: 		while(1)
L_main13:
;_87k22.c,318 :: 		if (UART1_Data_Ready() == 1){       // Direction from app
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;_87k22.c,319 :: 		uart_rd = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;_87k22.c,320 :: 		switch(uart_rd){
	GOTO        L_main16
;_87k22.c,322 :: 		case'0':
L_main18:
;_87k22.c,323 :: 		PORTE.RE5 = 1;
	BSF         PORTE+0, 5 
;_87k22.c,324 :: 		UART1_Write_Text(" ALARM ON \r\n ");
	MOVLW       ?lstr2__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,325 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
;_87k22.c,326 :: 		PORTE.RE5 = 0;
	BCF         PORTE+0, 5 
;_87k22.c,327 :: 		UART1_Write_Text(" ALARM OFF \r\n ");
	MOVLW       ?lstr3__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,328 :: 		break;
	GOTO        L_main17
;_87k22.c,330 :: 		case'a':
L_main20:
;_87k22.c,331 :: 		PORTD.RD0 = 1;
	BSF         PORTD+0, 0 
;_87k22.c,332 :: 		UART1_Write_Text(" First Floor \r\n ");
	MOVLW       ?lstr4__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,333 :: 		choice = 1;
	MOVLW       1
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,334 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
;_87k22.c,335 :: 		break;
	GOTO        L_main17
;_87k22.c,337 :: 		case'b':
L_main22:
;_87k22.c,338 :: 		PORTD.RD1 = 1;
	BSF         PORTD+0, 1 
;_87k22.c,339 :: 		choice = 2;
	MOVLW       2
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,340 :: 		UART1_Write_Text(" Second Floor \r\n ");
	MOVLW       ?lstr5__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,341 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
;_87k22.c,342 :: 		break;
	GOTO        L_main17
;_87k22.c,344 :: 		case'c':
L_main24:
;_87k22.c,345 :: 		PORTD.RD2 = 1;
	BSF         PORTD+0, 2 
;_87k22.c,346 :: 		choice = 3;
	MOVLW       3
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,347 :: 		UART1_Write_Text(" Third Floor \r\n ");
	MOVLW       ?lstr6__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,348 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
;_87k22.c,349 :: 		break;
	GOTO        L_main17
;_87k22.c,350 :: 		case'd':
L_main26:
;_87k22.c,351 :: 		PORTD.RD3 = 1;
	BSF         PORTD+0, 3 
;_87k22.c,352 :: 		choice = 4;
	MOVLW       4
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,353 :: 		UART1_Write_Text(" Fourth Floor \r\n ");
	MOVLW       ?lstr7__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,354 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
;_87k22.c,355 :: 		break;
	GOTO        L_main17
;_87k22.c,357 :: 		case'e':
L_main28:
;_87k22.c,358 :: 		PORTD.RD4 = 1;
	BSF         PORTD+0, 4 
;_87k22.c,359 :: 		choice = 5;
	MOVLW       5
	MOVWF       _choice+0 
	MOVLW       0
	MOVWF       _choice+1 
;_87k22.c,360 :: 		UART1_Write_Text(" Fifth Floor \r\n ");
	MOVLW       ?lstr8__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,361 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
;_87k22.c,362 :: 		break;
	GOTO        L_main17
;_87k22.c,364 :: 		case 'H':            //fan
L_main30:
;_87k22.c,365 :: 		PORTC.RC0 = 1;
	BSF         PORTC+0, 0 
;_87k22.c,366 :: 		UART1_Write_Text(" FAN ON \r\n ");
	MOVLW       ?lstr9__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,367 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
;_87k22.c,368 :: 		break;
	GOTO        L_main17
;_87k22.c,370 :: 		case 'h':
L_main32:
;_87k22.c,371 :: 		PORTC.RC0 = 0;
	BCF         PORTC+0, 0 
;_87k22.c,372 :: 		UART1_Write_Text(" FAN OFF \r\n ");
	MOVLW       ?lstr10__87k22+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10__87k22+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;_87k22.c,373 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	DECFSZ      R11, 1, 1
	BRA         L_main33
	NOP
;_87k22.c,374 :: 		break;
	GOTO        L_main17
;_87k22.c,375 :: 		}
L_main16:
	MOVF        _uart_rd+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	MOVF        _uart_rd+0, 0 
	XORLW       97
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
	MOVF        _uart_rd+0, 0 
	XORLW       98
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
	MOVF        _uart_rd+0, 0 
	XORLW       99
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
	MOVF        _uart_rd+0, 0 
	XORLW       100
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
	MOVF        _uart_rd+0, 0 
	XORLW       101
	BTFSC       STATUS+0, 2 
	GOTO        L_main28
	MOVF        _uart_rd+0, 0 
	XORLW       72
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
	MOVF        _uart_rd+0, 0 
	XORLW       104
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
L_main17:
;_87k22.c,380 :: 		}
L_main15:
;_87k22.c,383 :: 		if(PORTB.RB2==1)
	BTFSS       PORTB+0, 2 
	GOTO        L_main34
;_87k22.c,385 :: 		PORTD.RD7 = 1;
	BSF         PORTD+0, 7 
;_87k22.c,386 :: 		}
L_main34:
;_87k22.c,387 :: 		if(PORTB.RB2==0)
	BTFSC       PORTB+0, 2 
	GOTO        L_main35
;_87k22.c,389 :: 		PORTD.RD7 = 0;
	BCF         PORTD+0, 7 
;_87k22.c,390 :: 		}
L_main35:
;_87k22.c,391 :: 		if(PORTB.RB2==0)
	BTFSC       PORTB+0, 2 
	GOTO        L_main36
;_87k22.c,394 :: 		PORTE.RE4 =1;
	BSF         PORTE+0, 4 
;_87k22.c,395 :: 		PORTE.RE6 =0;
	BCF         PORTE+0, 6 
;_87k22.c,396 :: 		}
L_main36:
;_87k22.c,397 :: 		if(PORTD.RD6==0)
	BTFSC       PORTD+0, 6 
	GOTO        L_main37
;_87k22.c,399 :: 		PORTE.RE6 =1;
	BSF         PORTE+0, 6 
;_87k22.c,400 :: 		PORTE.RE4 =0;
	BCF         PORTE+0, 4 
;_87k22.c,401 :: 		}
L_main37:
;_87k22.c,403 :: 		if(PORTB.RB0 == 1 || PORTB.RB1 == 1)
	BTFSC       PORTB+0, 0 
	GOTO        L__main73
	BTFSC       PORTB+0, 1 
	GOTO        L__main73
	GOTO        L_main40
L__main73:
;_87k22.c,405 :: 		Glcd_Image(emergency);
	MOVLW       _emergency+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_emergency+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_emergency+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,406 :: 		Delay_Ms(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 1
	BRA         L_main41
	DECFSZ      R12, 1, 1
	BRA         L_main41
	DECFSZ      R11, 1, 1
	BRA         L_main41
	NOP
	NOP
;_87k22.c,407 :: 		}
L_main40:
;_87k22.c,408 :: 		if(PORTD.RD6 == 1)
	BTFSS       PORTD+0, 6 
	GOTO        L_main42
;_87k22.c,410 :: 		PORTE.RE4=1;
	BSF         PORTE+0, 4 
;_87k22.c,411 :: 		PORTE.RE6=0;
	BCF         PORTE+0, 6 
;_87k22.c,412 :: 		}
L_main42:
;_87k22.c,413 :: 		if(PORTD.RD6 == 0)
	BTFSC       PORTD+0, 6 
	GOTO        L_main43
;_87k22.c,415 :: 		PORTE.RE4=0;
	BCF         PORTE+0, 4 
;_87k22.c,416 :: 		PORTE.RE6=1;
	BSF         PORTE+0, 6 
;_87k22.c,417 :: 		}
L_main43:
;_87k22.c,419 :: 		choice_detect();
	CALL        _choice_detect+0, 0
;_87k22.c,420 :: 		PORTH = list[present_position];
	MOVF        _present_position+0, 0 
	MOVWF       R0 
	MOVF        _present_position+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _list+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_list+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTH+0 
;_87k22.c,422 :: 		if((choice - present_position) >= 0)
	MOVF        _present_position+0, 0 
	SUBWF       _choice+0, 0 
	MOVWF       R1 
	MOVF        _present_position+1, 0 
	SUBWFB      _choice+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main80
	MOVLW       0
	SUBWF       R1, 0 
L__main80:
	BTFSS       STATUS+0, 0 
	GOTO        L_main44
;_87k22.c,424 :: 		pwm_period = choice - present_position;
	MOVF        _present_position+0, 0 
	SUBWF       _choice+0, 0 
	MOVWF       _pwm_period+0 
	MOVF        _present_position+1, 0 
	SUBWFB      _choice+1, 0 
	MOVWF       _pwm_period+1 
;_87k22.c,425 :: 		for(i=0; i < pwm_period ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main45:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pwm_period+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main81
	MOVF        _pwm_period+0, 0 
	SUBWF       _i+0, 0 
L__main81:
	BTFSC       STATUS+0, 0 
	GOTO        L_main46
;_87k22.c,427 :: 		PORTH = list[present_position];
	MOVF        _present_position+0, 0 
	MOVWF       R0 
	MOVF        _present_position+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _list+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_list+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTH+0 
;_87k22.c,428 :: 		motor_up();
	CALL        _motor_up+0, 0
;_87k22.c,429 :: 		present_position++;
	INFSNZ      _present_position+0, 1 
	INCF        _present_position+1, 1 
;_87k22.c,431 :: 		if(present_position ==1)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main82
	MOVLW       1
	XORWF       _present_position+0, 0 
L__main82:
	BTFSS       STATUS+0, 2 
	GOTO        L_main48
;_87k22.c,434 :: 		Glcd_Image(first_up);
	MOVLW       _first_up+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_first_up+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_first_up+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,435 :: 		}
L_main48:
;_87k22.c,436 :: 		if(present_position ==2)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main83
	MOVLW       2
	XORWF       _present_position+0, 0 
L__main83:
	BTFSS       STATUS+0, 2 
	GOTO        L_main49
;_87k22.c,439 :: 		Glcd_Image(second_up);
	MOVLW       _second_up+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_second_up+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_second_up+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,440 :: 		}
L_main49:
;_87k22.c,441 :: 		if(present_position ==3)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main84
	MOVLW       3
	XORWF       _present_position+0, 0 
L__main84:
	BTFSS       STATUS+0, 2 
	GOTO        L_main50
;_87k22.c,443 :: 		Glcd_Image(third_up);
	MOVLW       _third_up+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_third_up+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_third_up+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,445 :: 		}
L_main50:
;_87k22.c,446 :: 		if(present_position ==4)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main85
	MOVLW       4
	XORWF       _present_position+0, 0 
L__main85:
	BTFSS       STATUS+0, 2 
	GOTO        L_main51
;_87k22.c,448 :: 		Glcd_Image(fourth_up);
	MOVLW       _fourth_up+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_fourth_up+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_fourth_up+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,450 :: 		}
L_main51:
;_87k22.c,451 :: 		if(present_position ==5)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main86
	MOVLW       5
	XORWF       _present_position+0, 0 
L__main86:
	BTFSS       STATUS+0, 2 
	GOTO        L_main52
;_87k22.c,453 :: 		Glcd_Image(fifth_up);
	MOVLW       _fifth_up+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_fifth_up+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_fifth_up+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,455 :: 		}
L_main52:
;_87k22.c,425 :: 		for(i=0; i < pwm_period ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;_87k22.c,456 :: 		}
	GOTO        L_main45
L_main46:
;_87k22.c,457 :: 		if(present_position ==1)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main87
	MOVLW       1
	XORWF       _present_position+0, 0 
L__main87:
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
;_87k22.c,459 :: 		PORTF.RF2 = 0;
	BCF         PORTF+0, 2 
;_87k22.c,461 :: 		}
	GOTO        L_main54
L_main53:
;_87k22.c,462 :: 		else if(present_position ==2)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main88
	MOVLW       2
	XORWF       _present_position+0, 0 
L__main88:
	BTFSS       STATUS+0, 2 
	GOTO        L_main55
;_87k22.c,464 :: 		PORTF.RF3 = 0;
	BCF         PORTF+0, 3 
;_87k22.c,466 :: 		}
	GOTO        L_main56
L_main55:
;_87k22.c,467 :: 		else if(present_position ==3)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main89
	MOVLW       3
	XORWF       _present_position+0, 0 
L__main89:
	BTFSS       STATUS+0, 2 
	GOTO        L_main57
;_87k22.c,469 :: 		PORTF.RF4 = 0;
	BCF         PORTF+0, 4 
;_87k22.c,470 :: 		}
	GOTO        L_main58
L_main57:
;_87k22.c,471 :: 		else if(present_position ==4)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main90
	MOVLW       4
	XORWF       _present_position+0, 0 
L__main90:
	BTFSS       STATUS+0, 2 
	GOTO        L_main59
;_87k22.c,473 :: 		PORTF.RF5 = 0;
	BCF         PORTF+0, 5 
;_87k22.c,474 :: 		}
	GOTO        L_main60
L_main59:
;_87k22.c,475 :: 		else if(present_position ==5)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main91
	MOVLW       5
	XORWF       _present_position+0, 0 
L__main91:
	BTFSS       STATUS+0, 2 
	GOTO        L_main61
;_87k22.c,477 :: 		PORTF.RF6 = 0;
	BCF         PORTF+0, 6 
;_87k22.c,478 :: 		}
L_main61:
L_main60:
L_main58:
L_main56:
L_main54:
;_87k22.c,479 :: 		present_position=choice;
	MOVF        _choice+0, 0 
	MOVWF       _present_position+0 
	MOVF        _choice+1, 0 
	MOVWF       _present_position+1 
;_87k22.c,480 :: 		}
L_main44:
;_87k22.c,481 :: 		if((choice - present_position < 0))
	MOVF        _present_position+0, 0 
	SUBWF       _choice+0, 0 
	MOVWF       R1 
	MOVF        _present_position+1, 0 
	SUBWFB      _choice+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main92
	MOVLW       0
	SUBWF       R1, 0 
L__main92:
	BTFSC       STATUS+0, 0 
	GOTO        L_main62
;_87k22.c,483 :: 		pwm_period = present_position - choice;
	MOVF        _choice+0, 0 
	SUBWF       _present_position+0, 0 
	MOVWF       _pwm_period+0 
	MOVF        _choice+1, 0 
	SUBWFB      _present_position+1, 0 
	MOVWF       _pwm_period+1 
;_87k22.c,484 :: 		for(i=0; i < pwm_period ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main63:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pwm_period+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main93
	MOVF        _pwm_period+0, 0 
	SUBWF       _i+0, 0 
L__main93:
	BTFSC       STATUS+0, 0 
	GOTO        L_main64
;_87k22.c,486 :: 		PORTH = list[present_position];
	MOVF        _present_position+0, 0 
	MOVWF       R0 
	MOVF        _present_position+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _list+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_list+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTH+0 
;_87k22.c,487 :: 		motor_down();
	CALL        _motor_down+0, 0
;_87k22.c,488 :: 		present_position--;
	MOVLW       1
	SUBWF       _present_position+0, 1 
	MOVLW       0
	SUBWFB      _present_position+1, 1 
;_87k22.c,489 :: 		if(present_position ==1)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main94
	MOVLW       1
	XORWF       _present_position+0, 0 
L__main94:
	BTFSS       STATUS+0, 2 
	GOTO        L_main66
;_87k22.c,491 :: 		Glcd_Image(first_down);
	MOVLW       _first_down+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_first_down+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_first_down+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,492 :: 		}
L_main66:
;_87k22.c,493 :: 		if(present_position ==2)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main95
	MOVLW       2
	XORWF       _present_position+0, 0 
L__main95:
	BTFSS       STATUS+0, 2 
	GOTO        L_main67
;_87k22.c,495 :: 		Glcd_Image(second_down);
	MOVLW       _second_down+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_second_down+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_second_down+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,496 :: 		}
L_main67:
;_87k22.c,497 :: 		if(present_position ==3)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main96
	MOVLW       3
	XORWF       _present_position+0, 0 
L__main96:
	BTFSS       STATUS+0, 2 
	GOTO        L_main68
;_87k22.c,499 :: 		Glcd_Image(third_down);
	MOVLW       _third_down+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_third_down+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_third_down+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,500 :: 		}
L_main68:
;_87k22.c,501 :: 		if(present_position ==4)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main97
	MOVLW       4
	XORWF       _present_position+0, 0 
L__main97:
	BTFSS       STATUS+0, 2 
	GOTO        L_main69
;_87k22.c,503 :: 		Glcd_Image(fourth_down);
	MOVLW       _fourth_down+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_fourth_down+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_fourth_down+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,504 :: 		}
L_main69:
;_87k22.c,505 :: 		if(present_position ==5)
	MOVLW       0
	XORWF       _present_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main98
	MOVLW       5
	XORWF       _present_position+0, 0 
L__main98:
	BTFSS       STATUS+0, 2 
	GOTO        L_main70
;_87k22.c,507 :: 		Glcd_Image(fifth_down);
	MOVLW       _fifth_down+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_fifth_down+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_fifth_down+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,508 :: 		}
L_main70:
;_87k22.c,484 :: 		for(i=0; i < pwm_period ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;_87k22.c,509 :: 		}
	GOTO        L_main63
L_main64:
;_87k22.c,510 :: 		present_position=choice;
	MOVF        _choice+0, 0 
	MOVWF       _present_position+0 
	MOVF        _choice+1, 0 
	MOVWF       _present_position+1 
;_87k22.c,512 :: 		}
L_main62:
;_87k22.c,514 :: 		Glcd_Image(ikcu);
	MOVLW       _ikcu+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_ikcu+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_ikcu+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,515 :: 		Delay_MS(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main71:
	DECFSZ      R13, 1, 1
	BRA         L_main71
	DECFSZ      R12, 1, 1
	BRA         L_main71
	DECFSZ      R11, 1, 1
	BRA         L_main71
	NOP
	NOP
;_87k22.c,516 :: 		Glcd_Image(lift_warn);
	MOVLW       _lift_warn+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_lift_warn+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_lift_warn+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;_87k22.c,517 :: 		Delay_MS(1500);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main72:
	DECFSZ      R13, 1, 1
	BRA         L_main72
	DECFSZ      R12, 1, 1
	BRA         L_main72
	DECFSZ      R11, 1, 1
	BRA         L_main72
	NOP
	NOP
;_87k22.c,518 :: 		}
	GOTO        L_main13
;_87k22.c,520 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
