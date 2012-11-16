These are just some silly scripts which I like to have on my command line when I'm doing quick and dirty 
data analysis and can't be bothered to start R. They all receive the data by piping, typically downstream of awk, cut... 

They all handle non-numeric data as NA.

For a quick demo, run:
> sh demo.sh

* cor - correlation:
	Takes in stdin a file with two columns, print out Pearson correlation.

> cut -f1,2 test.tsv | ./cor

* summary:
	Takes in stdin a tab delimited data file with or without headers (anything numeric is assumed to be data, anything else NA) and prints out basic stats on each column (position, header (or first value), min, mean, max, sum)

> cat test.tsv | ./summary

* hist - histogram:
	Either:
		Takes in a single column of numbers, displays histogram
	or:
		Takes in a double column of numbers, and displays a weighted histogram of the data, assuming the first column are values and the second column weights
	The size of the bins is 1 by default, but can be specified as an option

> cut -f1 test.csv | ./hist
> cut -f1 test.csv | ./hist 10
> cut -f1,2 test.csv | ./hist
> awk 'func r(){return sqrt(-2*log(rand()))*cos(6.2831853*rand())}BEGIN{for(i=0;i<10000;i++)s=s"\n"0.5*r();print s}' | hist 0.1

* scatter:
	Takes in a double column of numbers, and displays a sketchy ascii density plot.

> cut -f1,2 test.csv | ./scatter
> awk 'func r(){return sqrt(-2*log(rand()))*cos(6.2831853*rand())}BEGIN{for(i=0;i<10000;i++)s=s"\n"0.5*r()"\t"0.5*r();print s}' | ./scatter
