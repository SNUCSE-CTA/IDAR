#!/bin/bash

indexdir=../results/exp1_varying_number_of_vertices_datagraph/index
logdir=../results/exp1_varying_number_of_vertices_datagraph/log

mkdir -p $indexdir
mkdir -p $logdir

datadir=../datasets/exp1
e=../IDAR_index

N=10000
num=10k
for data in AIDO NCI Pubchem
do
	for range in 1-20 21-40 41-60 61-80 81-100
	do
		$e $N ${datadir}/${data}/${data}_${range}_${num}.igraph ${indexdir}/${data}_${range}_${num}.didx 2>> ${logdir}/IDAR_ilog_${data}_${range}_${num}.txt
	done
	for range in 1-10 11-20 21-30 31-40
	do
		$e $N ${datadir}/Sup0.1${data}/Sup0.1${data}_${range}_${num}.igraph ${indexdir}/Sup0.1${data}_${range}_${num}.didx 2>> ${logdir}/IDAR_ilog_Sup0.1_${data}_${range}_${num}.txt
	done
done
