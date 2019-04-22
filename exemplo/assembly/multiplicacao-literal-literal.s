	;;		Multiplicaçao de literais (2 x 3) com resultado armazenado em r0
	
	;;		Inicializando primeiro valor(r1) e contador(r2)
	mov		r1, #2
	mov		r2, #0
	
	;;		Inicializando resultado da operaçao (r0)
	mov		r0, #0
	
	;;		compara contador com o segundo valor(3)
m1_b
	cmp		r2, #3
	beq		m1_e
	add		r2, r2, #1
	add		r0, r0, r1
	b		m1_b
m1_e
