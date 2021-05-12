<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- html 주석은 ctrl shift /  -->
<%-- jsp 주석은 양 옆에 % --%>
<%-- 
	<%@ ~ %> : 디렉티브 => 대부분 자동으로 입력된다. import 같이 설정에 관련된 정보를 적는다.
	<%! ~ %> : 선언부 => 프로그램에서 사용할 변수나 메소드를 정의한다. => java 파일로 뽑아내서 사용한다.
	<%= ~ %> : 표현식 => 변수에 저장된 데이터나 연산 결과를 출력한다. => EL(${ ~ })로 대체해서 사용한다.
	<% ~ %> : 스크립트 릿 => 일반적인 jsp 코드를 적는다. => jstl로 대체해서 사용한다.
--%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	html은 spacebar를 여러 번 눌러도 한 칸 밖에 떨어지지 않고 enter 키를 여러번 눌러도 줄이 변경되지 않는다.
	2칸 이상을 연속해서 띄우려면 &nbsp;를 띄울 칸의 개수 만큼 입력하고 줄을 변경하려면 <br> 태그를 사용하면 된다.
 -->
 
MyInfo.jsp 입니다. 크롬에서 F5를 누르면 변경된 내용이 바로 보입니다.<br/>
**... XML 파일은 서버 중지했다가... 실행하라고..? <br/>
두 칸이상 &nbsp;&nbsp; 띄어 &nbsp;&nbsp;쓰기&nbsp;&nbsp;이렇게요!

<!-- 
	현재 페이지에 입력한 데이터를 특정 페이지로 전송하려면 전송할 데이터를 입력하는 코드를
	<form> ~ </form> 사이에 작성해야 한다.
	action 속성은 전송 (submit) 버튼이 클릭되면 form에 입력한 데이터가 전송될 페이지를 적는다. 
	=> "?"만 입력하면 현재 페이지를 의미한다.
	method 속성은 action 페이지로 데이터가 전송될 때 전송되는 정보가 url(주소) 창에 표시되는 여부를 지정한다.
	method 속성의 기본값은 get이고 전송되는 데이터가 url 창에 표시된다.
	post로 변경하면 전송되는 정보가 url 창에 표시되지 않는다. **개인정보(id, password등) 문제 때문에 대부분 post로 해둔대~~
	
-->

<form action="myInfoOK.jsp" method="post">
	<!-- autocomplete="off" => 자동 완성 기능이 해제된다. -->
	<label>	이름 : <input type="text" name="name" autocomplete="off"/></label><br/>
	아이디 : <input type="text" name="id"/><br/>
	
	<!-- type="password" 일 경우, 한글을 타이핑해서 입력할 수 없다. -->
	비밀번호 : <input type="password" name="password"><br/>
	나이 : <input type="text" name="age"><br/>
	
	<!-- 
		radio와 checkbox는 같은 그룹끼리 반드시 같은 이름의 name 속성을 지정해야 그룹으로 묶인다.
		** 그룹으로 묶여야 남자/여자 중 1개만 선택 가능하게 해줘. 중복 선택 안 되고!
		radio와 checkbox는 컨트롤 zc자체를 화면에 표시하는 기능밖에 없기 때문에 선택했을 때 다음 페이지로 넘겨줄 데이터를
		value 속성을 사용해서 넣어줘야한다. => value 속성을 지정하지 않으면 선택한 경우 무조건 "on"이, 선택하지 않으면 null이 넘어간다.
		
		
	 -->
	
	<fieldset style="width: 120px;">
		<legend>성별</legend>
		<input type="radio" name="gender" value="true">남자
		<input type="radio" name="gender" value="false" checked="checked">여자<br/>
	</fieldset>
	
	<fieldset style="width: 400px;">
		<legend>취미</legend>
		<input type="checkbox" name="hobbies" value="낮잠자기">낮잠자기
		<input type="checkbox" name="hobbies" value="제제랑놀기">제제랑놀기
		<input type="checkbox" name="hobbies" value="일기쓰기">일기쓰기<br/>
	</fieldset>
	
	
	<!-- 콤보 박스 만들기! -->
	가고 싶은 여행지는?
	<select name="trip" style="width: 120px;">
	<option>괌</option>
	<option>코타키나발루</option>
	<option>다낭</option>
	<option>나트랑</option>
	<option selected="selected">보라카이</option>
	<option>대만</option>
	</select><br/>
	
	<!-- 리스트 박스 만들기! -->
	가고 싶은 여행지는 어딜까요?
	<select name="travel" style="width: 120px;" size="6" multiple="multiple">
	<option>괌</option>
	<option>코타키나발루</option>
	<option>다낭</option>
	<option>나트랑</option>
	<option>보라카이</option>
	<option>대만</option>
	</select><br/>
	
	메모<br/>
	<textarea rows="10" cols="60" name="content" style="resize: none;"></textarea><br/>
	
	<!-- 
	주의할 점! (1)
	<textarea rows="10" cols="60" name="content">
	*** 여기 이렇게 띄우면 메모 창 안의 내용도 이만큼 빠짐!;; 바짝 붙여서 써야해!!!
	</textarea><br/>
	
	주의할 점(2)
	style="resize: none;"  ** 이거 빼먹으면	사용자가 자기 맘대로 메모칸 크기 늘였다 줄였다해서 게시판 난리남;;;
	 -->



	
	<input type="submit" value="정보보기"/>
	<!-- <button type= "submit">정보보기</button> -->
	<input type="reset" value="다시 쓰기"/>
	<!-- <button type= "reset">다시 쓰기</button> -->

</form>




</body>
</html>