;;		Multiplicaçao de pilha-pilha (3 x 5) com resultado armazenado em r0

;;		Inicializando a pilha
mov		sp, #0x200
;;		Empilhando os operandos
mov		r0, #3
stmfd	sp!, {r0}
mov		r0, #5
stmfd	sp!, {r0}

;;		Inicializando contador da multiplicação
mov		r2, #0
;;		Inicializando resultado da operaçao (r0)
mov		r0, #0


;;		Inicializando valores para realizar operação
ldmfd	sp!, {r1}
ldmfd	sp!, {r3}
;;		compara contador com o segundo valor(3)
m1_b
cmp		r2, r1
beq		m1_e
add		r2, r2, #1
add		r0, r0, r3
b		m1_b
m1_e
