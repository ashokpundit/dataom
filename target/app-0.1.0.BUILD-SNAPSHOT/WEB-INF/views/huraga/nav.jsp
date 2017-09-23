<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="hasAnyRole('VendorAgent','Vendor','Admin')">
				<img src="${staticurl}/images/logo.png" style="margin-bottom: 10px;">
				<sec:authentication property="principal.mergedPlan" var="plan"/>
				<c:if test="${not empty plan}">
					<sec:authentication property="principal.mergedPlan.customProperties" var="planprops"/>
					<c:if test="${not empty planprops}">
						<sec:authentication property="principal.mergedPlan.customProperties['IS_MARKETING']" var="IS_MARKETING" scope="session"/>
						<sec:authentication property="principal.mergedPlan.customProperties['IS_ECOMMERCE']" var="IS_ECOMMERCE" scope="session"/>
						<sec:authentication property="principal.mergedPlan.customProperties['IS_LEAD']" var="IS_LEAD" scope="session"/>
						<sec:authentication property="principal.mergedPlan.customProperties['IS_TABLET']" var="IS_TABLET" scope="session"/>
					</c:if>
				</c:if>
				<!-- User profile -->
					<section class="user-profile">
						<figure>
							<figcaption>
								<strong><a href="#" class=""><sec:authentication property="principal.username" htmlEscape="false"/></a></strong>
								<em>${sessionScope.vname}</em>
								<ul>
									<li><a class="btn btn-primary btn-flat <c:if test="${(not fn:startsWith(_menu, 'profile')) and (not fn:startsWith(_menu, '/profile'))}">btn-inverse</c:if>" href="${baseurl}users/myProfile" title="My Profile">Account</a></li>
									<li><a class="btn btn-primary btn-flat btn-inverse" href="${baseurl}resources/logout" ><i class="icon-off icon-white"></i> Logout</a></li>
								</ul>
							</figcaption>
						</figure>
					</section>
					<!-- /User profile -->
					
					<!-- Sample left search bar -->
					<!--form class="side-search">
						<input type="text" placeholder="To search type and hit enter">
					</form-->
					<!-- /Sample left search bar -->
				
					<!-- Responsive navbar button -->
					<div class="navbar">
						<a class="btn btn-navbar btn-block btn-large" data-toggle="collapse" data-target=".nav-collapse"><span class="awe-home"></span> Dashboard</a>
					</div>
					<!-- /Responsive navbar button -->

					<!-- Main navigation -->
					<nav class="main-navigation nav-collapse collapse" role="navigation">
						<ul>
							<li <c:if test="${fn:endsWith(_menu, 'dashboard')}">class="current"</c:if>><a href="${baseurl}home" class="no-submenu"><span class="awe-home"></span>Dashboard</a></li>
						</ul>
						<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin:auto; z-index:100000; width:100%;">
					    	<tr>
					        	<td height="1" style="width:50%; height:1px; background:#28c0d5;"></td>
					            <td height="1" style="width:50%; height:1px; background:#95c43d;"></td>
					        </tr>
					    </table>
					    <c:if test="${IS_ECOMMERCE}">
						<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin:auto; z-index:100000; width:100%;">
					    	<tr>
					        	<td height="1" style="width:50%; height:1px; background:#28c0d5;"></td>
					            <td height="1" style="width:50%; height:1px; background:#95c43d;"></td>
					        </tr>
					    </table>
						<ul>
							<li style="margin-top: 5px;border-top: none;"><small>eCommerce </small></li>
							<sec:authorize access="hasRole('Vendor')">
							<li style="border-top:0px;" <c:if test="${fn:startsWith(_menu, 'ecom/catalog')}">class="current"</c:if>><a href="#"><span class="awe-shopping-cart"></span> Products</a>
								<ul>
									<li><a href="${baseurl}admin/merchant/menuitems/listmenuitem" <c:if test="${fn:endsWith(_menu, 'catalog/products')}">class="current"</c:if>><span class="awe-book"></span> Products Catalog</a></li>
								 	<li><a href="${baseurl}admin/merchant/menuitems?form" <c:if test="${fn:endsWith(_menu, 'catalog/createProduct')}">class="current"</c:if>><span class="awe-plus"></span> Add Product</a></li>							 	
 								</ul>
 
							</li>
							<li <c:if test="${fn:endsWith(_menu, 'catalog/category')}">class="current"</c:if>><a href="${baseurl}vendor/menusection/categorylist" class="no-submenu"><span class="awe-tags"></span> Categories</a></li>
							</sec:authorize>
							<li <c:if test="${fn:endsWith(_menu, 'vendorOrder')}">class="current"</c:if>><a href="${baseurl}admin/vendors/vendorOrder" class="no-submenu"><span class="awe-tasks"></span> Orders</a></li>
							<sec:authorize access="hasRole('Vendor')">
							<li <c:if test="${fn:endsWith(_menu, 'ecom/ecomLook')}">class="current"</c:if>><a href="${baseurl}vendor/pref/look" class="no-submenu"><span class="awe-picture"></span> Design Your Store</a></li>
							<li <c:if test="${fn:endsWith(_menu, 'ecom/ecomSocialMedia')}">class="current"</c:if>><a href="${baseurl}vendor/pref/socialMedia" class="no-submenu"><span class="awe-share"></span> Social Media</a></li>
							<li <c:if test="${fn:endsWith(_menu, 'ecom/ecomApps')}">class="current"</c:if>><a href="${baseurl}vendor/pref/apps" class="no-submenu"><span class="awe-fire"></span> Apps</a></li>
							<li <c:if test="${fn:endsWith(_menu, 'ecom/ecomSetting')}">class="current"</c:if>><a href="${baseurl}vendor/pref/ecompref" class="no-submenu"><span class="awe-cogs"></span> Settings</a></li>
							<%-- </br><a href="${baseurl}admin/merchant/menuitems?form" class="btn btn-block btn-small"> &nbsp;<span class="awe-plus awe-small"></span><strong> &nbsp;Add New Product</strong></a> --%>
							</sec:authorize>
						</ul>
						</c:if>
				    	<sec:authorize access="hasRole('Vendor')">
				    	<c:if test="${IS_MARKETING}">
						<ul>	
							<li style="margin-top: 5px;border-top: none;"><small>Marketing </small></li>
							<li style="border-top:0px;" <c:if test="${fn:startsWith(_menu, 'mktg')}">class="current"</c:if>><a href="#"><span class="awe-envelope-alt"></span> Emailers</a>
								<ul>
									<li><a href="${baseurl}vendor/newsletter/list"  <c:if test="${fn:endsWith(_menu, 'mktg/newsl')}">class="current"</c:if>><span class="awe-th-list"></span> My Emailers</a></li>
									<li><a href="${baseurl}vendor/newsletter/create" <c:if test="${fn:endsWith(_menu, 'mktg/createnewsl')}">class="current"</c:if>><span class="awe-asterisk"></span> Create New</a></li>
								</ul>
							</li>
							<li <c:if test="${fn:startsWith(_menu, 'rule')}">class="current"</c:if>><a href="${baseurl}rules?channel=nl" class="no-submenu"><span class="awe-asterisk"></span> Smart Campaign</a></li>
							<li <c:if test="${fn:startsWith(_menu, 'subs')}">class="current"</c:if>><a href="#"><span class="awe-group"></span> Subscribers</a>
								<ul>
									<li><a href="${baseurl}offers/custlist/list" <c:if test="${fn:endsWith(_menu, 'subs/clist')}">class="current"</c:if>><span class="awe-th-list"></span> Customer Lists</a></li>
									<li><a href="${baseurl}offers/custlist/create" <c:if test="${fn:endsWith(_menu, 'subs/createlist')}">class="current"</c:if>><span class="awe-asterisk"></span> Create List</a></li>
								</ul>
							</li>
							<%-- <li <c:if test="${fn:startsWith(_menu,'promotion')}">class="current"</c:if>><a href="#"><span class="awe-globe"></span>Promotion</a>
								<ul>
									<li><a href="${baseurl}promotion/PromotionList" <c:if test="${fn:endsWith(_menu,'listPromotion')}">class="current"</c:if>><span class="awe-th-list"></span>Promotion List</a></li>
									<li><a href="${baseurl}promotion/CreatePromotion" <c:if test="${fn:endsWith(_menu,'createPromotion')}">class="current"</c:if>><span class="awe-asterisk"></span>Create Promotion</a></li>
								</ul>
							</li> --%>
							<li <c:if test="${fn:endsWith(_menu, 'mpref')}">class="current"</c:if>><a href="${baseurl}vendor/pref/marketingpref" class="no-submenu"><span class="awe-cogs"></span> Settings</a></li>
						</ul>
						</c:if>
					    </sec:authorize>
					    <sec:authorize access="hasRole('Vendor')">
					    <c:if test="${IS_ECOMMERCE}">
					    	</br><a href="${baseurl}admin/merchant/menuitems?form" class="btn btn-block btn-small"> &nbsp;<span class="awe-plus awe-small"></span><strong> &nbsp;Add New Product</strong></a>
					    </c:if>
						</sec:authorize>
					    <c:if test="${IS_LEAD}">
						<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin:auto; z-index:100000; width:100%;">
					    	<tr>
					        	<td height="1" style="width:50%; height:1px; background:#28c0d5;"></td>
					            <td height="1" style="width:50%; height:1px; background:#95c43d;"></td>
					        </tr>
					    </table>
					    <ul>
					    	<li style="margin-top: 5px;border-top: none;"><small>Leads </small></li>
							<li style="border-top:0px;" <c:if test="${fn:endsWith(_menu, 'lead/manage')}">class="current"</c:if>><a href="${baseurl}vendor/leadx" class="no-submenu"><span class="awe-signin"></span> Manage Leads</a></li>
							<li <c:if test="${fn:endsWith(_menu, 'lead/add')}">class="current"</c:if>><a href="${baseurl}vendor/leadx/add" class="no-submenu"><i class="awe-plus"></i> Create New</a></li>
							<sec:authorize access="hasRole('Vendor')">
							<li <c:if test="${fn:endsWith(_menu, 'insms')}">class="current"</c:if>><a href="${baseurl}vendor/insms/apisettings" class="no-submenu"><i class="awe-share-alt"></i> Inbound Settings</a></li>
							<li <c:if test="${fn:endsWith(_menu, 'lead/settings')}">class="current"</c:if>><a href="${baseurl}vendor/crmpreferences" class="no-submenu"><i class="awe-cogs"></i> Lead Settings</a></li>
							</sec:authorize>
					    </ul>
						</c:if>
					    <c:if test="${IS_TABLET}">
						<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin:auto; z-index:100000; width:100%;">
					    	<tr>
					        	<td height="1" style="width:50%; height:1px; background:#28c0d5;"></td>
					            <td height="1" style="width:50%; height:1px; background:#95c43d;"></td>
					        </tr>
					    </table>
					    <ul>
					    	<li style="margin-top: 5px;border-top: none;"><small>In-Store </small></li>
					    	<li style="border-top:0px;" <c:if test="${fn:endsWith(_menu, 'leadgen')}">class="current"</c:if>><a href="${baseurl}admin/vendors/leadgen?showall" class="no-submenu"><span class="awe-picture"></span> Manage Ads</a>
					    	<li <c:if test="${fn:endsWith(_menu, 'lineitem')}">class="current"</c:if>><a href="${baseurl}admin/vendors/lineitems?showall" class="no-submenu"><span class="awe-circle"></span> In-store Campaigns</a></li>
					    	<sec:authorize access="hasRole('Vendor')">
					    	<li <c:if test="${fn:endsWith(_menu, 'store')}">class="current"</c:if>><a href="${baseurl}admin/merchant/shopdetail" class="no-submenu"><span class="awe-building"></span> Stores</a></li>
					    	<li <c:if test="${fn:endsWith(_menu, 'device')}">class="current"</c:if>><a href="${baseurl}admin/merchant/devicelist" class="no-submenu"><span class="awe-tablet"></span> Devices</a></li>
					    	</sec:authorize>
					    </ul>
					    </c:if>
					    <sec:authorize access="hasRole('Admin')">
					    	<ul>
					    	<li style="margin-top: 5px;border-top: none;"><small>System Admin </small></li>
					    	<li style="border-top:0px;"><a href="${baseurl}admin/sysadmin/createUser" class="no-submenu">Create User </a></li>
            				<%-- <li><a href="${baseurl}admin/sysadmin/adminHome" class="no-submenu">Approve Users</a></li> --%>
            				<li><a href="${baseurl}admin/sysadmin/paymentsApproval" class="no-submenu">Payment Approval</a></li>
            				<li><a href="${baseurl}vendor/newsletter/create?channel=admin" class="no-submenu">Auto Campaign</a></li>
            				<li><a href="${baseurl}rules?channel=admin" class="no-submenu">Create Rule</a></li>
            				<li><a href="${baseurl}admin/sysadmin/templates/listTemplate" class="no-submenu">Email Templates</a></li>
            				<li><a href="${baseurl}admin/sysadmin/vendorStatus" class="no-submenu">Vendor Status</a></li>
            				<li><a href="${baseurl}admin/sysadmin/viewUnverifiedUsers" class="no-submenu">Unverified Users</a></li>
            				<li><a href="${baseurl}admin/sysadmin/micrositePendingApproval" class="no-submenu">Pending Approvals</a></li>
			    		</ul>
		     			</sec:authorize>
					</nav>
					<!-- /Main navigation -->
					
					<c:if test="${not empty _notice}">
						<!-- Sample side note -->
						<section class="side-note">
							<div class="side-note-container">
								<h2>${_notice_title}</h2>
								<p>${_notice}</p>
							</div>
							<div class="side-note-bottom"></div>
						</section>
						<!-- /Sample side note -->
					</c:if>
</sec:authorize>					