import csv

LAT = 40
LON = -75
RAD = 2

with open ("arbres-publics.csv") as parcs_csv:
    rows = csv.reader (parcs_csv, delimiter=',', quotechar='"')
    for row in rows:
        try:
            lon,lat = float (row [39]), float (row [38])
            if abs (lon-LON) < RAD and abs (lat-LAT) < RAD:
                print ("\"{}\" {} {}".format(row [10], lon, lat))
        except:
            continue
            
    
