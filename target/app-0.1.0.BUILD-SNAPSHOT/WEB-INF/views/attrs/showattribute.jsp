<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="attr" method="POST" action="${baseurl}attrs" class="form-horizontal well">
	<div class="row form-group">
		<label class="span2">Name</label>
		<div class="span4">${attr.name}</div>
	</div>
	<div class="row form-group">
		<label class="span2">Description</label>
		<form:textarea path="description" placeholder="describe the attribute"
			class="span4" readonly="true"></form:textarea>
	</div>
	<div class="row">
		<label class="span2">Expression</label>
		<div class="span4">${attr.expr}</div>
	</div>
	<div class="row">
		<label class="span2">Params</label>
		<div class="span4">${attr.params}</div>
	</div>
	<div class="row">
		<label class="span2">Disabled</label>
		<form:checkbox path="disabled" readonly="true"></form:checkbox>
	</div>
<%-- 	<form:button name="submit" value="save">Save</form:button> --%>
</form:form>