<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./../common/common.jsp" %>
<%
	String mid = request.getParameter("mid") ;
	MemberDao dao = new MemberDao() ;
	Member member = dao.SelectByPk(mid) ;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function formcheck() {
			var mid = document.myform.mid.value ;
			
			if(mid.length>=4&&mid.length<=12){
			}else{
				alert('아이디는 4글자 이상 8글자 이하여야 합니다.') ;
				return false ;
			}
			var name = document.myform.name.value ;
			var reg = /^[가-힣a-z]{2,}/ ;
			var result = reg.test(name) ;
			if(result == false){
				alert('이름은 2글자 이상이어야 합니다.') ;
				return false ;
			}
			var password = document.myform.password.value ;
			reg = /^[a-zA-Z0-9]{4,8}/ ;
			result = reg.test(password) ;
			if(result == false){
				alert('비밀번호는 4글자 이상 8글자 이하여야 합니다.') ;
				return false ;
			}
		}
	</script>	
</head>
<body>
<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">회원 정보 수정</h2>
		</div>
		<div class="panel-body">
			<form action="MupdateTo.jsp" method="post"  name = "myform" class="form-horizontal" role="form" >
				<input type = "hidden" name = "mpoint" value = "0">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">아이디</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="fakemid" id="fakemid" 
                        disabled="disabled"
                        class="form-control" value = "<%=member.getMid()%>">
                        <input type="hidden" name="mid" id="mid" value = "<%=member.getMid()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">이름</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="name" id="name" class="form-control" value = "<%=member.getName()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">비밀번호</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="password" name="password" id="password" class="form-control" value = "<%=member.getPassword()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">핸드폰 번호</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="phone" id="phone" class="form-control"  value="<%=member.getPhone()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">주소</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="address" id="address" class="form-control" value = "<%=member.getAddress()%>">
                    </div>
                    <input type = "hidden" name = "mpoint" value = "<%=member.getMpoint()%>>">
                </div>
                <div class="form-group">
                    <div class="col-sm-12" align = "center">
                    	<button type = "submit" class = "btn btn-default" onclick = "return formcheck();">
                    		<b>
                    			수정
                    		</b>
                    	</button>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<button type = "reset" class = "btn btn-default">
                    		<b>
                    			초기화
                    		</b>
                    	</button>
                    </div>
                </div>
            </form>
		</div>
	</div>
</div>
</body>
</html>