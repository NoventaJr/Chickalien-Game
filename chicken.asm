jmp main
Win: string "V O C E   C H E G O U"
Dead: string "V O C E   M O R R E U"
Msg: string "Quer jogar novamente? <s/n>"

Letra: var #1		; Contem a letra que foi digitada

posNave: var #1			; Contem a posicao atual da Nave
posAntNave: var #1		; Contem a posicao anterior da Nave

posAlien: var #1		; Contem a posicao atual do Alien
posAntAlien: var #1		; Contem a posicao anterior do Alien
dirAlien: var #1

posAlien2: var #1		; Contem a posicao atual do Alien
posAntAlien2: var #1	; Contem a posicao anterior do Alien
dirAlien2: var #1

posAlien3: var #1		; Contem a posicao atual do Alien
posAntAlien3: var #1		; Contem a posicao anterior do Alien
dirAlien3: var #1

posAlien4: var #1		; Contem a posicao atual do Alien
posAntAlien4: var #1		; Contem a posicao anterior do Alien
dirAlien4: var #1

posAlien5: var #1		; Contem a posicao atual do Alien
posAntAlien5: var #1		; Contem a posicao anterior do Alien
dirAlien5: var #1

IncRand: var #1			; Incremento para circular na Tabela de nr. Randomicos
Rand : var #30			; Tabela de nr. Randomicos entre 0 - 7
	static Rand + #0, #0
	static Rand + #1, #3
	static Rand + #2, #7
	static Rand + #3, #1
	static Rand + #4, #6
	static Rand + #5, #2
	static Rand + #6, #7
	static Rand + #7, #2
	static Rand + #8, #0
	static Rand + #9, #5
	static Rand + #10, #7
	static Rand + #11, #2
	static Rand + #12, #0
	static Rand + #13, #2
	static Rand + #14, #7
	static Rand + #15, #5
	static Rand + #16, #5
	static Rand + #17, #6
	static Rand + #18, #7
	static Rand + #19, #2
	static Rand + #20, #0
	static Rand + #20, #7
	static Rand + #21, #1
	static Rand + #22, #5
	static Rand + #23, #6
	static Rand + #24, #6
	static Rand + #25, #7
	static Rand + #26, #0
	static Rand + #27, #3
	static Rand + #28, #1
	static Rand + #29, #1

;Codigo principal
main:
	call ApagaTela
	loadn r1, #tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #1536  			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
    
	loadn r1, #tela2Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #512  			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
    
	loadn r1, #tela3Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #2816   			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira

	loadn r1, #tela4Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #256   			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira

	Loadn r0, #0			
	store posNave, r0		; Zera Posicao Atual da Nave
	store posAntNave, r0	; Zera Posicao Anterior da Nave
	
	Loadn r0, #48
	store posAlien, r0		; Zera Posicao Atual do Alien
	store posAntAlien, r0	; Zera Posicao Anterior do Alien
	loadn r0, #1
	store dirAlien, r0		; Alien começa indo pra baixo
	
	Loadn r0, #842
	store posAlien2, R0		; Zera Posicao Atual do Alien
	store posAntAlien2, R0	; Zera Posicao Anterior do Alien
	loadn r0, #2
	store dirAlien2, r0		; Alien começa indo pra direita
	
	Loadn r0, #1151
	store posAlien3, r0		; Zera Posicao Atual do Alien
	store posAntAlien3, r0	; Zera Posicao Anterior do Alien
	loadn r0, #3
	store dirAlien3, r0		; Alien começa indo pra cima
	
	Loadn r0, #357
	store posAlien4, r0		; Zera Posicao Atual do Alien
	store posAntAlien4, r0	; Zera Posicao Anterior do Alien
	loadn r0, #0
	store dirAlien4, r0		; Alien começa indo pra esquerda
	
	Loadn r0, #746
	store posAlien5, r0		; Zera Posicao Atual do Alien
	store posAntAlien5, r0	; Zera Posicao Anterior do Alien
	loadn r0, #0
	store dirAlien5, r0		; Alien começa indo pra esquerda
	
	Loadn r0, #0			; Contador para os Mods	= 0
	loadn r2, #0			; Para verificar se (mod(c/10)==0

	Loop:
	
		loadn R1, #10
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/10)==0
		ceq MoveNave	; Chama Rotina de movimentacao da Nave
	
		loadn R1, #30
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/30)==0
		ceq MoveAlien	; Chama Rotina de movimentacao do Alien
		
		loadn R1, #30
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/30)==0
		ceq MoveAlien2	; Chama Rotina de movimentacao do Alien
		
		loadn R1, #30
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/30)==0
		ceq MoveAlien3	; Chama Rotina de movimentacao do Alien
		
		loadn R1, #30
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/30)==0
		ceq MoveAlien4	; Chama Rotina de movimentacao do Alien
		
		loadn R1, #30
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/30)==0
		ceq MoveAlien5	; Chama Rotina de movimentacao do Alien
		
		loadn R1, #30
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/30)==0
		call ChecaPos	; Chama Rotina de movimentacao do Alien
	
		call Delay
		inc R0 	;c++
		jmp Loop
	
