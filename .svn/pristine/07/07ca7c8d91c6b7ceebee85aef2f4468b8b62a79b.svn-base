
var MongoClient = require('mongodb').MongoClient
    , format = require('util').format;    
var getUserId = function()
{
length=24;
chars='0123456789abcdefghijklmnopqrstuvwxyz';
    var result = '';
    for (var i = length; i > 0; --i) result += chars[Math.round(Math.random() * (chars.length - 1))];
    return result;
};

var getDateString=function ( ) {
var todayMinusDays =Math.floor((Math.random()*60));
//	console.log(todayMinusDays);
	var today=new Date();
    today.setDate(today.getDate()-todayMinusDays);
    
	var str =  "" + today.getFullYear() + ((today.getMonth() < 9) ? "0" : "") + (today.getMonth()+1) + ((today.getDate() < 10) ? "0" : "") + today.getDate();
		return str;
	};
var getDateArr=function ( ) {
var daysArry=[];
//var todayMinusDays =Math.floor((Math.random()*60));
for(todayMinusDay=0;todayMinusDay<60;todayMinusDay++)
{
//      console.log(todayMinusDays);
        var today=new Date();
    today.setDate(today.getDate()-todayMinusDay);

        daysArry[todayMinusDay] =  "" + today.getFullYear() + ((today.getMonth() < 9) ? "0" : "") + (today.getMonth()+1) + ((today.getDate() < 10) ? "0" : "") + today.getDate();
} 
               return daysArry;
        };


var dates=getDateArr();
  MongoClient.connect('mongodb://127.0.0.1:27017/dataom', function(err, db) {
    if(err) throw err;
for(counter=0;counter<10000;counter++)
{
var userId = getUserId();

for(day=10;day>=0;day--)
{
console.log("for user "+counter+" day "+day);
//var daysToBack=Math.floor((Math.random()*30));
var datestr = dates[Math.floor((Math.random()*30))];//getDateString();

//console.log(datestr);

//{ "_id" : ObjectId("5280c616e4b0a95448ff2028"), "u" : "af9223a7e89343018c16aaf864b534ed", "ip" : "127.0.0.1", "_dn" : "wwwq", "A1" : 1 }
var dataToInsert={  "u" : userId, "ip" : "127.0.0.1", "_dn" : "wwwq" };
//continue;

var counter2No=Math.floor((Math.random()*10));
var attrArray={"0":"A1","1":"A2","2":"A3","3":"A4","4":"A5","5":"A6","6":"A6","7":"A7","8":"A8","9":"A9","10":"A10"};
for(counter2=0;counter2<counter2No;counter2++)
{
	dataToInsert[attrArray[Math.floor((Math.random()*10))]]=1;
}
console.log(dataToInsert);
/*    db.collection('raw'+datestr).insert(dataToInsert, {w:1}, function(err, objects) {
      if (err) console.warn(err.message);
      if (err && err.message.indexOf('E11000 ') !== -1) {
        // this _id was already inserted in the database
      }
return;
    });*/

}
}
return ;  });
return ;
