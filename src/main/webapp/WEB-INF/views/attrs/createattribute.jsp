<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="attr" method="POST" action="${baseurl}attrs/create" class="form-horizontal well">
	<h3>Attribute</h3>
	<div class="row form-group">
		<label class="span2">Name*</label>
		<form:input path="name" placeholder="attribute name" class="span4"></form:input>
	</div>
	<div class="row form-group">
		<label class="span2">Description</label>
		<form:textarea path="description" placeholder="describe the attribute"
			class="span4"></form:textarea>
	</div>
	<div class="row">
		<label class="span2"><a title="Enter expression in terms of data items in JavaScript language syntax. Must evaluate to boolean true or false">Expression*</a></label>
		<form:input path="expr" placeholder="expression" class="span4"></form:input>
	</div>
	<div class="row">
		<label class="span2"><a title="Comma separated list of Data items used in evaluating this attribute.">Data Items*</a></label>
		<form:input path="params" class="span4"></form:input>
	</div>
	<div class="row">
		<label class="span2">Disabled</label>
		<form:checkbox path="disabled"></form:checkbox>
	</div>
	<form:button name="submit" value="save" class="btn-primary">Save</form:button>
</form:form>