;Funcoes
;--------------------------

MoveNave:
	push r0
	push r1
	
	call MoveNave_RecalculaPos		; Recalcula Posicao da Nave

; So' Apaga e Redezenha se (pos != posAnt)
;	If (posNave != posAntNave)	{	
	load r0, posNave
	load r1, posAntNave
	cmp r0, r1
	jeq MoveNave_Skip
		call MoveNave_Apaga
		call MoveNave_Desenha		;}
  MoveNave_Skip:
	
	pop r1
	pop r0
	rts

;--------------------------------
	
MoveNave_Apaga:		; Apaga a Nave preservando o Cenario!
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntNave	; R0 = posAnt
	
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!

	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
;----------------------------------	
	
MoveNave_RecalculaPos:		; Recalcula posicao da Nave em funcao das Teclas pressionadas
	push R0
	push R1
	push R2
	push R3

	load R0, posNave
	
	inchar R1				; Le Teclado para controlar a Nave
	loadn R2, #'a'
	cmp R1, R2
	jeq MoveNave_RecalculaPos_A
	
	loadn R2, #'d'
	cmp R1, R2
	jeq MoveNave_RecalculaPos_D
		
	loadn R2, #'w'
	cmp R1, R2
	jeq MoveNave_RecalculaPos_W
		
	loadn R2, #'s'
	cmp R1, R2
	jeq MoveNave_RecalculaPos_S
	
  MoveNave_RecalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora
	store posNave, R0
	pop R3
	pop R2
	pop R1
	pop R0
	rts

  MoveNave_RecalculaPos_A:	; Move Nave para Esquerda
	loadn R1, #40
	loadn R2, #0
	mod R1, R0, R1		; Testa condicoes de Contorno 
	cmp R1, R2
	jeq MoveNave_RecalculaPos_Fim
	dec R0	; pos = pos -1
	jmp MoveNave_RecalculaPos_Fim
		
  MoveNave_RecalculaPos_D:	; Move Nave para Direita	
	loadn R1, #40
	loadn R2, #39
	mod R1, R0, R1		; Testa condicoes de Contorno 
	cmp R1, R2
	jeq MoveNave_RecalculaPos_Fim
	inc R0	; pos = pos + 1
	jmp MoveNave_RecalculaPos_Fim
	
  MoveNave_RecalculaPos_W:	; Move Nave para Cima
	loadn R1, #40
	cmp R0, R1		; Testa condicoes de Contorno 
	jle MoveNave_RecalculaPos_Fim
	sub R0, R0, R1	; pos = pos - 40
	jmp MoveNave_RecalculaPos_Fim

  MoveNave_RecalculaPos_S:	; Move Nave para Baixo
	loadn R1, #1159
	cmp R0, R1		; Testa condicoes de Contorno 
	jgr MoveNave_RecalculaPos_Fim
	loadn R1, #40
	add R0, R0, R1	; pos = pos + 40
	jmp MoveNave_RecalculaPos_Fim	
	
;----------------------------------
MoveNave_Desenha:	; Desenha caractere da Nave
	push R0
	push R1
	
	Loadn R1, #'X'	; Nave
	load R0, posNave
	outchar R1, R0
	store posAntNave, R0	; Atualiza Posicao Anterior da Nave = Posicao Atual
	
	pop R1
	pop R0
	rts

;----------------------------------
;----------------------------------
;----------------------------------

MoveAlien:
	push r0
	push r1
	
	call MoveAlien_RecalculaPos
	
; So' Apaga e Redezenha se (pos != posAnt)
;	If (pos != posAnt)	{	
	load r0, posAlien
	load r1, posAntAlien
	cmp r0, r1
	jeq MoveAlien_Skip
		call MoveAlien_Apaga
		call MoveAlien_Desenha		;}
  MoveAlien_Skip:
	
	pop r1
	pop r0
	rts
		
