#!/bin/bash

gff=$1

cat $gff | 
awk '!/^#/{print $1}' | 
sort -u | while read id;
do 
	echo $id;
	cat $gff | 
	grep $id |
	awk 'BEGIN{max = 0}{if($5+0>max+0) max=$5 fi}END{print max}';
done
