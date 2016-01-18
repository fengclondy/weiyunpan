<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="time" uri="http://www.yunpan.com/formattimestamp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>微云盘</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/top.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/left.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/main_top.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/list_container.css" />
<style type="text/css">
.navs .mod-head span {
	top: 0;
	color: white;
	line-height: 50px;
}

.navs .mod-head {
	width: 260px;
	height: 50px;
	float: left;
	padding-left: 323px;
	position: absolute;
	right: 12px;
}

.navs .mod-head a {
	float: left;
}

.navs .mod-head .hyn {
	padding-left: 22px;
	line-height: 50px;
	font-size: 14px;
}

.navs .mod-head .sui {
	padding-left: 22px;
	font-size: 16px;
	font-family: arial;
}

.navs .mod-head span:hover {
	color: #0067FF
}

.list-view-container table tr td a {
	color: #000;
	padding-left: 4px;
}

/*修改文件名称 start*/
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.4;
	opacity: .4;
	filter: alpha(opacity =   40);
	height: 915px;
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 30%;
	height: 85%;
	padding: 20px;
	border: 2px solid #38A3DB;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

.close {
	position: absolute;
	top: 0;
	right: 0;
}

.xg-file {
	padding-left: 98px;
	font-family: "微软雅黑";
	font-size: 20px;
	color: #999;
	border-bottom: 2px solid #F2F2F2;
	line-height: 14px;
	padding-bottom: 17px;
}

.f-submit {
	margin-top: 50px;
}

.f-submit th {
	text-align: right;
	color: #999;
	vertical-align: inherit;
	line-height: 41px;
}

.f-submit .xg-input {
	width: 220px;
	border: 1px solid;
	border-color: #d8d8d8 #e5e5e5 #e5e5e5 #d8d8d8;
	-webkit-box-shadow: 2px 3px 3px #f6f8f9 inset;
	height: 32px;
	font-size: 12px;
	padding: 1px 8px;
	transition-duration: .5s;
}

