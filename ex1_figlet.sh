#!/bin/bash
# Exercício 1 - Figlet distribuído
# Cada palavra da frase é impressa por um processo/rank diferente.
# Rode este script DE DENTRO do container master, logado como mpiuser.
#
# IMPORTANTE: troque SEU_NOME pelo seu nome antes de executar.

mpirun --hostfile hosts -np 4 bash -c '
words=("Ola" "Mack," "sou" "SEU_NOME")
palavra=${words[$OMPI_COMM_WORLD_RANK]}
echo "Rank $OMPI_COMM_WORLD_RANK em $(hostname):"
figlet "$palavra"
'