; ----------------------------
		
MoveAlien_Apaga:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntAlien	; R0 == posAnt
	load R1, posAntNave 	; R1 = posAnt
	cmp r0, r1
	jne MoveAlien_Apaga_Skip
		loadn r5, #'X'		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveAlien_Apaga_Fim

  MoveAlien_Apaga_Skip:	
  
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
  
  MoveAlien_Apaga_Fim:	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveAlien_RecalculaPos:
	push r0
	push r1
	push r2
	push r3

	load r0, posAlien
	load r1, dirAlien

 MoveAlien_Esquerda:
 	loadn r2, #0	;se dir = 0
	cmp r1, r2
	jne MoveAlien_Baixo
	loadn r1, #1
	sub r0, r0, r1
	loadn r1, #48
	cmp r0, r1
	jne MoveAlien_FimSwitch	; Break do Switch
	loadn r1, #1
	store dirAlien, r1
	jmp MoveAlien_FimSwitch
	
 MoveAlien_Baixo:
 	loadn r2, #1	;se dir = 1
	cmp r1, r2
	jne MoveAlien_Direita
	loadn r1, #40
	add r0, r0, r1
	loadn r1, #248
	cmp r0, r1
	jne MoveAlien_FimSwitch	; Break do Switch
	loadn r1, #2
	store dirAlien, r1
	jmp MoveAlien_FimSwitch
	
 MoveAlien_Direita:
 	loadn r2, #2	;se dir = 2
	cmp r1, r2
	jne MoveAlien_Cima
	loadn r1, #1
	add r0, r0, r1
	loadn r1, #275
	cmp r0, r1
	jne MoveAlien_FimSwitch	; Break do Switch
	loadn r1, #3
	store dirAlien, r1
	jmp MoveAlien_FimSwitch
	
 MoveAlien_Cima:
 	loadn r2, #3	;se dir = 3
	cmp r1, r2
	jne MoveAlien_FimSwitch
	loadn r1, #40
	sub r0, r0, r1
	loadn r1, #75
	cmp r0, r1
	jne MoveAlien_FimSwitch	; Break do Switch
	loadn r1, #0
	store dirAlien, r1

  MoveAlien_FimSwitch:	
	store posAlien, R0	; Grava a posicao alterada na memoria
	pop R3
	pop R2
	pop R1
	pop R0
	rts


;----------------------------------
MoveAlien_Desenha:
	push R0
	push R1
	
	Loadn R1, #'A'	; Alien
	load R0, posAlien
	outchar R1, R0
	store posAntAlien, R0
	
	pop R1
	pop R0
	rts

;----------------------------------
;----------------------------------
;--------------------------

MoveAlien2:
	push r0
	push r1
	
	call MoveAlien2_RecalculaPos
	
; So' Apaga e Redezenha se (pos != posAnt)
;	If (pos != posAnt)	{	
	load r0, posAlien2
	load r1, posAntAlien2
	cmp r0, r1
	jeq MoveAlien2_Skip
		call MoveAlien2_Apaga
		call MoveAlien2_Desenha		;}
  MoveAlien2_Skip:
	
	pop r1
	pop r0
	rts
		
; ----------------------------
		
MoveAlien2_Apaga:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntAlien2	; R0 == posAnt
	load R1, posAntNave		; R1 = posAnt
	cmp r0, r1
	jne MoveAlien2_Apaga_Skip
		loadn r5, #'X'		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveAlien2_Apaga_Fim

  MoveAlien2_Apaga_Skip:	
  
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
  
  MoveAlien2_Apaga_Fim:	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveAlien2_RecalculaPos:
	push r0
	push r1
	push r2
	push r3

	load r0, posAlien2
	load r1, dirAlien2

 MoveAlien2_Esquerda:
 	loadn r2, #0	;se dir = 0
	cmp r1, r2
	jne MoveAlien2_Baixo
	loadn r1, #1
	sub r0, r0, r1
	loadn r1, #322
	cmp r0, r1
	jne MoveAlien2_FimSwitch	; Break do Switch
	loadn r1, #1
	store dirAlien2, r1
	jmp MoveAlien2_FimSwitch
	
 MoveAlien2_Baixo:
 	loadn r2, #1	;se dir = 1
	cmp r1, r2
	jne MoveAlien2_Direita
	loadn r1, #40
	add r0, r0, r1
	loadn r1, #842
	cmp r0, r1
	jne MoveAlien2_FimSwitch	; Break do Switch
	loadn r1, #2
	store dirAlien2, r1
	jmp MoveAlien2_FimSwitch
	
 MoveAlien2_Direita:
 	loadn r2, #2	;se dir = 2
	cmp r1, r2
	jne MoveAlien2_Cima
	loadn r1, #1
	add r0, r0, r1
	loadn r1, #849
	cmp r0, r1
	jne MoveAlien2_FimSwitch	; Break do Switch
	loadn r1, #3
	store dirAlien2, r1
	jmp MoveAlien2_FimSwitch
	
 MoveAlien2_Cima:
 	loadn r2, #3	;se dir = 3
	cmp r1, r2
	jne MoveAlien2_FimSwitch
	loadn r1, #40
	sub r0, r0, r1
	loadn r1, #329
	cmp r0, r1
	jne MoveAlien2_FimSwitch	; Break do Switch
	loadn r1, #0
	store dirAlien2, r1

  MoveAlien2_FimSwitch:	
	store posAlien2, R0	; Grava a posicao alterada na memoria
	pop R3
	pop R2
	pop R1
	pop R0
	rts


