<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="row span10">
<h3>Distributions</h3>
	<table class="table table-bordered table-condensed">
		<thead>
			<th></th>
			<th>Distribution</th>
			<th>Mapping URL</th>
			<th>FTP Address</th>
			<th></th>
		</thead>
		<tbody>
			<c:forEach items="${distributions}" var="distribution">
				<tr>
					<td><input type="checkbox" <c:if test="${distribution.disabled eq false}">checked</c:if> ></td>
					<td>${distribution.name}</td>
					<td>${distribution.syncCall}</td>
					<td>${distribution.ftpAddress}</td>
					<td><a href="${baseurl}distributions/update/${distribution.id}">edit</a>
						&nbsp;&nbsp; <a href="${baseurl}distribution/delete/${distribution.id}"></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>