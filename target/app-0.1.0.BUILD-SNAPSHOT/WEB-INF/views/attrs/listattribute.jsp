<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="row span10">
<h3 style="">Configure Attributes</h3>
	<table class="table table-bordered table-condensed">
		<thead>
			<th>Attribute</th>
			<th>Description</th>
			<th>Expression</th>
			<th>Data Items</th>
			<th></th>
		</thead>
		<tbody>
			<c:forEach items="${attrs}" var="attr">
				<tr>
					<td>${attr.name}</td>
					<td>${attr.description}</td>
					<td>${attr.expr}</td>
					<td>${attr.params}</td>
				
					<td><a href="${baseurl}attrs/update/${attr.id}">edit</a> &nbsp;&nbsp; <a href="${baseurl}attrs/delete/${attr.id}"></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>