;----------------------------------
MoveAlien2_Desenha:
	push R0
	push R1
	
	Loadn R1, #'A'	; Alien
	load R0, posAlien2
	outchar R1, R0
	store posAntAlien2, R0
	
	pop R1
	pop R0
	rts

;----------------------------------
;----------------------------------
;--------------------------

MoveAlien3:
	push r0
	push r1
	
	call MoveAlien3_RecalculaPos
	
; So' Apaga e Redezenha se (pos != posAnt)
;	If (pos != posAnt)	{	
	load r0, posAlien3
	load r1, posAntAlien3
	cmp r0, r1
	jeq MoveAlien3_Skip
		call MoveAlien3_Apaga
		call MoveAlien3_Desenha		;}
  MoveAlien3_Skip:
	
	pop r1
	pop r0
	rts
		
; ----------------------------
		
MoveAlien3_Apaga:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntAlien3	; R0 == posAnt
	load R1, posAntNave		; R1 = posAnt
	cmp r0, r1
	jne MoveAlien3_Apaga_Skip
		loadn r5, #'X'		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveAlien3_Apaga_Fim

  MoveAlien3_Apaga_Skip:	
  
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
  
  MoveAlien3_Apaga_Fim:	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveAlien3_RecalculaPos:
	push r0
	push r1
	push r2
	push r3

	load r0, posAlien3
	load r1, dirAlien3

 MoveAlien3_Esquerda:
 	loadn r2, #0	;se dir = 0
	cmp r1, r2
	jne MoveAlien3_Baixo
	loadn r1, #1
	sub r0, r0, r1
	loadn r1, #924
	cmp r0, r1
	jne MoveAlien3_FimSwitch	; Break do Switch
	loadn r1, #1
	store dirAlien3, r1
	jmp MoveAlien3_FimSwitch
	
 MoveAlien3_Baixo:
 	loadn r2, #1	;se dir = 1
	cmp r1, r2
	jne MoveAlien3_Direita
	loadn r1, #40
	add r0, r0, r1
	loadn r1, #1124
	cmp r0, r1
	jne MoveAlien3_FimSwitch	; Break do Switch
	loadn r1, #2
	store dirAlien3, r1
	jmp MoveAlien3_FimSwitch
	
 MoveAlien3_Direita:
 	loadn r2, #2	;se dir = 2
	cmp r1, r2
	jne MoveAlien3_Cima
	loadn r1, #1
	add r0, r0, r1
	loadn r1, #1151
	cmp r0, r1
	jne MoveAlien3_FimSwitch	; Break do Switch
	loadn r1, #3
	store dirAlien3, r1
	jmp MoveAlien3_FimSwitch
	
 MoveAlien3_Cima:
 	loadn r2, #3	;se dir = 3
	cmp r1, r2
	jne MoveAlien3_FimSwitch
	loadn r1, #40
	sub r0, r0, r1
	loadn r1, #951
	cmp r0, r1
	jne MoveAlien3_FimSwitch	; Break do Switch
	loadn r1, #0
	store dirAlien3, r1

  MoveAlien3_FimSwitch:	
	store posAlien3, R0	; Grava a posicao alterada na memoria
	pop R3
	pop R2
	pop R1
	pop R0
	rts


