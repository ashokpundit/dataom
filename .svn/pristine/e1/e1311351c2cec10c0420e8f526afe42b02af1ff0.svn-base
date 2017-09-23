<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="row span10">
	<h3 style="">Configure Segments</h3>
	<table class="table table-bordered table-condensed">
		<thead>
			<th>Segment</th>
			<th>Recency days</th>
			<th>Status</th>
			<th></th>
		</thead>
		<tbody>
			<c:forEach items="${segments}" var="segment">
				<tr>
					<td>${segment.name}</td>
					<td>${segment.recencyDays}</td>
					<td><c:choose>
							<c:when test="${segment.disabled}">inactive</c:when>
							<c:otherwise>active</c:otherwise>
						</c:choose></td>
					<td><a href="${baseurl}segments/update/${segment.id}">edit</a> &nbsp;&nbsp; <a href="${baseurl}segments/delete/${segment.id}"></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>