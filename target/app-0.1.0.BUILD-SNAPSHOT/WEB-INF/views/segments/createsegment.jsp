<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form:form commandName="segment" method="POST"
	action="${baseurl}segments/create" class="form-horizontal well">
	<h3 style="">Segment</h3>
	<div class="row">
		<label class="span2">Name</label>
		<form:input path="name" placeholder="segment name" class="span4" />
	</div>
	<div class="row">
		<label class="span2">Description</label>
		<form:textarea path="description" placeholder="describe segment"
			class="span4" />
	</div>
	<div class="row">
		<label class="span2">Disabled</label>
		<form:checkbox path="disabled" class="" />
	</div>
	<div class="row hide">
		<label class="span2">Historic</label>
		<form:checkbox path="historicNature" class="" />
	</div>
	<div class="row">
		<label class="span2"><a title="Enter recency of the criteria to evaluate segment.">Recency (Days)</a></label>
		<form:select path="recencyDays" items="${recencyDaysList}"/>
	</div>
	<form:hidden path="id" />
	<br/>
	<div class="row">
		<label class="span2"><a title="Conditions in terms of attributes">Segment Expression</a></label>
		<div class=" span10">
			<div class="">
				<table id="segmenttable"
					class="table table-bordered table-condensed">
					<thead>
						<td></td>
						<td>Attribute</td>
						<td>Min Frequency</td>
						<td>Conjuction</td>
						<td>Actions</td>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty segment.conditions}">
								<c:forEach items="${segment.conditions}" var="condition"
									varStatus="i">

									<tr>
										<td><input type="radio" name="attrsel"></td>
										<td><input type="hidden" name="conditions[0].attrs"
											value="${condition.attrs}"></td>

										<td><input type="text" name="conditions[0].minFrequency"
											value="${condition.minFrequency}"></td>
										<td><select name="conditions[0].conjunction">
												<option
													<c:if test="${condition.conjunction eq 'AND'}"> selected </c:if>>AND</option>
												<option
													<c:if test="${condition.conjunction eq 'OR'}"> selected </c:if>>OR</option>
										</select></td>

										<td><c:if
												test="${fn:length(segment.conditions) eq  i.index+1}">
												<a href="#" id="addrow"><strong>+</strong></a> &nbsp;
										<a href="#" id="deleterow"><strong>-</strong></a>
											</c:if></td>
									</tr>
								</c:forEach>

							</c:when>
							<c:otherwise>
								<tr>
									<td><input type="radio" name="attrsel" checked="checked"></td>
									<td><input type="hidden" name="conditions[0].attrs"></td>

									<td><input type="text" name="conditions[0].minFrequency"></td>
									<td><select name="conditions[0].conjunction">
											<option>AND</option>
											<option>OR</option>
									</select></td>

									<td><a href="#" id="addrow" class="btn"><strong>+</strong></a> &nbsp;
										<a href="#" id="deleterow" class="btn"><strong>x</strong></a></td>
								</tr>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>
				<div class="table">
					<select name="attributes"
						class="span2">
						<c:forEach items="${attrs}" var="attr">
							<option value="${attr.id}">${attr.name}</option>
						</c:forEach>
					</select>
					<button id="addattr">Set attribute to selected row</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<label class="span2">Distributions</label> <button id="adddist" class="pull-right"><strong>+</strong></button>
		<div class="span10">
			<table id="distributiontable"
				class="table table-bordered table-condensed">
				<thead>
					<th>Name</th>
					<th>ID Value</th>
					<th></th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty segment.distribution}">
							<c:forEach items="${segment.distribution}" var="distrb">
								<tr>
									<td><select onchange="updatemapKey(this)"><c:forEach
												items="${distribution}" var="dist">
												<option value="${dist.id}"
													<c:if test="${distrb.key eq dist.id}">selected</c:if>>${dist.name}</option>
											</c:forEach></select></td>
									<td><input type="text" onchange="updatename(this)"
										value="${distrb.value}"></td>
									<td><a href="#" class="btn" title="remove"
										onClick="remove(this);return false;"><strong>X</strong></a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td><select onchange="updatemapKey(this)"><c:forEach
											items="${distribution}" var="dist">
											<option value="${dist.id}">${dist.name}</option>
										</c:forEach></select></td>
								<td><input type="text" onchange="updatename(this)"></td>
								<td><a href="#" class="btn" title="remove"
									onClick="remove(this);return false;"><strong>X</strong></a></td>
							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
		</div>
	</div>
	<div class="forms-actions">
		<button class="btn-primary">Save</button>
	</div>