;----------------------------------
MoveAlien3_Desenha:
	push R0
	push R1
	
	Loadn R1, #'A'	; Alien
	load R0, posAlien3
	outchar R1, R0
	store posAntAlien3, R0
	
	pop R1
	pop R0
	rts

;----------------------------------
;----------------------------------
;--------------------------

MoveAlien4:
	push r0
	push r1
	
	call MoveAlien4_RecalculaPos
	
; So' Apaga e Redezenha se (pos != posAnt)
;	If (pos != posAnt)	{	
	load r0, posAlien4
	load r1, posAntAlien4
	cmp r0, r1
	jeq MoveAlien4_Skip
		call MoveAlien4_Apaga
		call MoveAlien4_Desenha		;}
  MoveAlien4_Skip:
	
	pop r1
	pop r0
	rts
		
; ----------------------------
		
MoveAlien4_Apaga:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntAlien4	; R0 == posAnt
	load R1, posAntNave		; R1 = posAnt
	cmp r0, r1
	jne MoveAlien4_Apaga_Skip
		loadn r5, #'X'		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveAlien4_Apaga_Fim

  MoveAlien4_Apaga_Skip:	
  
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
  
  MoveAlien4_Apaga_Fim:	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveAlien4_RecalculaPos:
	push r0
	push r1
	push r2
	push r3

	load r0, posAlien4
	load r1, dirAlien4

 MoveAlien4_Esquerda:
 	loadn r2, #0	;se dir = 0
	cmp r1, r2
	jne MoveAlien4_Baixo
	loadn r1, #1
	sub r0, r0, r1
	loadn r1, #350
	cmp r0, r1
	jne MoveAlien4_FimSwitch	; Break do Switch
	loadn r1, #1
	store dirAlien4, r1
	jmp MoveAlien4_FimSwitch
	
 MoveAlien4_Baixo:
 	loadn r2, #1	;se dir = 1
	cmp r1, r2
	jne MoveAlien4_Direita
	loadn r1, #40
	add r0, r0, r1
	loadn r1, #870
	cmp r0, r1
	jne MoveAlien4_FimSwitch	; Break do Switch
	loadn r1, #2
	store dirAlien4, r1
	jmp MoveAlien4_FimSwitch
	
 MoveAlien4_Direita:
 	loadn r2, #2	;se dir = 2
	cmp r1, r2
	jne MoveAlien4_Cima
	loadn r1, #1
	add r0, r0, r1
	loadn r1, #877
	cmp r0, r1
	jne MoveAlien4_FimSwitch	; Break do Switch
	loadn r1, #3
	store dirAlien4, r1
	jmp MoveAlien4_FimSwitch
	
 MoveAlien4_Cima:
 	loadn r2, #3	;se dir = 3
	cmp r1, r2
	jne MoveAlien4_FimSwitch
	loadn r1, #40
	sub r0, r0, r1
	loadn r1, #357
	cmp r0, r1
	jne MoveAlien4_FimSwitch	; Break do Switch
	loadn r1, #0
	store dirAlien4, r1

  MoveAlien4_FimSwitch:	
	store posAlien4, R0	; Grava a posicao alterada na memoria
	pop R3
	pop R2
	pop R1
	pop R0
	rts


;----------------------------------
MoveAlien4_Desenha:
	push R0
	push R1
	
	Loadn R1, #'A'	; Alien
	load R0, posAlien4
	outchar R1, R0
	store posAntAlien4, R0
	
	pop R1
	pop R0
	rts

;----------------------------------
;----------------------------------
;--------------------------

MoveAlien5:
	push r0
	push r1
	
	call MoveAlien5_RecalculaPos
	
; So' Apaga e Redezenha se (pos != posAnt)
;	If (pos != posAnt)	{	
	load r0, posAlien5
	load r1, posAntAlien5
	cmp r0, r1
	jeq MoveAlien5_Skip
		call MoveAlien5_Apaga
		call MoveAlien5_Desenha		;}
  MoveAlien5_Skip:
	
	pop r1
	pop r0
	rts
		
; ----------------------------
		
