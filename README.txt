These are just some silly scripts which I like to have on my command line when I'm doing quick and dirty 
data analysis and can't be bothered to start R. They all receive the data by piping, typically downstream of awk, cut... 

cor - correlation:
	Takes in stdin a file with two columns, print out Pearson correlation.

summary:
	Takes in stdin a tab delimited data file with headers and prints out basic stats on each column (name, min, mean, max, sum)

hist - histogram:
	Either:
		Takes in a single column of numbers, displays histogram
	or:
		Takes in a double column of numbers, and displays a weighted histogram of the data, assuming the first column are values and the second column weights
	The size of the bins is 1 by default, but can be specified as an option

scatter:
	Takes in a double column of numbers, and displays a sketchy ascii density plot.
