var mapfunction=function() {
    
	var keyArr = {u : this._id.u,PubId : this._id.PubId};
	var valueArr = {};
	for (var key in this.value)
        {
	    if (typeof this.value[key] != 'undefined' && this.value[key] != null){
                
		valueArr[key]=this.value[key]; 
            
		
	    }
	}		
	emit(keyArr, valueArr);
};


var reducefunction=function(key, values) {
    
    var returnValue={};
    	for (var idx = 0; idx < values.length; idx++)
        {
            for(var v in values[idx])
            {
                if(typeof values[idx] != "undefined")
                {
                
                    if(typeof returnValue[v] =="undefined" ||returnValue[v]==null)
                        returnValue[v]=0;
                    else
                        
                    returnValue[v] +=values[idx][v];
            }
            }
        }
	return returnValue;
};

db.dailyaggregate.mapReduce( mapfunction,
                     reducefunction,
                     {
                        // query: {$gte:{"day":"1383490148"}},
                       out: { merge:  "dailyaggregate7"},
                                            }
                   )