MoveAlien5_Apaga:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntAlien5	; R0 == posAnt
	load R1, posAntNave		; R1 = posAnt
	cmp r0, r1
	jne MoveAlien5_Apaga_Skip
		loadn r5, #'X'		; Se o Tiro passa sobre a Nave, apaga com um X, senao apaga com o cenario 
		jmp MoveAlien5_Apaga_Fim

  MoveAlien5_Apaga_Skip:	
  
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!
	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
  
  MoveAlien5_Apaga_Fim:	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveAlien5_RecalculaPos:
	push r0
	push r1
	push r2
	push r3

	load r0, posAlien5
	load r1, dirAlien5

 MoveAlien5_Esquerda:
 	loadn r2, #0	;se dir = 0
	cmp r1, r2
	jne MoveAlien5_Baixo
	loadn r1, #1
	sub r0, r0, r1
	loadn r1, #733
	cmp r0, r1
	jne MoveAlien5_FimSwitch	; Break do Switch
	loadn r1, #3
	store dirAlien5, r1
	jmp MoveAlien5_FimSwitch
	
 MoveAlien5_Baixo:
 	loadn r2, #1	;se dir = 1
	cmp r1, r2
	jne MoveAlien5_Direita
	loadn r1, #40
	add r0, r0, r1
	loadn r1, #746
	cmp r0, r1
	jne MoveAlien5_FimSwitch	; Break do Switch
	loadn r1, #0
	store dirAlien5, r1
	jmp MoveAlien5_FimSwitch
	
 MoveAlien5_Direita:
 	loadn r2, #2	;se dir = 2
	cmp r1, r2
	jne MoveAlien5_Cima
	loadn r1, #1
	add r0, r0, r1
	loadn r1, #466
	cmp r0, r1
	jne MoveAlien5_FimSwitch	; Break do Switch
	loadn r1, #1
	store dirAlien5, r1
	jmp MoveAlien5_FimSwitch
	
 MoveAlien5_Cima:
 	loadn r2, #3	;se dir = 3
	cmp r1, r2
	jne MoveAlien5_FimSwitch
	loadn r1, #40
	sub r0, r0, r1
	loadn r1, #453
	cmp r0, r1
	jne MoveAlien5_FimSwitch	; Break do Switch
	loadn r1, #2
	store dirAlien5, r1

  MoveAlien5_FimSwitch:	
	store posAlien5, R0	; Grava a posicao alterada na memoria
	pop R3
	pop R2
	pop R1
	pop R0
	rts


;----------------------------------
MoveAlien5_Desenha:
	push R0
	push R1
	
	Loadn R1, #'A'	; Alien
	load R0, posAlien5
	outchar R1, R0
	store posAntAlien5, R0
	
	pop R1
	pop R0
	rts

;----------------------------------
;----------------------------------
;--------------------------



ChecaPos:
	push R0
	push R1
	push R2
	
	load R0, posNave	; TEsta se o Tiro Pegou no Alien
	load R1, posAlien
	cmp R0, R1			; IF posTiro == posAlien  BOOM!!
	jeq ColisaoNave
	
	load R1, posAlien2
	cmp R0, R1			; IF posTiro == posAlien  BOOM!!
	jeq ColisaoNave
	
	load R1, posAlien3
	cmp R0, R1			; IF posTiro == posAlien  BOOM!!
	jeq ColisaoNave
	
	load R1, posAlien4
	cmp R0, R1			; IF posTiro == posAlien  BOOM!!
	jeq ColisaoNave
	
	load R1, posAlien5
	cmp R0, R1			; IF posTiro == posAlien  BOOM!!
	jeq ColisaoNave
	
	loadn r1, #1199
	cmp r0, r1
	jeq Vitoria 
	jmp FimChecagem

Vitoria:
	; Limpa a Tela !!
  	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #0  			; cor branca!
	call ImprimeTela   		;  Rotina de Impresao de Cenario na Tela Inteira
  
	;imprime Voce Venceu !!!
	loadn r0, #526
	loadn r1, #Win
	loadn r2, #0
	call ImprimeStr
	
	;imprime quer jogar novamente
	loadn r0, #605
	loadn r1, #Msg
	loadn r2, #0
	call ImprimeStr
	
	call DigLetra
	loadn r0, #'s'
	load r1, Letra
	cmp r0, r1				; tecla == 's' ?
	jne FimJogo	; tecla nao e' 's'
	
	; Se quiser jogar novamente...
	call ApagaTela
	jmp main

  ColisaoNave:	
	; Limpa a Tela !!
  	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #0  			; cor branca!
	call ImprimeTela   		;  Rotina de Impresao de Cenario na Tela Inteira
  
	;imprime Voce Venceu !!!
	loadn r0, #526
	loadn r1, #Dead
	loadn r2, #0
	call ImprimeStr
	
	;imprime quer jogar novamente
	loadn r0, #605
	loadn r1, #Msg
	loadn r2, #0
	call ImprimeStr
	
	call DigLetra
	loadn r0, #'s'
	load r1, Letra
	cmp r0, r1				; tecla == 's' ?
	jne FimJogo	; tecla nao e' 's'
	
	; Se quiser jogar novamente...
	call ApagaTela
	jmp main
	
