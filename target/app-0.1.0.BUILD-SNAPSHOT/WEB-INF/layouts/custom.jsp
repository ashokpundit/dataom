<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link rel='stylesheet' type='text/css'
	href='${baseurl}/resources/styles/bootstrap.min.css'>
<link rel='stylesheet' type='text/css'
	href='${baseurl}resources/styles/jquery-ui-1.8.23.custom.css'>
<link rel='stylesheet' type='text/css'
	href='${baseurl}resources/styles/dataomap.css'>

<script src="${baseurl}resources/js/jquery-1.8.2.min.js"></script>
<script src="${baseurl}resources/js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="${baseurl}resources/js/jquery.jstree.js"></script>
<script src="${baseurl}resources/js/jquery.validate.js"></script>
<spring:url value="/" scope="application" var="baseurl"></spring:url>
<div style="width:100%;height: 0px">
<div id="errorDiv">
	<c:if test="${not empty success}">
		<div class="alert alert-success">
			<span class="awe-ok"></span> ${success}
			<button class="close" data-dismiss="alert">x</button>
		</div>
	</c:if>
	<c:if test="${not empty error}">
		<div class="alert alert-error">
			<span class="awe-bell-alt"></span> ${error}
			<button class="close" data-dismiss="alert">x</button>
		</div>
	</c:if>
	<c:if test="${not empty info}">
		<div class="alert alert-info">
			<span class="awe-info-sign"></span> ${info}
			<button class="close" data-dismiss="alert">x</button>
		</div>
	</c:if>
	<c:if test="${not empty system_msg}">
		<div class="alert">
			<span class="awe-bell-alt"></span> ${system_msg}
			<button class="close" data-dismiss="alert">x</button>
		</div>
	</c:if>
</div>
</div>
<tiles:insertAttribute name="header" ignore="true" />

<div id="content">
	<div id="sidebar">
		<tiles:insertAttribute name="sidebar" ignore="true" />
	</div>
	<div id="body" class="span10">
		<tiles:insertAttribute name="body" />
	</div>
</div>
<div id="footer">
	<tiles:insertAttribute name="footer" ignore="true" />
</div>
<script>
$("document").ready(function(){
    $("#errorDiv .close").click(function(e){
		$("#errorDiv").empty();
    });
})
</script>