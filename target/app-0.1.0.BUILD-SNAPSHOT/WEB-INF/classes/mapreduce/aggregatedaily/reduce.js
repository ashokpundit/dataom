function(key, values) {
    
    var returnValue={};
    	for (var idx = 0; idx < values.length; idx++)
        {
            for(var v in values[idx])
            {
                if(typeof values[idx] != "undefined")
                {
                
                    if(typeof returnValue[v] =="undefined" ||returnValue[v]==null)
                        returnValue[v]=parseInt(values[idx][v]) ;
                    else
                        
                    returnValue[v] +=parseInt(values[idx][v]);
            }
            }
        }
	return returnValue;
}