FimChecagem:
	pop r2
	pop r1
	pop r0

	rts

 FimJogo:
	call ApagaTela
	halt

;********************************************************
;                       DELAY
;********************************************************		


Delay:
						;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	push R0
	push R1
	
	loadn r1, #5  				; a
   	Delay_volta2:				;Quebrou o contador acima em duas partes (dois loops de decremento)
	loadn r0, #3000				; b
   	Delay_volta: 
	dec r0						; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	jnz Delay_volta	
	dec r1
	jnz Delay_volta2
	
	pop R1
	pop R0
	
	rts							;return

;-------------------------------


;********************************************************
;                       IMPRIME TELA
;********************************************************	

ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;---------------------

;---------------------------	
;********************************************************
;                   IMPRIME STRING
;********************************************************
	
ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;------------------------	
	

;-------------------------------


;********************************************************
;                       IMPRIME TELA2
;********************************************************	

ImprimeTela2: 	;  Rotina de Impresao de Cenario na Tela Inteira
				;  r1 = endereco onde comeca a primeira linha do Cenario
				;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  		; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  		; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  		; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5				; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;---------------------

;---------------------------	
;********************************************************
;                   IMPRIME STRING2
;********************************************************
	
ImprimeStr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

   ImprimeStr2_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		storei r6, r4
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6			; Incrementa o ponteiro da String da Tela 0
		jmp ImprimeStr2_Loop
	
   ImprimeStr2_Sai:	
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	

;------------------------		
;********************************************************
;                   DIGITE UMA LETRA
;********************************************************

DigLetra:	; Espera que uma tecla seja digitada e salva na variavel global "Letra"
	push r0
	push r1
	loadn r1, #255	; Se nao digitar nada vem 255

   DigLetra_Loop:
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq DigLetra_Loop	; Fica lendo ate' que digite uma tecla valida

	store Letra, r0			; Salva a tecla na variavel global "Letra"

	pop r1
	pop r0
	rts



;----------------
	
;********************************************************
;                       APAGA TELA
;********************************************************
ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	
	
;------------------------	
; Declara uma tela vazia para ser preenchida em tempo de execussao:

tela0Linha0  : string "                                        "
tela0Linha1  : string "                                        "
tela0Linha2  : string "                                        "
tela0Linha3  : string "                                        "
tela0Linha4  : string "                                        "
tela0Linha5  : string "                                        "
tela0Linha6  : string "                                        "
tela0Linha7  : string "                                        "
tela0Linha8  : string "                                        "
tela0Linha9  : string "                                        "
tela0Linha10 : string "                                        "
tela0Linha11 : string "                                        "
tela0Linha12 : string "                                        "
tela0Linha13 : string "                                        "
tela0Linha14 : string "                                        "
tela0Linha15 : string "                                        "
tela0Linha16 : string "                                        "
tela0Linha17 : string "                                        "
tela0Linha18 : string "                                        "
tela0Linha19 : string "                                        "
tela0Linha20 : string "                                        "
tela0Linha21 : string "                                        "
tela0Linha22 : string "                                        "
tela0Linha23 : string "                                        "
tela0Linha24 : string "                                        "
tela0Linha25 : string "                                        "
tela0Linha26 : string "                                        "
tela0Linha27 : string "                                        "
tela0Linha28 : string "                                        "
tela0Linha29 : string "                                        "	

; Declara e preenche tela linha por linha (40 caracteres):
tela1Linha0  : string "GO                                      "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "                                        "
tela1Linha4  : string "                                        "
tela1Linha5  : string "                                        "
tela1Linha6  : string "                                        "
tela1Linha7  : string "                                        "
tela1Linha8  : string "                                        "
tela1Linha9  : string "                                        "
tela1Linha10 : string "                                        "
tela1Linha11 : string "                                        "
tela1Linha12 : string "                                        "
tela1Linha13 : string "                                        "
tela1Linha14 : string "                                        "
tela1Linha15 : string "                                        "
tela1Linha16 : string "                                        "
tela1Linha17 : string "                                        "
tela1Linha18 : string "                                        "
tela1Linha19 : string "                                        "
tela1Linha20 : string "                                        "
tela1Linha21 : string "                                        "
tela1Linha22 : string "                                        "
tela1Linha23 : string "                                        "
tela1Linha24 : string "                                        "
tela1Linha25 : string "                                        "
tela1Linha26 : string "                                        "
tela1Linha27 : string "                                        "
tela1Linha28 : string "                                        "
tela1Linha29 : string "                                        "



