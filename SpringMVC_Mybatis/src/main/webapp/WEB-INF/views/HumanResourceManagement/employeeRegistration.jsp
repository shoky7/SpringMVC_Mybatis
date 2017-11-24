<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>인사관리시스템</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="<C:out value="${myContext}"/>/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<C:out value="${myContext}"/>/resources/assets/commons/css/navbar-top.css" rel="stylesheet">
		<script src="<C:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/vendor/popper.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		function registration() {
			 $("#formReg").submit();
		}
		
			
		
		
</script>
		<style>
			span{ color:red; }
		</style>
	</head>
	<body>
	    <nav class="navbar navbar-expand-md navbar-light bg-light mb-4">
	      <a class="navbar-brand" href="/SpringMVC_Mybatis/index">IT & Biz</a>
	      <div class="collapse navbar-collapse" id="navbarCollapse">
	        <ul class="navbar-nav mr-auto">
	        </ul>
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/SpringMVC_Mybatis/employee/registration">입력하기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/SpringMVC_Mybatis/employee/search">조회하기</a>
	      </li>
	    </ul>
	      </div>
	    </nav>
    
		<h3>&nbsp &nbsp직원상세정보</h3>
	
		<div align="right">
			<button type="button" class="btn btn-primary" onclick = "registration()">등록</button>
			<button type="button" class="btn btn-primary">전화면</button>
		</div>
		<form id ="formReg" action= "/SpringMVC_Mybatis/employee/registration"  method="post">
			<table class="table">
				<tbody>
					<tr>
						<td colspan="2" rowspan="6">사진</td>
						<td><span>*</span>사번</td>
						<td><input type="text" name="sabun" class="form-control" disabled="disabled"></td>
						<td>한글성명</td>
						<td><input type="text" name="name" class="form-control" maxlength="5"></td>
						<td>영문성명</td>
						<td><input type="text" name="eng_name" class="form-control"></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" class="form-control"></td>
						<td>패스워드</td>
						<td><input type="password" name="pwd" class="form-control"></td>
						<td>패스워드확인</td>
						<td><input type="password" name="pwd2" class="form-control"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone" class="form-control"></td>
						<td>핸드폰번호</td>
						<td><input type="text" name="hp" class="form-control"></td>
						<td>주민번호</td>
						<td><input type="text" name="reg_no" class="form-control"></td>
					</tr>
					<tr>
						<td>연령</td>
						<td><input type="text" name="years" class="form-control"></td>
						<td>이메일</td>
						<td>
							<div class="input-group">
								<input type="text" name="email" class="form-control">
								<select name="email" class="form-control">
								<C:forEach var="map" items="${email}">
									<option value="${map.get("EMAIL")}">${map.get("EMAIL")}</option>						
								</C:forEach>
								</select>
							</div>
						</td>
						<td>직종체크</td>
						<td>
							<div class="input-group">
								<select name="job_type" class="form-control">
								<option></option>
								<C:forEach var="map" items="${job_type}">
									<option value="${map.get("JOB_TYPE")}">${map.get("JOB_TYPE")}</option>						
								</C:forEach>
								</select>
								
								<select name="sex" class="form-control">
								<option></option>
								<C:forEach var="map" items="${sex}">
									<option value="${map.get("SEX")}">${map.get("SEX")}</option>						
								</C:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<div class="input-group">
								<input type="text" name="zip" class="form-control">
								<button  type="button" class="btn btn-secondary">주소검색</button>
							</div>
						</td>
						<td colspan="2"><input type="text" name="addr1" class="form-control"></td>
						<td colspan="2"><input type="text" name="addr2" class="form-control"></td>
					</tr>
					<tr>
						<td>직위</td>
						<td>
							<select name="pos_gbn_code" class="form-control">
							<option></option>
							<C:forEach var="map" items="${pos_gbn_code}">
								<option value="${map.get("POS_GBN_CODE")}">${map.get("POS_GBN_CODE")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>부서</td>
						<td>
							<select name="dept_code" class="form-control">
							<option></option>
							<C:forEach var="map" items="${dept_code}">
								<option value="${map.get("DEPT_CODE")}">${map.get("DEPT_CODE")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>연봉(만원)</td>
						<td><input type="text" name="salary" class="form-control"></td>
					</tr>
					<tr>
						<td>입사구분</td>
						<td>
							<select name="join_gbn_code" class="form-control">
							<option></option>
							<C:forEach var="map" items="${join_gbn_code}">
								<option value="${map.get("JOIN_GBN_CODE")}">${map.get("JOIN_GBN_CODE")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>등급</td>
						<td>
							<select name="gart_level" class="form-control">
							<option></option>
							<C:forEach var="map" items="${gart_level}">
								<option value="${map.get("GART_LEVEL")}">${map.get("GART_LEVEL")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>투입여부</td>
						<td>
							<select name="put_yn" class="form-control">
							<option></option>
							<C:forEach var="map" items="${put_yn}">
								<option value="${map.get("PUT_YN")}">${map.get("PUT_YN")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>군필여부</td>
						<td>
							<select  name="mil_yn" class="form-control">
							<option></option>
							<C:forEach var="map" items="${mil_yn}">
								<option value="${map.get("MIL_YN")}">${map.get("MIL_YN")}</option>						
							</C:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>군별</td>
						<td>
							<select name="mil_type" class="form-control">
							<option>(선택)</option>
							<C:forEach var="map" items="${mil_type}">
								<option value="${map.get("MIL_TYPE")}">${map.get("MIL_TYPE")}</option>							
							</C:forEach>
							</select>
						</td>
						<td>계급</td>
						<td>
							<select name="mil_level" class="form-control">
							<option>(선택)</option>
							<C:forEach var="map" items="${mil_level}">
								<option value="${map.get("MIL_LEVEL")}">${map.get("MIL_LEVEL")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>입영일자</td>
						<td><input type="date" name="mil_startdate" class="form-control"></td>
						<td>전역일자</td>
						<td><input type="date" name="mil_enddate" class="form-control"></td>
					</tr>
					<tr>
						<td>KOSA등록</td>
						<td>
							<select name="kosa_reg_yn" class="form-control">
							<option></option>
							<C:forEach var="map" items="${kosa_reg_yn}">
								<option value="${map.get("KOSA_REG_YN")}">${map.get("KOSA_REG_YN")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>KOSA등급</td>
						<td>
							<select name="kosa_class_code" class="form-control">
							<option>(선택)</option>
							<C:forEach var="map" items="${kosa_class_code}">
								<option value="${map.get("KOSA_CLASS_CODE")}">${map.get("KOSA_CLASS_CODE")}</option>						
							</C:forEach>
							</select>
						</td>
						<td>입사일자</td>
						<td><input type="date" name="join_day" class="form-control"></td>
						<td>퇴사일자</td>
						<td><input type="date" name="retire_day" class="form-control"></td>
					</tr>
					<tr>
						<td>사업자번호</td>
						<td><input type="text" name="cmp_reg_no" class="form-control"></td>
						<td>업체명</td>
						<td><input type="text" name="crm_name" class="form-control"></td>
						<td>사업자등록증</td>
						<td><input type="text" name="cmp_reg_image" class="form-control"></td>
						<td>
							<button  type="button" class="btn btn-secondary">미리보기</button>
						</td>
						<td>
							<button  type="button" class="btn btn-secondary">등록</button>
						</td>
					</tr>
					<tr>
						<td rowspan="2">자기소개</td>
						<td colspan="3">
							<textarea name="self_intro" class="form-control"></textarea>
						</td>
						<td>이력서</td>
						<td><input type="text" name="carrier" class="form-control"></td>
						<td>
							<button  type="button" class="btn btn-secondary">미리보기</button>
						</td>
						<td>
							<button  type="button" class="btn btn-secondary">파일 업로드</button>
						</td>
					</tr>
					<tr>
						<td colspan="8"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>