<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="row form-group">
	<label class="span2">Name</label>
	<div class="span4">${distribution.name}</div>
</div>
<div class="row form-group">
	<label class="span2">Type</label>
	<div class="span4">${distribution.dtype}</div>
</div>
<div class="row form-group">
	<label class="span2">Description</label>
	<div class="span4">${distribution.description}</div>
</div>
<div class="row">
	<label class="span2">SyncCall</label>
	<div class="span4">${distribution.syncCall}</div>
</div>

<div class="row">
	<label class="span2">FTP Address</label>
	<div class="span4">${distribution.ftpAddress}</div>
</div>
<div class="row">
	<label class="span2">FTP Directory</label>
	<div class="span4">${distribution.ftpDir}</div>
</div>

<div class="row">
	<label class="span2">FTP User</label>
	<div class="span4">${distribution.ftpUser}</div>
</div>

<div class="row">
	<label class="span2">Secure FTP</label>
	<div class="span4">${distribution.ftpIsSecure}</div>
</div>
<div class="row">
	<label class="span2">Disabled</label>
	<div class="span4">${distribution.disabled}</div>
</div>
<form:hidden path="id" />
