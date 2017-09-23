<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="span10">
	<div class="row">
		<label class="span2">Name</label>
		<div class="span4" >${segment.name}</div>
	</div>
	<div class="row">
		<label class="span2">Description</label>
		<div class="span4" >${segment.description}</div>
	</div>
	<div class="row">
		<label class="span2">Disabled</label>
		<input type="checkbox" <c:if test="${segment.disabled eq true}">checked</c:if> readonly="readonly">
	</div>
	<div class="row">
		<label class="span2">Historic</label>
		<input type="checkbox" <c:if test="${segment.historicNature ne true}">checked</c:if> readonly="readonly">
	</div>
	<div class="row">
		<label class="span2">Recency Days</label>
		<div class="span4" >${segment.recencyDays}</div>
	</div>
	<form:hidden path="id" />
	<%-- <div class="row">
		<label class="span2">Atrribute</label> <select name="attributes"
			class="span2">
			<c:forEach items="${attrs}" var="attr">
				<option value="${attr.id}">${attr.expr}</option>
			</c:forEach>
		</select>
		<button id="addattr">add to group</button>
	</div> --%>
	<div class="row">
		<label class="span2"> Expression</label>
		<div class=" span10">
			<div class="">
				<table id="segmenttable"
					class="table table-bordered table-condensed">
					<thead>
						<th></th>
						<th>Attibute</th>

						<th>Min Freq(#)</th>
						<th>Conjuction</th>
						<th>Actions</th>
					</thead>
					<tbody>
						
							<c:if test="${not empty segment.conditions}">
								<c:forEach items="${segment.conditions}" var="condition"
									varStatus="i">

									<tr>
										<td><input type="radio" name="attrsel"></td>
										<td><input type="hidden" name="conditions[0].attrs"
											value="${condition.attrs}"></td>

										<td><input type="text" name="conditions[0].minFrequency"
											value="${condition.minFrequency}"></td>
										<td><select name="conditions[0].conjunction">
												<option <c:if test="${condition.conjunction eq 'AND'}"> selected </c:if> >AND</option>
												<option <c:if test="${condition.conjunction eq 'OR'}"> selected </c:if> >OR</option>
										</select></td>

										<td></td>
									</tr>
								</c:forEach>

							</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<label class="span2">Distribution</label>
		<div class="span10">
			<table id="distributiontable"
				class="table table-bordered table-condensed">
				<thead>
					<th>Name</th>
					<th>ID Value</th>
					<th></th>
				</thead>
				<tbody>
					<tr>
						<td><select onchange="updatemapKey(this)"><c:forEach
									items="${distribution}" var="dist">
									<option value="${dist.id}">${dist.name}</option>
								</c:forEach></select></td>
						<td><input type="text" onchange="updatename(this)"></td>
						<td><a href="#" class="btn" title="remove"
							onClick="remove(this);return false;"><strong>X</strong></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>