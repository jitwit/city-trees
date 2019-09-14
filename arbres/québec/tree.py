import csv

LAT = 46.838
LON = -71.219
RAD = 0.3

with open ("arbres-publics.csv") as parcs_csv:
    rows = csv.reader (parcs_csv, delimiter=',', quotechar='"')
    for row in rows:
        try:
            lon,lat = float (row [11]), float (row [10])
            if abs (lon-LON) < RAD and abs (lat-LAT) < RAD:
                print ("\"{}\" {} {}".format(row [3], lon, lat))
        except:
            continue
            
    
