CREATE OR replace FUNCTION kmeans(input_table text, columns text[], clus_num int) RETURNS bytea AS
 
$$
 
from pandas import DataFrame
from sklearn.cluster import KMeans
from cPickle import dumps
 
all_columns = ",".join(columns)
if all_columns == "":
    all_columns = "*"
 
rv = plpy.execute('SELECT %s FROM %s;' % (all_columns, plpy.quote_ident(input_table)))
 
frame = []
 
for i in rv:
    frame.append(i)
df = DataFrame(frame).convert_objects(convert_numeric =True)
kmeans = KMeans(n_clusters=clus_num, random_state=0).fit(df._get_numeric_data())
return dumps(kmeans)
 
$$ LANGUAGE plpythonu;