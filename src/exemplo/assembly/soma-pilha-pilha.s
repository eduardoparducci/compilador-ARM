	;;	configuraçao pilha
	mov	sp, #0x200
		
	;;	empilhando valores arbitrarios (5 e 3)
	mov	r0, #3
	stmfd	sp!, {r0}
	mov	r0, #5
	stmfd	sp!, {r0}
		
	;;		realizando a operaçao
	ldmfd	sp!, {r1}
	ldmfd	sp!, {r2}
	add	r0, r1, r2
