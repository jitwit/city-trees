csv-url ::= "https://data.cityofnewyork.us/api/views/5rq2-4hqu/rows.csv?accessType=DOWNLOAD"

new-york.png : tree.gp plot.csv
	gnuplot $< > $@

plot.csv : tree.ss arbres.csv
	echo "(write-for-gnuplot)" | scheme -q $< > $@

arbres.csv : tree.py arbres-publics.csv
	python $< > $@

arbres-publics.csv :
	wget $(csv-url) -O $@

clean :
	rm *~

.phony : clean

