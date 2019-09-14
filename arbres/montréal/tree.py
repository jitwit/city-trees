import csv

LAT = 45.55
LON = -73.55
RAD = 0.5

with open ("arbres-publics.csv") as parcs_csv:
    rows = csv.reader (parcs_csv, delimiter=',', quotechar='"')
    for row in rows:
        try:
            lon,lat = float (row [20]), float (row [21])
            if abs (lon-LON) < RAD and abs (lat-LAT) < RAD:
                print ("\"{}\" {} {}".format(row [13], row [20],row [21]))
        except:
            continue
            
    