</form:form>



<script>
    function remove(ele) {
	$(ele).parent().parent().remove();
    }
    function updatename(ele) {
	var selval = $(ele).parent().parent().find("select").val();
	$(ele).attr("name", "distribution[" + selval + "]");
    }
    function updatemapKey(ele) {
	var selval = $(ele).val();
	$(ele).parent().parent().find("input").attr("name", "distribution[" + selval + "]");
    }

    function bindAddDeleteRowEvent() {
	$("#addrow").bind("click", addRow);
	$("#deleterow").bind("click", deleteRow);

    }

    var addRow =
            function(e) {
	        e.preventDefault();
	        var len = $("#segmenttable tbody tr").length;
	        var strhtml =
	                '<tr><td><input type="radio" name="attrsel" checked="checked" data-idx="'+len+'"></td>'
	                        + '<td><input type="hidden" name="conditions['+len+'].attrs"><span></span></td>'

	                        + '<td><input type="text" name="conditions['+len+'].minFrequency"></td>'
	                        + '<td><select name="conditions['+len+'].conjunction"><option>AND</option><option>OR</option></select></td>'
	                        + '<td class="action"><a href="#" id="addrow"><strong>+</strong></a> &nbsp;&nbsp; <a href="#" id="deleterow"><strong>-</strong></a></td>'
	                        + '</tr>';

	        $("#segmenttable tbody").append(strhtml);
	        $(this).parent().empty();
	        bindAddDeleteRowEvent();
            };
    var deleteRow = function(e) {
	e.preventDefault();
	var str = $(this).parent().html();
	$(this).parent().parent().remove();
	$("#segmenttable tbody td:last").html(str);
	bindAddDeleteRowEvent();
    };

    $(document)
            .ready(
                    function() {
	                $("distributiontable select").trigger("change");
	                $("#adddist")
	                        .click(
	                                function(e) {
	                                    e.preventDefault();
	                                    var strhtml =
	                                            '<tr><td><select onchange="updatemapKey(this)"><c:forEach items="${distribution}" var="dist"><option value="${dist.id}">${dist.name}</option></c:forEach></select></td>'
	                                                    + '<td><input type="text" onchange="updatename(this)"></td><td><a href="#" class="btn" title="remove" onClick="remove(this);return false;"><strong>X</strong></a></td></tr>';
	                                    $("#distributiontable tbody").append(strhtml);
	                                });
	                bindAddDeleteRowEvent();
	                $("#addattr").click(
	                        function(e) {
	                            // var cellidx = $(this).data("idx");
	                            e.preventDefault();
	                            var selattr = $("select[name=attributes]").val();
	                            var seltext = $("select[name=attributes] option:selected").text();
	                            var rowidx =
	                                    $("#segmenttable input[name=attrsel]:checked").parent().parent().index();

	                            var attrs = $("input[name='conditions[" + rowidx + "].attrs']").val();
	                            /*  if (attrs != "") {
	                                 if (attrs.split(",").length == 1) {
	                                     attrs = selattr;
	                                 } else {
	                                     attrs += "," + selattr;
	                                 }

	                             } else {
	                                 attrs = selattr;
	                             } */
	                            attrs = selattr;
	                            $("input[name='conditions[" + rowidx + "].attrs']").val(attrs);
	                            $("input[name='conditions[" + rowidx + "].attrs']").parent().find("span").remove();
	                            $("input[name='conditions[" + rowidx + "].attrs']").parent().append(
	                                    "<span>" + seltext + "</span>");
	                        });

                    });
</script>