#!/bin/bash
# Exercício 2 - Descobrir cores e threads
# Rode este script DE DENTRO do container master, logado como mpiuser.

echo "=========================================="
echo "1) Informações de CPU do Codespace (host)"
echo "=========================================="
nproc
echo "------------------------------------------"
lscpu

echo
echo "=========================================="
echo "2) hostname com numero MAXIMO de cores FISICOS"
echo "   (ajuste o valor -np conforme o 'Core(s) per socket' x 'Socket(s)' do lscpu)"
echo "=========================================="
mpirun --hostfile hosts -np 4 hostname

echo
echo "=========================================="
echo "3) hostname com numero MAXIMO de cores LOGICOS (threads)"
echo "   (soma dos 'slots' do hostfile: 2+2+2+2 = 8)"
echo "=========================================="
mpirun --hostfile hosts -np 8 hostname

echo
echo "=========================================="
echo "4) hostname com o DOBRO do limite de processos"
echo "   (limite = 8 slots, dobro = 16, requer --oversubscribe)"
echo "=========================================="
mpirun --oversubscribe --hostfile hosts -np 16 hostname
