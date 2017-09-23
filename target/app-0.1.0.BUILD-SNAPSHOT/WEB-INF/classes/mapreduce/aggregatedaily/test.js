var mapfunction=function() {
    var today=new Date();
    
    today.setDate(today.getDate()-1);
    var day1 = today;//Date..UTC(today.getFullYear(), today.getMonth(), today.getDate());
	var keyArr = {u : this.u, PubId : this.PubId,day:day1};
	var valueArr = {};
	for (var key in this)
        {
	    if (typeof this[key] != 'undefined' && this[key] != null){
                if(key.substring(0, 1)=='A')
                {
		valueArr[key.substring(1,key.length)]="1"; 
            }
		
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
                        returnValue[v]=1;
                    else
                        
                    returnValue[v] +=1;
            }
            }
        }
	return returnValue;
};

db.attributes11112013.mapReduce( mapfunction,
                     reducefunction,
                     {
                         
                       out: { merge:  "dailyaggregate"},
                                            }
                   )