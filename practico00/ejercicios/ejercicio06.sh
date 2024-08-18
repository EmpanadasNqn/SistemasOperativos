awk '{ print $0, $7-$8 }' ../superliga.in | sort -rnk2 -rnk9 | awk '{ print $1,$2,$3,$4,$5,$6,$7,$8 }'
