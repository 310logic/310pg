CREATE OR replace FUNCTION predict_kmeans(model_table text, model_column text, model_id int, input_values real[]) RETURNS int[] AS
 
$$
 
from cPickle import loads
 
rv = plpy.execute('SELECT %s FROM %s WHERE id = %s;' % (plpy.quote_ident(model_column), plpy.quote_ident(model_table), model_id))
model = loads(rv[0][model_column])
ret = model.predict(input_values)
return ret
 
$$ LANGUAGE plpythonu;