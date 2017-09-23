<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="row span10">
	<h1>${title}</h1>
     
        
</div>
        <div id=""attributes></div>        
		<script src="/app/resources/js/Chart.js"></script>
		<meta name = "viewport" content = "initial-scale = 1, user-scalable = no">
		<style>
			canvas{
			}
		</style>

		<canvas id="canvas" height="450" width="600"></canvas>

	<script>
            var jsonData=${jsonData};
//console.log(jsonData);
var labels=[];
var dataSet=[];
for(a in jsonData)
{
  //  console.log(jsonData[a]);
  dayDate = new Date(jsonData[a]._id.$date);
 
    labels.push(dayDate.getDate());
    for(v in jsonData[a].value)
    {
        if(v!="total")
            continue;
        
        if(typeof dataSet[v]!='undefined')
        {
            dataSet[v].push(jsonData[a].value[v]);
        }
        else
            
            {
                dataSet[v]=[];
                
                dataSet[v].push(jsonData[a].value[v]);
            }
    }
}
//console.log(labels);
//console.log(dataSet);
var dataArr=[];
//colors=[{"rgba(220,220,220,0.5)","rgba(220,220,220,1)","rgba(220,220,220,1)"},{"rgba(151,187,205,0.5)","rgba(151,187,205,1)","rgba(151,187,205,1)"},];
var counter=150;
for(c in dataSet)
{
    
    //if(c==="total")
   dataArr.push({
					fillColor : counter,//"rgba(220,220,220,0.5)",
					strokeColor :counter,// "rgba(220,220,220,1)",
					pointColor : counter,//"rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					data : dataSet[c]
				});
                                counter+=5;
   
   
}
console.log(dataArr); 
		var lineChartData = {
			labels : labels,
			datasets : dataArr
			
		}

	var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Line(lineChartData);
	
	</script>
