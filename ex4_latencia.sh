#!/bin/bash
# Exercício 4 - Descobrir qual máquina tem a menor latência (ping) em relação ao master.
# Rode este script DE DENTRO do container master, logado como mpiuser.
# Cada host executa 1 processo MPI (-np 1 --host X) que faz ping para o master
# e imprime o tempo médio (avg) de resposta.

echo "Testando latencia de cada worker em relacao ao master..."
echo

for node in master worker1 worker2 worker3; do
  echo "== $node -> master =="
  mpirun -np 1 --host $node ping -c 4 master | tail -3
  echo
done

echo "Compare os valores de 'rtt min/avg/max/mdev' acima:"
echo "o node com o menor 'avg' e o que tem a menor latencia ate o master."
