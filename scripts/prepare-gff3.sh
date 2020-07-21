#!/bin/bash
GFF_RAW=$1

GFF_SORTED=${GFF_RAW/.gff*/}".sorted.gff3"
echo $GFF_SORTED

#gt gff3 -sortlines -tidy $GFF_RAW > $GFF_SORTED
(grep ^"#" $GFF_RAW; grep -v ^"#" $GFF_RAW | grep -v "^$" | grep "\t" | sort -k1,1 -k4,4n) > $GFF_SORTED
bgzip $GFF_SORTED
tabix -p gff $GFF_SORTED".gz"
