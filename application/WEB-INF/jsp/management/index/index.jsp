<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title><s:text name="ui.title" /></title>

<link href="/styles/management/themes/default/style.css" rel="stylesheet" type="text/css" />
<link href="/styles/management/themes/css/core.css" rel="stylesheet" type="text/css" />
<link href="/styles/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<link href="/styles/management/themes/css/ieHack.css" rel="stylesheet" type="text/css" />
<![endif]-->

<script src="/styles/management/js/speedup.js" type="text/javascript"></script>
<script src="/styles/management/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="/styles/management/js/jquery.cookie.js" type="text/javascript"></script>
<script src="/styles/management/js/jquery.validate.js" type="text/javascript"></script>
<script src="/styles/management/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="/styles/xheditor/xheditor-1.1.9-zh-cn.min.js" type="text/javascript"></script>
<script src="/styles/uploadify/scripts/swfobject.js" type="text/javascript"></script>
<script src="/styles/uploadify/scripts/jquery.uploadify.v2.1.0.js" type="text/javascript"></script>

<script src="/styles/management/js/dwz.min.js" type="text/javascript"></script>
<!-- <script src="/styles/management/js/dwz.regional.zh.js" type="text/javascript"></script> -->

<script type="text/javascript">
$(function(){	
	DWZ.init("/styles/management/dwz.frag.xml", {
		//loginUrl:"/management/index!login.do", loginTitle:"Login",	// 弹出登录对话框
		loginUrl:"/index!login.do",	// 跳到登录页面
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"/styles/management/themes"});
		}
	});
});
//清理浏览器内存,只对IE起效,FF不需要
if ($.browser.msie) {
	window.setInterval("CollectGarbage();", 10000);
}
</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="javascript:void(0)">Logo</a>
				<ul class="nav">
					<li><a href="/">Home</a></li>
					<li><a href="/management/user!editContext.do" target="dialog" mask="true">My Details</a></li>
					<li><a href="/management/index!editPwd.do" target="dialog" mask="true">Change Password</a></li>
					<li><a href="/passport!logout.do">Log out</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">blue</div></li>
					<li theme="green"><div>green</div></li>
					<li theme="purple"><div>purple</div></li>
					<li theme="silver"><div>silver</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
		</div>
		
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>Menu</h2><div>collapse</div></div>
			
				<div class="accordion" fillSpace="sideBar">
					<div class="accordionHeader">
						<h2><span>Folder</span>User Managerment</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/management/user!add.do" target="navTab" rel="userNav">Add User</a></li>
							<li><a href="/management/user!list.do" target="navTab" rel="userLiNav">View all Users</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>News, Events & Notice</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/management/news!add.do" target="navTab" rel="newsNav">Add News</a></li>
							<li><a href="/management/news!list.do" target="navTab" rel="newsLiNav">View all News</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>Website Manager</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/management/website!edit.do" target="navTab" rel="website">Home Page &amp; Site Content</a></li>
							<li><a href="/management/page!list.do" target="navTab" rel="pageLiNav">Static Pages</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>Category Manager</h2>					
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="/management/category!list.do" target="navTab" rel="categoryLiNav">Category</a></li>
						</ul>
					</div>
			
				</div>
				
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:void(0)"><span><span class="home_icon">My Home</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:void(0)">My Home</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div>
						<div class="accountInfo">
							<div class="right">
								<p><fmt:formatDate value="${model.now}" pattern="dd MMMM yyyy, EEEE"/></p>
							</div>
							<p><span>Welcome, ${contextUser.title} ${contextUser.firstName} ${contextUser.lastName}</span></p>
							<p>${contextUser.email}</p>
						</div>
						
						<div class="pageFormContent" layoutH="80">
							<p>
								<label>Username:</label><span class="unit">${contextUser.userName}</span>
							</p>
							<p>
								<label>First Name:</label><span class="unit">${contextUser.firstName}</span>
							</p>
							<p>
								<label>Last Name:</label><span class="unit">${contextUser.lastName}</span>
							</p>
							<p>
								<label>Phone:</label><span class="unit">${contextUser.phone}</span>
							</p>
							<p>
								<label>Post Code:</label><span class="unit">${contextUser.postcode}</span>
							</p>
							<p>
								<label>Email:</label><span class="unit">${contextUser.email}</span>
							</p>
							
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
	
	<div id="footer"><s:text name="ui.copyrights" /></div>


</body>
</html>