.xg-submit {
	background-clip: padding-box;
	border: 1px solid #5C8EBF;
	border-radius: 2px;
	margin: 13px 0 0 150px;
	float: left;
	background: -webkit-linear-gradient(#75abda, #6698c9);
	font-size: 14px;
	width: 68px;
	height: 34px;
	line-height: 30px;
	color: #fff;
	text-align: center;
	cursor: pointer;
}

.xg-submit:hover {
	background: -webkit-linear-gradient(#75abda, #66C969);
}

/*end */
.check_file {
	width: 500px;
	float: left;
	position: absolute;
	margin-left: 360px;
	top: -1px;
}

.check_file .cx-input {
	width: 220px;
	border: 1px solid;
	border-color: #d8d8d8 #e5e5e5 #e5e5e5 #d8d8d8;
	-webkit-box-shadow: 2px 3px 3px #f6f8f9 inset;
	height: 30px;
	font-size: 12px;
	padding: 1px 8px;
	transition-duration: .5s;
}

.check_file .cx-submit {
	background-clip: padding-box;
	border: 1px solid #5C8EBF;
	border-radius: 2px;
	float: left;
	background: -webkit-linear-gradient(#75abda, #6698c9);
	font-size: 14px;
	width: 68px;
	height: 34px;
	line-height: 30px;
	color: #fff;
	text-align: center;
	cursor: pointer;
}

.check_file th {
	font-size: 14px;
}
/*空间使用情况 start*/
.slide_space {
	height: 220px;
	position: relative;
	border-bottom: 2px dotted #252525;
}

.space {
	position: relative;
	height: 100px;
}

.space ul li {
	font-size: 14px;
	font-family: arial;
	padding-top: 12px;
	padding-left: 5px;
	font-weight: bold;
}

.space .count {
	color: red;
}

.xg {
	width: 176px;
	height: 38px;
	cursor: pointer;
	background-color: transparent;
	border: 0;
}

.cz {
	padding-left: 60px;
}

.a_isshare {
	cursor: pointer;
}
/*end*/
</style>
<link href="<%=path%>/css/uploadify.css" rel="stylesheet"
	type="text/css" />
</head>

<body>
	<div class="content">

		<!--top start-->
		<jsp:include page="top.jsp"></jsp:include>
		<!--top end-->
		<!--
        	作者：pamgogdpyc@163.com
        	时间：2016-01-05
        	描述：left
        -->
		<jsp:include page="left.jsp"></jsp:include>
		<!--left end-->
		<!--
        	作者：pamgogdpyc@163.com
        	时间：2016-01-05
        	描述：main
        	-->
		<div class="main" id="layoutmain">

			<div class="main_desc">

				<!--main_top start-->
				<div class="main_top">
					<div id="div_f">
						<!-- 	<div class="tools upload_file">
							<span><em class="icon icon-upload" title="上传"></em>上传文件</span>
						</div> -->

						<div class="div_sc">
							<input type="file" name="uploadify" id="uploadify" />
							<p class="tools_p">
								<a class="tools_a"
									href="javascript:$('#uploadify').uploadify('upload','*')">开始上传</a>
							</p>
							<div id="fileQueue"></div>
						</div>

						<div class="tools new_folder">
							<span> <em class="icon icon-upload" title="新建"></em>新建文件夹
							</span>
						</div>
						<div class="tools check_file">
							<form action="<%=path%>/FileHandleServlet.do" method="post">
								<input type="hidden" name="method" value="findLikeFile" />
								<table>
									<tbody>
										<tr>
											<th>请输入文件名：</th>
											<td><input class="cx-input" type="text" name="filename"
												value="" placeholder="请输入文件名" /></td>
											<td><input type="submit" class="cx-submit" value="查询" />
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>

						<!--
						<form method="post" action="#">
							<input title="点击选择文件" id="" multiple="" type="file" name="file" value="上传">
							<input type="submit" value="上传" />
						</form>-->
					</div>
				</div>
				<!--end main_top-->
				<div class="main_con">
					<div class="main_con_top">
						<span class="wj">全部文件</span> <span class="wj_total">全部加载，共${diskInfo.filenumber
							}个</span>
					</div>
					<div class="list-view">

						<ul>

							<li class="col first-col" style="width: 18%;">
								<div class="div_check"></div> <span class="span_wjm">文件目录</span>
								<span class="order-icon"></span>
							</li>

							<li class="col first-col" style="width: 20%;">
								<div class="div_check"></div> <span class="span_wjm">文件名</span>
								<span class="order-icon"></span>
							</li>
							<li class="col" style="width: 9%; text-align:center;"><span>大小</span>
								<span class="order-icon"></span>
							</li>
							<li class="col time_col" style="width: 11%;text-align:center;"><span>创建时间</span>
								<span class="order-icon"></span>
							</li>
							<li class="col last-col" style="width: 35%;"><span
								class="cz">操作</span> <span class="order-icon"></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--
                    	作者：pamgogdpyc@163.com
                    	时间：2016-01-05
                    	描述：list-view-container
                    -->
			<div class="list-view-container">
				<table>
					<c:forEach items="${fileLists }" var="files">
						<tr class="">
							<td style="width:17% ;"><img
								src="<%=path %>/imgs/${files.show_pic}" alt="图片预览" width="50"
								height="46" /></td>
							<td style="width:20% ;"><input type="hidden" name="fileid"
								value="${files.id }" /> <a id="td_delete" class="xg"
								href="javascript:void(0);" title="查看与修改">${files.filename }</a>
							</td>
							<td style="width:9% ;"><fmt:formatNumber type="number"
									value="${(files.size)/1024}" pattern="0.00"
									maxFractionDigits="2" />KB</td>
							<td style="width:11% ;">${files.change_time}</td>
							<td style="width:20% ;"><a id="td_delete" class="a_delete"
								href="<%=path %>/FileHandleServlet.do?method=deleteFile&filename=${files.filename}&fileid=${files.id}"
								title="删除文件">删除</a> <a id="td_delete"
								href="<%=path %>/FileDownloadServlet.do?method=downloadFile&filename=${files.filename}&fileid=${files.id }"
								title="下载文件">下载</a> <%-- <a id="td_delete" class="a_isshare" href="<%=path %>/FileShareServlet.do?method=shareFile&fileid=${files.id}" title="分享文件">分享</a>
						 --%> <a id="td_delete" class="a_isshare" title="分享文件">分享</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="light" class="white_content">
				<a class="close" href="javascript:void(0)"
					onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
					<img src="<%=path%>/imgs/icon_close.png" id="close_icon"
					style="width: 22px; height: 22px;" alt="关闭" /> </a> <span
					class="xg-file">修改文件名称</span>
				<div class="f-submit">
					<form action="<%=path%>/FileHandleServlet.do" method="post">
						<input type="hidden" name="method" value="updateSimpleFile" />
						<table>
							<tbody>
								<tr>
									<th>文件名：</th>
									<td><input name="fileid" class="f_id" type="hidden"
										value="" /> <input class="xg-input xg_wjm" id="" type="text"
										name="filename" value="" placeholder="请输入文件名(含文件后缀)" /><br />
										<span style="color:red;">注:请把后缀名写上</span></td>
								</tr>
								<tr>
									<th>创建时间：</th>
									<td><input class="xg-input xg_rq" type="text" name="time"
										value="" onclick="WdatePicker()" /></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="xg-submit" value="修改" />
					</form>
				</div>
			</div>
			<div id="fade" class="black_overlay"></div>
		</div>
	</div>

	<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/js/jquery.uploadify.min.js"></script>
	<script type="text/javascript">
	$(function(){
		 $("#uploadify").uploadify({  
		 	swf:"<%=path%>/js/uploadify.swf",
            uploader : "<%=path%>/FileUploadServlet.do?method=uploadFile",
			method : "post",
			cancelImg : "<%=path%>/imgs/uploadify-cancel.png",
			folder : "uploads",//您想将文件保存到的路径  
			queueID : "fileQueue",//与下面的id对应  
			queueSizeLimit : 5,
			auto : false,
			multi : true,
			buttonText : "浏览"
		});
	});
	</script>
	<script type="text/javascript">
		$(function() {
			var defaultImg = $('#close_icon');
			$("#close_icon").mouseover(function() {
				$(this).attr("src", "<%=path%>/imgs/closedactive.png");
			});
			$("#close_icon").mouseout(function() {
				$(this).attr("src", "<%=path%>/imgs/icon_close.png");
			});
			//修改
			$(".xg").click(function(){
				var fileid = $(this).parent().find("input[name='fileid']").val();
				var username = $(this).text();
				var change_time = $(this).parent().parent().find("td:eq(3)").text();
				$(".f_id").val(fileid);
				$(".xg_wjm").val(username);
				$(".xg_rq").val(change_time);
				$("#light").css("display","block");
				$("#fade").css("display","block");
				return false;
			});
			//删除
	  		$(".a_delete").click(function(){
	  			return window.confirm("确认要删除该文件吗?");
	  		});
	  		
	  		//分享
	  		$(".a_isshare").click(function() {
				var filename=$(this).parent().parent().children("td:eq(1)").find("a").html();
				window.confirm("确定要分享该"+filename+"文件吗？");
				var fileid = $(this).parent().parent().find("input[name='fileid']").val();
				share(fileid);
			});
		})
		function share(id) {
			$.ajax({
				cache : false,
				url : "<%=path%>/FileShareServlet.do",
				data : {
					method : "shareFile",
					fileid : id,
				},
				type : "POST",
				//请求成功返回的数据
				dataType : "json",
				success : function(result) {
					//1.提示
					alert(result[0].isshare);
				}
			});
		}
	</script>
</body>

</html>