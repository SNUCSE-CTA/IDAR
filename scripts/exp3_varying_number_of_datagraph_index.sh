#!/bin/bash

indexdir=../results/exp3_varying_number_of_datagraph/index
logdir=../results/exp3_varying_number_of_datagraph/log

mkdir -p $indexdir
mkdir -p $logdir

datadir=../datasets/exp3
e=../IDAR_index

range=1-100
for data in AIDO NCI Pubchem
do
	for N in 10000 20000 40000 60000 80000 100000
	do
		let num=N/1000
		num="${num}k"
		$e $N ${datadir}/${data}/${data}_${range}_${num}.igraph ${indexdir}/${data}_${range}_${num}.didx 2>> ${logdir}/IDAR_ilog_${data}_${range}_${num}.txt
		$e $N ${datadir}/Sup0.1${data}/Sup0.1${data}_${range}_${num}.igraph ${indexdir}/Sup0.1${data}_${range}_${num}.didx 2>> ${logdir}/IDAR_ilog_Sup0.1_${data}_${range}_${num}.txt
	done
done
