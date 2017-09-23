function() {
    //PubId : this._id.PubId
	var keyArr = {u : this._id.u};
	var valueArr = {};
	for (var key in this.value)
        {
	    if (typeof this.value[key] != 'undefined' && this.value[key] != null){
                
		valueArr[key]=this.value[key]; 
            
		
	    }
	}		
	emit(keyArr, valueArr);
};

