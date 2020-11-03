#!/bin/bash

indexdir=../results/exp2_varying_number_of_vertices_querygraph/index
logdir=../results/exp2_varying_number_of_vertices_querygraph/log

mkdir -p $indexdir
mkdir -p $logdir

datadir=../datasets/exp2
e=../IDAR_index

N=10000
num=10k
range=1-100
for data in AIDO NCI Pubchem
do
	$e $N ${datadir}/${data}/${data}_${range}_${num}.igraph ${indexdir}/${data}_${range}_${num}.didx 2>> ${logdir}/IDAR_ilog_${data}_${range}_${num}.txt
	$e $N ${datadir}/Sup0.1${data}/Sup0.1${data}_${range}_${num}.igraph ${indexdir}/Sup0.1${data}_${range}_${num}.didx 2>> ${logdir}/IDAR_ilog_Sup0.1_${data}_${range}_${num}.txt
done
