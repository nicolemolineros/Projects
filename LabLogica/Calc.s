.data

entradaCalc: .asciiz "Calculadora de negocio"
opcionSuma: .asciiz "1. Suma"
opcionResta: .asciiz "2. Resta"
opcionDivision: .asciiz "3. Division"
opcionMulti: .asciiz "4. Multiplicacion"
opcionElegida: .asciiz "Por favor digite el numero de la operación deseada"

entrada1: .asciiz "Por favor digite el primer numero \n"
entrada2: .asciiz "Ahora digite el segundo numero \n"

respuesta: .asciiz "El resultado es: "

.text

#Entrada al sistema
li $v0, 4
la $a0, entradaCalc
syscall

#Opciones Calculadora
li $v0, 4
la $a0, opcionSuma
syscall

li $v0, 4
la $a0, opcionResta
syscall

li $v0, 4
la $a0, opcionMulti
syscall

li $v0, 4
la $a0, opcionDivision
syscall

li $v0, 4
la $a0, opcionElegida
syscall

#Elegir Opcion

li $v0, 5
syscall

#Operaciones

beq		$v0, 1, Suma
beq		$v0, 2, Resta
beq		$v0, 3, Multiplicacion
beq		$v0, 4, Division

Suma:

#numero1
li $v0, 4
la $a0, entrada1
syscall

#Ingreso numero1

li $v0, 7
syscall

#Almacenar numero

mov.d $f4, $f0

#numero2

li $v0, 4
la $a0, entrada2
syscall

#Ingreso numero2

li $v0, 7
syscall

#Almacenar numero

mov.d $f6, $f0

#OperacionSuma

add		$f4, $f4, $f6		# $f4 = f4 + f6

#Resultado

li $v0, 4
la $a0, respuesta 
syscall

Resta:

#numero1
li $v0, 4
la $a0, entrada1
syscall

#Ingreso numero1

li $v0, 7
syscall

#Almacenar numero

mov.d $f4, $f0

#numero2

li $v0, 4
la $a0, entrada2
syscall

#Ingreso numero2

li $v0, 7
syscall

#Almacenar numero

mov.d $f6, $f0

#OperacionResta

sub   $f4, $f4, $f6		# $f4 = f4 - f6

#Resultado

li $v0, 4
la $a0, respuesta 
syscall

Multiplicacion:

#numero1
li $v0, 4
la $a0, entrada1
syscall

#Ingreso numero1

li $v0, 7
syscall

#numero2

li $v0, 4
la $a0, entrada2
syscall

#Ingreso numero2

li $v0, 7
syscall

#OperacionMultiplicacion

mult	$f4, $f6			# $f4 * $f6 = Hi and Lo registers
mflo	$f2					# copy Lo to $f2

#Resultado

li $v0, 4
la $a0, respuesta 
syscall

Division:

#numero1
li $v0, 4
la $a0, entrada1
syscall

#Ingreso numero1

li $v0, 7
syscall


#numero2

li $v0, 4
la $a0, entrada2
syscall

#Ingreso numero2

li $v0, 7
syscall

#OperacionDivision

div		$t1, $t2			# $t1 / $t2
mflo	$t3				# $t3 = floor($t1 / $t2) 
mfhi	$t4					# $t4 = $t1 mod $t2 
				# copy Lo to $f2


#Resultado

li $v0, 4
la $a0, respuesta 
syscall
