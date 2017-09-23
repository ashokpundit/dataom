function() {
        var keyArr = this._id.day;
        var valueArr = {};   
        valueArr['total']=1;
         for(v in this.value)
         {
             valueArr[v]=1;
         }
	emit(keyArr, valueArr);
};