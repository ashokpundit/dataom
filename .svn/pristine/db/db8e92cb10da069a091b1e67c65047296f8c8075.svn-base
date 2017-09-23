<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<spring:url value="/" scope="application" var="baseurl"></spring:url>
<link rel='stylesheet' type='text/css'
	href='${baseurl}resources/styles/bootstrap.min.css'>
<link rel='stylesheet' type='text/css'
	href='${baseurl}resources/styles/jquery-ui-1.8.23.custom.css'>
<link rel='stylesheet' type='text/css'
	href='${baseurl}resources/styles/dataomap.css'>

<script src="${baseurl}resources/js/jquery-1.8.2.min.js"></script>
<script src="${baseurl}resources/js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="${baseurl}resources/js/jquery.validate.js"></script>

<spring:url value="/resources/j_spring_security_check" var="form_url" />
<div style="width: 100%; height: 100%;">
	<div id="loginform">
		<div id="loginheader" class="well">
			<h5>Dataom App</h5>
		</div>
		<form action="${fn:escapeXml(form_url)}" method="POST">
			<!-- <div class="span5"><h5>Login form</h5></div>
			<hr/> -->
			<label class=""><strong>Username</strong></label> <input
				class="span5" type="text" name="j_username"
				placeholder="Enter your username" required="required"> <label
				class=""><strong>Passward</strong></label> <input class="span5"
				type="password" name="j_password" placeholder="Enter your password"
				required="required">
			<button>Log in</button>
			<a href="#" class="pull-right"></a>
			<br/><br/>
			<c:if test="${not empty param.login_error}">
				<div class="errors">
					<p>
						<spring:message code="security_login_unsuccessful" />
						<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
						.
					</p>
				</div>
			</c:if>
			<c:if test="${empty param.login_error}">
				<p>
					<spring:message code="security_login_message" />
				</p>
			</c:if>
		</form>
	</div>
</div>