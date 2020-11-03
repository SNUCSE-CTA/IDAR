#!/bin/bash

indexdir=../results/exp2_varying_number_of_vertices_querygraph/index
logdir=../results/exp2_varying_number_of_vertices_querygraph/log
outputdir=../results/exp2_varying_number_of_vertices_querygraph/output

mkdir -p $logdir
mkdir -p $outputdir

datadir=../datasets/exp2
querydir=../querysets/exp2
e=../IDAR_query

N=10000
num=10k
range=1-100
for data in AIDO
do
	for query_range in 101-120 121-140 141-160 161-
	do
		for q in {0..99}
		do
			$e ${indexdir}/${data}_${range}_${num}.didx ${querydir}/${data}_${query_range}/q${q}.qry ${outputdir}/${data}_${query_range}_${num}_${q}.txt 2>> ${logdir}/IDAR_slog_${data}_${query_range}_${num}.txt
		done
		for q in {0..99}
		do
			$e ${indexdir}/Sup0.1${data}_${range}_${num}.didx ${querydir}/${data}_${query_range}/q${q}.qry ${outputdir}/Sup0.1${data}_${query_range}_${num}_${q}.txt 2>> ${logdir}/IDAR_slog_Sup0.1_${data}_${query_range}_${num}.txt
		done
	done
done

for data in NCI Pubchem
do
	for query_range in 101-120 121-140 141-160 161-180 181-200 201-
	do
		for q in {0..99}
		do
			$e ${indexdir}/${data}_${range}_${num}.didx ${querydir}/${data}_${query_range}/q${q}.qry ${outputdir}/${data}_${query_range}_${num}_${q}.txt 2>> ${logdir}/IDAR_slog_${data}_${query_range}_${num}.txt
		done
		for q in {0..99}
		do
			$e ${indexdir}/Sup0.1${data}_${range}_${num}.didx ${querydir}/${data}_${query_range}/q${q}.qry ${outputdir}/Sup0.1${data}_${query_range}_${num}_${q}.txt 2>> ${logdir}/IDAR_slog_Sup0.1_${data}_${query_range}_${num}.txt
		done
	done
done
