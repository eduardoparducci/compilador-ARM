# A variavel dirtestes indica onde os arquivos teste (.in) estao
dirtestes=./tests
program=$1

# tests sera inicializada com o resultado da expressao find,
# encontrando todos os arquivos .in do diretorio dirtestes
tests=`find $dirtestes -name '*.in'`
sedexpression='s/\.in/\.out/'
# Para cada teste...
for t in $tests
do
  # Executa o programa que foi compilado usando o arquivo de teste.in como
  # entrada
  out=`echo $t | sed $sedexpression`
  #echo $t  
  #echo $out  
  $program < $t > $out
done