; Declara e preenche tela linha por linha (40 caracteres):
tela2Linha0  : string "                                        "
tela2Linha1  : string "                                        "
tela2Linha2  : string "                                        "
tela2Linha3  : string "                                        "
tela2Linha4  : string "                                        "
tela2Linha5  : string "                                        "
tela2Linha6  : string "                                        "
tela2Linha7  : string "                                        "
tela2Linha8  : string "                                        "
tela2Linha9  : string "                                        "
tela2Linha10 : string "                                        "
tela2Linha11 : string "                                        "
tela2Linha12 : string "                                        "
tela2Linha13 : string "                                        "
tela2Linha14 : string "                                        "
tela2Linha15 : string "                                        "
tela2Linha16 : string "                                        "
tela2Linha17 : string "                                        "
tela2Linha18 : string "                                        "
tela2Linha19 : string "                                        "
tela2Linha20 : string "                                        "
tela2Linha21 : string "                                        "
tela2Linha22 : string "                                        "
tela2Linha23 : string "                                        "
tela2Linha24 : string "                                        "
tela2Linha25 : string "                                        "
tela2Linha26 : string "                                        "
tela2Linha27 : string "                                        "
tela2Linha28 : string "                                        "
tela2Linha29 : string "                                     END"


; Declara e preenche tela linha por linha (40 caracteres):
tela3Linha0  : string "   |                                    "
tela3Linha1  : string "   |                                    "
tela3Linha2  : string "___|                                    "
tela3Linha3  : string "                                        "
tela3Linha4  : string "                                        "
tela3Linha5  : string "                                        "
tela3Linha6  : string "                                        "
tela3Linha7  : string "                                        "
tela3Linha8  : string "                                        "
tela3Linha9  : string "                                        "
tela3Linha10 : string "                                        "
tela3Linha11 : string "                                        "
tela3Linha12 : string "                                        "
tela3Linha13 : string "                                        "
tela3Linha14 : string "                                        "
tela3Linha15 : string "                                        "
tela3Linha16 : string "                                        "
tela3Linha17 : string "                                        "
tela3Linha18 : string "                                        "
tela3Linha19 : string "                                        "
tela3Linha20 : string "                                        "
tela3Linha21 : string "                                        "
tela3Linha22 : string "                                        "
tela3Linha23 : string "                                        "
tela3Linha24 : string "                                        "
tela3Linha25 : string "                                        "
tela3Linha26 : string "                                     ___"
tela3Linha27 : string "                                    |   "
tela3Linha28 : string "                                    |   "
tela3Linha29 : string "                                    |   "


; Declara e preenche tela linha por linha (40 caracteres):
tela4Linha0  : string "      **********************************"
tela4Linha1  : string "      *                                *"
tela4Linha2  : string "      *           ****                 *"
tela4Linha3  : string "      *           ****                 *"
tela4Linha4  : string "                  ****                 *"
tela4Linha5  : string "****              ****                 *"
tela4Linha6  : string "*                                      *"
tela4Linha7  : string "*          ******************          *"
tela4Linha8  : string "*          ******************          *"
tela4Linha9  : string "*          ******************          *"
tela4Linha10 : string "*   ****                        ****   *"
tela4Linha11 : string "*   ****                        ****   *"
tela4Linha12 : string "*   ****       **********       ****   *"
tela4Linha13 : string "*   ****       **********       ****   *"
tela4Linha14 : string "*   ****       **********       ****   *"
tela4Linha15 : string "*   ****       **********       ****   *"
tela4Linha16 : string "*   ****       **********       ****   *"
tela4Linha17 : string "*   ****       **********       ****   *"
tela4Linha18 : string "*   ****                        ****   *"
tela4Linha19 : string "*   ****                        ****   *"
tela4Linha20 : string "*          ******************          *"
tela4Linha21 : string "*          ******************          *"
tela4Linha22 : string "*          ******************          *"
tela4Linha23 : string "*                                      *"
tela4Linha24 : string "*                 ****              ****"
tela4Linha25 : string "*                 ****                  "
tela4Linha26 : string "*                 ****           *      "
tela4Linha27 : string "*                 ****           *      "
tela4Linha28 : string "*                                *      "
tela4Linha29 : string "**********************************      "