#!/bin/bash

indexdir=../results/exp3_varying_number_of_datagraph/index
logdir=../results/exp3_varying_number_of_datagraph/log
outputdir=../results/exp3_varying_number_of_datagraph/output

mkdir -p $logdir
mkdir -p $outputdir

datadir=../datasets/exp3
querydir=../querysets/exp3
e=../IDAR_query

range=1-100
for data in AIDO NCI Pubchem
do
	for N in 10000 20000 40000 60000 80000 100000
	do
		let num=N/1000
		num="${num}k"
		for q in {0..99}
		do
			$e ${indexdir}/${data}_${range}_${num}.didx ${querydir}/${data}_101-/q${q}.qry ${outputdir}/${data}_${range}_${num}_${q}.txt 2>> ${logdir}/IDAR_slog_${data}_${range}_${num}.txt
		done
		for q in {0..99}
		do
			$e ${indexdir}/Sup0.1${data}_${range}_${num}.didx ${querydir}/${data}_101-/q${q}.qry ${outputdir}/Sup0.1${data}_${range}_${num}_${q}.txt 2>> ${logdir}/IDAR_slog_Sup0.1_${data}_${range}_${num}.txt
		done
	done
done
