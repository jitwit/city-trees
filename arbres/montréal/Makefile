arbres-publics-url ::= "http://donnees.ville.montreal.qc.ca/dataset/3e3efad6-9f2f-4cc0-8f1b-92de1ccdb282/resource/c6c5afe8-10be-4539-8eae-93918ea9866e/download/arbres-publics.csv"

montréal.png : tree.gp plot.csv
	gnuplot $< > $@

plot.csv : tree.ss arbres.csv
	echo "(write-for-gnuplot)" | scheme -q $< > $@

arbres.csv : tree.py arbres-publics.csv
	python $< > $@

arbres-publics.csv :
	wget $(arbres-publics-url) -O $@

clean :
	rm *~

.phony : clean

