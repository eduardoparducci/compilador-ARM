    ;;    Soma entre valor empilhado e literal com resultado salvo em r0

	  ;;		configuraçao pilha
	  mov		sp, #0x200
	
	  ;;		empilhando valor arbitrario (3)
	  mov		r0, #3
	  stmfd	sp!, {r0}
	
	  ;;		realizando a operaçao (5 + 3)
	  mov		r1, #5
	  ldmfd	sp!, {r2}
	  add		r0, r1, r2
