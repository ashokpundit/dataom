<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="row span10">
	<h3>JS Tag for Publishers</h3>
	<div class="well">
		<textarea style="width:100%" width="90%" rows="8" readonly="true">
<script>
	(function() {
	var sp = document.createElement('script'); sp.type = 'text/javascript'; sp.async = true; sp.defer = true;
	sp.src = ('https:' == document.location.protocol ? 'https' : 'http')+ '://pm.dataom.com/ta.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(sp, s);
	})();
</script>
		</textarea>
	</div>
	<br/>
	
	<h3>Data Items Configuration</h3>
	<div class="well">
		<textarea style="width:100%" width="90%" rows="10" readonly="true">
<script>
	  dataLayer = [{
	'PubId': 'PUBLISHER_ID', 
	'DataItemName1': 'DataItemValue1',
	'DataItemName2': 'DataItemValue2',
	'IntegerDataItemName3': 9,
    'DataItemName4': 'DataItemValue4'
      }]; 	   
</script>
		</textarea>
	</div>
</div>