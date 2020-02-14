<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="dao" class="model.ProductDao" />
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	//조회수 증가시켜주고
	dao.UpHit(pnum);
	//데이터 불러오기
	Product product = dao.SelectByPk(pnum);
	
	request.setAttribute("product", product);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function cartcheck() {
			if(document.myform.qty.value == ""){
				alert( '주문 수량을 입력해주세요.' ) ;
				return false ;
			}
			var qty = document.myform.qty.value ;
			var reg = /^[1-9]/
			var result = reg.test(qty) ;
			if(result == false){
				alert( '주문 수량은 0보다 많아야 합니다.' ) ;
				return false ;
			}
		}
	</script>
</head>
<body>
<div class="container col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h1 class="panel-title" align="left">상품 상세 보기</h1>
		</div>
		<div class="panel-body">
			<div class="col-sm-4 col-sm-4">
				<table>
					<tr>
						<td align="center">
							<img align="middle" src="<%=realPath%>/${product.image}"
								class="img-thumbnail" width="230" height="300">
						</td>
						<!-- 만약 이미지2가 있으면 그것도 출력해주기 -->
						<%if(product.getImage2() != null) { %>
						<td align="center">
							<img align="middle" src="<%=realPath%>/${product.image2}"
								class="img-thumbnail" width="230" height="300">
						</td>
						<%} %>
					</tr>
				</table>
			</div>
			<div class="col-sm-8 col-sm-8">
				<table class="table table-hover table-condensed">					
					<tr>
						<td width="25%" align="center">상품명</td>
						<td width="75%" align="left">${product.pname}</td>
					</tr>
					<tr>
						<td width="25%" align="center">가격</td>
						<td width="75%" align="left">${product.price}</td>
					</tr>
					<tr>
						<td width="25%" align="center">소개</td>
						<td width="75%" align="left">${product.content}</td>
					</tr>
					<tr>
						<td width="25%" align="center">적립 포인트</td>
						<td width="75%" align="left">${product.point}</td>
					</tr>
					<tr>
						<td width="25%" align="center">조회수</td>
						<td width="75%" align="left">${product.hit}</td>
					</tr>
					<tr>
						<td width="25%" align="center">주문 하기</td>
						<td width="75%" align="left">
							<form action="./../mall/insert.jsp" method="post" role="form"  name = "myform" class="form-inline">
								<div class="form-group">
									<input type="hidden" name="pnum" value="${product.pnum}">
									<input type="hidden" name="stock" value="${product.stock}">
									개수 <input type="text" class="form-control" name="qty">
									요청사항 <input type="text" placeholder="레터링을 적어주세요" class="form-control" name="remark">
									<button class="btn btn-default" type="submit" onclick="return cartcheck();">장바구니 담기</button>
								</div>	
							</form>
						</td>
					</tr>					
				</table>
			</div>
			<hr>
			<div class="col-sm-offset-5 col-sm-4">
				<button class="btn btn-default" onclick="history.back();">
					돌아가기
				</button>
				<br><br>
				<c:if test="${whologin == 2}">
					<div class="btn-group btn-group-justified" align="right">
  						<a href="PupdateForm.jsp?pnum=<%=product.getPnum()%>" class="btn btn-default">수정</a>
  						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="<%=contextPath%>/product/Pdelete.jsp?pnum=${product.pnum}" class="btn btn-default">삭제</a>				
					</div>
		               
		      </c:if>
		      </div>				
			
		</div>
		<!-- end panel-body -->
	</div>
</div>

</body>
</html>
