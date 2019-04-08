CREATE OR replace FUNCTION get_kmeans_centroids(model_table text, model_column text, model_id int) RETURNS real[] AS
 
$$
 
from pandas import DataFrame
from cPickle import loads
 
rv = plpy.execute('SELECT %s FROM %s WHERE id = %s;' % (plpy.quote_ident(model_column), plpy.quote_ident(model_table), model_id))
model = loads(rv[0][model_column])
ret = map(list, model.cluster_centers_)
return ret
 
$$ LANGUAGE plpythonu;