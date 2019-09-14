arbres-publics-url ::= "https://www.donneesquebec.ca/recherche/dataset/34103a43-3712-4a29-92e1-039e9188e915/resource/13a51853-a5b5-4add-8791-02ccba5c1be7/download/vdq-arbrerepertorie.csv"

québec.png : tree.gp plot.csv
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

