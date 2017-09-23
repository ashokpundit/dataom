<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="attr" method="POST"
	action="${baseurl}attrs/update" class="form-horizontal well">
	<%-- <div class="row form-group">
		<label class="span2">ID</label>
		<form:input path="id" placeholder="attribute name" class="span4"
			readonly="readonly"></form:input>
	</div> --%>

	<div class="row form-group">
		<label class="span2">Name</label>
		<form:input path="name" placeholder="attribute name" class="span4"></form:input>
	</div>
	<div class="row form-group">
		<label class="span2">Description</label>
		<form:textarea path="description" placeholder="describe the attribute"
			class="span4"></form:textarea>
	</div>
	<div class="row">
		<label class="span2">Expression</label>
		<form:input path="expr" placeholder="expression" class="span4"></form:input>
	</div>
	<div class="row">
		<label class="span2">Params</label>
		<form:input path="params" class="span4"></form:input>
	</div>
	<div class="row">
		<label class="span2">Disabled</label>
		<form:checkbox path="disabled"></form:checkbox>
	</div>
	
	<%-- <div class="row">
		<label class="span2">Last 30 day polulation</label>
		<form:input path="population30d"></form:input>
	</div>
	<div class="row">
		<label class="span2">Last 60 day population</label>
		<form:input path="population60d"></form:input>
	</div>
	<div class="row">
		<label class="span2">Daily population</label>
		<form:input path="populationDaily"></form:input>
	</div>
	
	<div class="row">
		<label class="span2">Domain</label>
		<form:input path="dn"></form:input>
	</div> --%>
	<form:hidden path="id"/> 
	<form:button name="submit" value="save">Save</form:button>
</form:form>