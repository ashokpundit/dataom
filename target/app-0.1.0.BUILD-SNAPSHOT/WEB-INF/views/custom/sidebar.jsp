<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="borderit">
	<center><h2><span style="color:#28c0d5">data</span><span style="color:#95c43d">om</span></h2></center>
	<center><table style="width:70%;" width="70%" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td style="width:100%; height:3px; background:#28c0d5;" height="3"></td></tr></tbody></table></center>
	<br/>
	<ul class="">

		<li class=""><a href="${baseurl}attrs/list">Attributes</a>
			<ul class="nav">
				<li class=""><a href="${baseurl}attrs/create">- Create</a></li>
				<li class=""><a href="${baseurl}attrs/list">- List</a></li>
			</ul></li>
		<li><a href="${baseurl}segments/list">Segment</a>
			<ul class="nav">
				<li><a href="${baseurl}segments/create">- Create</a></li>
				<li><a href="${baseurl}segments/list">- List</a></li>
			</ul></li>
		<li><a href="${baseurl}distributions/list">Distribution</a>
			<ul class="nav">
				<li><a href="${baseurl}distributions/create">- Create</a></li>
				<li><a href="${baseurl}distributions/list">- List</a></li>
			</ul></li>
		<li><a href="${baseurl}reports/totaluv">UV Reports</a>
			<ul class="nav">
				<li><a href="${baseurl}reports/totaluv">- Total UV</a></li>
				<li><a href="${baseurl}reports/attruv">- Attribute Report</a></li>
				<li><a href="${baseurl}reports/seguv">- Segment Report</a></li>
			</ul>
		</li>
		<li><a href="${baseurl}config/js">Configuration</a>
			<ul class="nav">
				<li><a href="${baseurl}config/js">- JS Configuration</a></li>
			</ul>
		</li>
		<li><a href="${baseurl}resources/logout">Logout</a></li>	
	</ul>
</div>