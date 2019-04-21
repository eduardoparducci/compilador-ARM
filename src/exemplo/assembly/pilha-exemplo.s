	  ;; Código exemplo de uso de pilha no ARM Assembly
    mov		sp, #0x200
	  mov		r0, #1  
	  stmfd	sp!, {r0}
	  mov		r0, #0
	  ldmfd	sp!, {r0}
