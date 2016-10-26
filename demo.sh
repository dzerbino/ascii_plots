#!/bin/bash
set -x 

cat test.tsv
cut -f1,2 test.tsv | ./cor
cat test.tsv | ./summary 
cut -f1 test.tsv | ./bars
awk 'func r(){return sqrt(-2*log(rand()))*cos(6.2831853*rand())}BEGIN{for(i=0;i<10000;i++)s=s"\n"0.5*r();print s}' | ./hist 0.1
awk 'func r(){return sqrt(-2*log(rand()))*cos(6.2831853*rand())}BEGIN{for(i=0;i<10000;i++)s=s"\n"0.5*r()"\t"0.5*r();print s}' | ./scatter
awk 'BEGIN{for(i=0;i<100;i++)s=s"\n"sin(i/10);print s}' | ./curve
cat test.tsv | ./column_descriptions
