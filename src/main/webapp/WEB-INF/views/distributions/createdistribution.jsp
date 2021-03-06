<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="distribution" method="POST" action="${baseurl}distributions/create" class="form-horizontal well">
	<h3>Distribution</h3>
	<div class="row form-group">
		<label class="span2">Name</label>
		<form:input path="name" placeholder="distribution name" class="span4"></form:input>
	</div>
	<div class="row form-group hide">
		<label class="span2">Type</label>
		<form:input path="dtype" placeholder="distribution type"
			class="span4"></form:input>
	</div>
	<div class="row form-group">
		<label class="span2">Description</label>
		<form:textarea path="description" placeholder="describe the distribution"
			class="span4"></form:textarea>
	</div>
	<div class="row">
		<label class="span2"><a title="Enter the distributions pixel call url">SyncCall</a></label>
		<form:input path="syncCall" placeholder="Synch Call" class="span4"></form:input>
	</div>
	
	<div class="row">
		<label class="span2">FTP Address</label>
		<form:input path="ftpAddress" class="span4" placeholder="IP or Host name without ftp://"></form:input>
	</div>
	<div class="row">
		<label class="span2">FTP Directory</label>
		<form:input path="ftpDir" class="span4"></form:input>
	</div>

	<div class="row">
		<label class="span2">FTP User</label>
		<form:input path="ftpUser" class="span4"></form:input>
	</div>
	<div class="row">
		<label class="span2">FTP Password</label>
		<form:password path="ftpPass" class="span4"></form:password>
	</div>
	<div class="row hide">
		<label class="span2">Secure FTP</label>
		<form:input path="ftpIsSecure" class="span4"></form:input>
	</div>
	<div class="row">
		<label class="span2">Disabled</label>
		<form:checkbox path="disabled"></form:checkbox>
	</div>
	<form:hidden path="id"/>
	<form:button name="submit" value="save" class="btn-primary">Save</form:button>
</form:form>