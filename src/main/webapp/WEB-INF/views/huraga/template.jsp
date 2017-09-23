<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<spring:url value="/" scope="application" var="baseurl"></spring:url>

<spring:url value="${staticurl}/themes/h/img" var="themeimg"></spring:url>
<spring:url value="${staticurl2}/themes/h" var="themestatic"></spring:url>

	
<!DOCTYPE html>
<!--[if IE 8]>    <html class="no-js ie8 ie" lang="en"> <![endif]-->
<!--[if IE 9]>    <html class="no-js ie9 ie" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>Touchsy - All-in-one marketing, loyalty, in-store advertisement and eCommerce/mobile-commerce platform for small business</title>
		<META NAME="DESCRIPTION" CONTENT="Touchsy - All-in-one marketing, loyalty, in-store advertisement and eCommerce/mobile-commerce platform for small business"/>
		<META NAME="KEYWORDS" CONTENT="Small Business, All-in-one marketing, Multi-channel Loyalty Platform, SMS Marketing, Email Marketing, Facebook Marketing, eCommerce for Small Business"/>
		<meta name="robots" content="index, follow">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- jQuery Visualize Styles -->
		<link rel='stylesheet' type='text/css' href='${themestatic}/css/plugins/jquery.visualize.css'>
		
		<!-- jQuery jGrowl Styles -->
		<link rel='stylesheet' type='text/css' href='${themestatic}/css/plugins/jquery.jgrowl.css'>

		<!-- jQuery FullCalendar Styles -->
		<link rel='stylesheet' type='text/css' href='${themestatic}/css/plugins/jquery.fullcalendar.css'>

		<!-- CSS styles -->
		<link rel='stylesheet' type='text/css' href='${themestatic}/css/huraga-touchsy.css'>
		<link rel='stylesheet' type='text/css' href='${staticurl}/css/select2.css'>
		<link rel='stylesheet' type='text/css' href='${staticurl}/css/datepicker.css'>
		<link rel='stylesheet' type='text/css' href='${staticurl2}/css/jquery.cleditor.css'>
		<link rel='stylesheet' type='text/css' href='${staticurl2}/css/taginput.css'>
		<link rel='stylesheet' type='text/css' href='${staticurl2}/css/datepicker.css'>
		<link rel='stylesheet' type='text/css' href='${staticurl2}/css/common.css'>
		<link rel='stylesheet' type='text/css' href='${staticurl2}/css/bootstrap-datetimepicker.min.css'>
		
		
		<!-- Fav and touch icons -->
		<spring:url value="${staticurl}/img/favicon.png" var="favicon" />
		<link rel="icon" type="image/png" href="${favicon}"/>
		
		<!-- JS Libs -->
		<script src="${staticurl}/js/jquery-1.8.2.min.js"></script>
		<script>window.jQuery || document.write('<script src="${themestatic}/js/libs/jquery.js"><\/script>')</script>
		<script src="${themestatic}/js/libs/jquery-ui-1.10.2.custom.min.js"></script>
		
		<script src="${themestatic}/js/libs/modernizr.js"></script>
		<script src="${themestatic}/js/libs/selectivizr.js"></script>
		<script src="${staticurl2}/js/bootstrap-datepicker.js"></script>
		<script src="${themestatic}/js/bootstrap/bootstrap-tooltip.js"></script>
		<script src="${themestatic}/js/bootstrap/bootstrap-popover.js"></script>
		<script src="${staticurl}/js/taginput.js"><!--    --> </script>
		<script src="${staticurl}/js/jquery.cleditor.min.js"><!--    --> </script>
		<script src="${staticurl}/js/select2.min.js"></script>
		<script src="${staticurl}/js/touchsy__201308.js"></script>
		<script src="${staticurl2}/js/fullcalendar.min.js"></script>
		<script src="${themestatic}/js/plugins/bootstrapWizard/jquery.bootstrap.wizard.min.js"></script>
		<script src="${themestatic}/js/plugins/fileupload/bootstrap-fileupload.js"></script>
		<%-- <script src="${staticurl2}/js/jquery.infinitescroll.min.js"></script> --%>
		<script src="${staticurl}/js/jquery.flot.min.js"></script>
		<script src="${staticurl}/js/jquery.flot.pie.min.js"></script>
		<script src="${staticurl}/js/jquery.knob-1.2.js"></script>
		<script src="${staticurl2}/js/bootstrapSwitch.js"></script>
		<script src="${staticurl2}/js/jquery.jeditable.js"></script>
		<script src="${staticurl2}/js/bootstrap-datetimepicker.min.js"></script>
		<script src="${staticurl2}/ckeditor/ckeditor.js"></script>
		<script src="${staticurl2}/js/jquery.form.js"></script>
		<!-- start Mixpanel --><script type="text/javascript">(function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src=("https:"===e.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f);b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==
		typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");for(g=0;g<i.length;g++)f(c,i[g]);
		b._i.push([a,e,d])};b.__SV=1.2}})(document,window.mixpanel||[]);
		mixpanel.init("e65c723939f39cae5cbd9b2ef676bb37");</script><!-- end Mixpanel -->
	</head>
	<body>
		<tiles:insertAttribute name="header" ignore="true" />
		
		<!-- Full height wrapper -->
		<div id="wrapper">
			
			<!-- Main page container -->
			<section class="container" role="main">

				<!-- Left (navigation) side -->
				<div class="navigation-block">
					<tiles:insertAttribute name="sidebar" ignore="true" />
				</div>
				<!-- Left (navigation) side -->
				<!-- Right (content) side -->
				<div class="content-block" role="main">
					<div id="messagediv"></div>
					<article class="page-headerx">
						<c:if test="${not empty success}">
							<div class="alert alert-success"><span class="awe-ok"></span> ${success}
							<button class="close" data-dismiss="alert">x</button>
							</div>
						</c:if>
						<c:if test="${not empty err}">
							<div class="alert alert-error"><span class="awe-bell-alt"></span> ${err}
							<button class="close" data-dismiss="alert">x</button>
							</div>
						</c:if>
						<c:if test="${not empty info}">
							<div class="alert alert-info"><span class="awe-info-sign"></span> ${info}
							<button class="close" data-dismiss="alert">x</button>
							</div>
						</c:if>
						<c:if test="${not empty system_msg}">
							<div class="alert"><span class="awe-bell-alt"></span> ${system_msg}
							<button class="close" data-dismiss="alert">x</button>
							</div>
						</c:if>
					</article>
					<tiles:insertAttribute name="body" ignore="true" />
					
				</div>
				<!-- /Right (content) side -->
				
			</section>
			<!-- /Main page container -->
			
			<!-- Sticky footer push -->
			<div id="push"></div>
			
		</div>
		<!-- /Full height wrapper -->
		
		<!-- Main page footer -->
		<footer id="footer" class="container">
			<tiles:insertAttribute name="footer" ignore="true" />
		</footer>
		<!-- /Main page footer -->
		
		<!-- Scripts -->
		<script src="${themestatic}/js/navigation.js"></script>
		<script src="${themestatic}/js/bootstrap/bootstrap.min.js"></script>
		
		<!-- jQuery Visualize -->
		<!--[if lte IE 8]>
			<script language="javascript" type="text/javascript" src="${themestatic}/js/plugins/visualize/excanvas.js"></script>
		<![endif]-->
		<script src="${themestatic}/js/plugins/visualize/jquery.visualize.min.js"></script>
		
		<!-- jQuery jGrowl -->
		<script type="text/javascript" src="${themestatic}/js/plugins/jGrowl/jquery.jgrowl.js"></script>
		
		
		<!-- Slim scroll -->
		<script type="text/javascript" src="${themestatic}/js/plugins/slimScroll/jquery.slimscroll.min.js"></script> 
		<script>
			$(document).ready(function() {
		
				$("#messagediv").hide();
				$('.datepicker').datepicker({
					"autoclose": true,
					"format": 'dd M yyyy'
				});
				/* $("select").select2(); */
				$('body').on('show', '.modal', function(){
					  $(this).css({'margin-top':($(window).height()-$(this).height())/2,'top':'0'});
					});
			});
			
		</script>
	
	<tiles:insertAttribute name="footerscripts" ignore="true" />
	</body>
</html>