function() {
    var day1 = Date.UTC(this.date.getFullYear(), this.date.getMonth(), this.date.getDate());
//,PubId : this.PubId	
    var keyArr = {u : this.u,day:day1};
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
