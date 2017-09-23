function(key, values) {
    
    var returnValue={};
    	for (var idx = 0; idx < values.length; idx++)
        {
            for(var v in values[idx])
            {
                if(typeof values[idx] != "undefined")
                {
                
                    if(typeof returnValue[v] =="undefined" ||returnValue[v]==null)
                        returnValue[v]=1;
                    else
                        
                    returnValue[v] +=1;
            }
            }
        }
	return returnValue;
}