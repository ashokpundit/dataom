function() {
   var today=new Date();
    
    today.setDate(today.getDate()-1);
    today.setMilliseconds(0);
    today.setSeconds(0);
    today.setMinutes(0);
    today.setHours(0);

    
    var day1 = today;
    var keyArr = {u : this.u,day:day1};
	var valueArr = {};
	for (var key in this)
        {
	    if (typeof this[key] != 'undefined' && this[key] != null){
                if(key.substring(0, 1)=='A')
                {
                	valueArr[key]="1"; 
                }
	    }
	}		
	emit(keyArr, valueArr);
};
