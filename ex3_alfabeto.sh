#!/bin/bash
# Exercício 3 - Cluster soletrando o alfabeto
# Cada processo (rank 0 a 25) imprime uma letra diferente em banner (figlet),
# mostrando também o nome do host onde rodou.
# Rode este script DE DENTRO do container master, logado como mpiuser.
# Requer --oversubscribe pois temos 26 processos e apenas 8 slots no hostfile.

mpirun --oversubscribe --hostfile hosts -np 26 bash -c '
letras=({a..z})
letra=${letras[$OMPI_COMM_WORLD_RANK]}
echo "Rank $OMPI_COMM_WORLD_RANK - Host: $(hostname)"
figlet "$letra"
'
