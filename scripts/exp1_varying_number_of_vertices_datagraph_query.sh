#!/bin/bash

indexdir=../results/exp1_varying_number_of_vertices_datagraph/index
logdir=../results/exp1_varying_number_of_vertices_datagraph/log
outputdir=../results/exp1_varying_number_of_vertices_datagraph/output

mkdir -p $logdir
mkdir -p $outputdir

datadir=../datasets/exp1
querydir=../querysets/exp1
e=../IDAR_query

N=10000
num=10k
for data in AIDO NCI Pubchem
do
	for range in 1-20 21-40 41-60 61-80 81-100
	do
		for q in {0..99}
		do
			$e ${indexdir}/${data}_${range}_${num}.didx ${querydir}/${data}_101-/q${q}.qry ${outputdir}/${data}_${range}_${num}_${q}.txt 2>> ${logdir}/IDAR_slog_${data}_${range}_${num}.txt
		done
	done
	for range in 1-10 11-20 21-30 31-40
	do
		for q in {0..99}
		do
			$e ${indexdir}/Sup0.1${data}_${range}_${num}.didx ${querydir}/${data}_101-/q${q}.qry ${outputdir}/Sup0.1${data}_${range}_${num}_${q}.txt 2>> ${logdir}/IDAR_slog_Sup0.1_${data}_${range}_${num}.txt
		done
	done
done
