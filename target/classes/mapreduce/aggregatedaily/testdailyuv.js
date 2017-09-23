var mapfunction=mapfunction=function() {
         //var keyArr = {this._id.day};
        var valueArr = {};   
        valueArr['total']=1;
         for(v in this.value)
         {
             valueArr[v]=1;
         }
    
	emit(this._id.day, valueArr);
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
                        returnValue[v]=values[idx][v];
                    else
                        
                    returnValue[v] +=values[idx][v];
            }
            }
        }
	return returnValue;
};

db.dailyattributes.mapReduce( mapfunction,
                     reducefunction,
                     {
                         
                       out: { merge:  "dailyuv"},
                                            }
                   )