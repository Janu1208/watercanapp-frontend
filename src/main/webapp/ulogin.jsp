<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/login.css">
<body style="text-align:center" onload="displayName()">
<jsp:include page="headers.jsp"></jsp:include><br>


<script type="text/javascript">
function login()
{
	event.preventDefault();
	var phoneNumber=document.getElementById("phoneNumber").value;
	var password=document.getElementById("password").value;
	
	var formData = "phoneNumber="+ phoneNumber +"&password="+ password;
	
    var url = "http://localhost:8080/watercanappf-api/UserLogServlet?" + formData;
    console.log(url);
    console.log(phoneNumber);
    console.log(password);
    $.get(url, function(response){
    
    console.log(response);
    
    localStorage.setItem("LOGGED_IN_USER",response);
    localStorage.setItem("Logged_IN_RESERVE",response);
    var data= JSON.parse(response);
    console.log(data);
    console.log(data.errorMessage);
    if ( data.errorMessage !=null) {
    	document.getElementById("value").innerHTML=data.errorMessage;
    	alert("invalid credentials");
    	window.location.href= "?pageName=ulogin.jsp";
    }
    else
    	{
    	console.log("else");
    	 alert("Login Successful");
    	window.location.href= "?pageName=userOperations.jsp"; 
    	}
       
    });
			
}
</script>
<%
String errorMessage = request.getParameter("errorMessage");
if(errorMessage!=null){
	out.println("<font color='red'>" + errorMessage + "</font>");
	
}
%>

<body>
<div class="container">
	<section id="content">
		<form onsubmit="login()" method="post">
			<h1>Login Form</h1>
			<div>
			Contact No.:
				<input type="tel" placeholder="phone number" size=20 required autofocus id="phoneNumber" name="phoneNumber" /><br>
				<br/>
			</div>
			<div>
			Password:
				<input type="password" placeholder="Enter your password"  size=20 required autofocus id="password" name="password" /><br/>
			     <br/>
			</div>
			<div>
				<input type="submit"  id="btn" value="Log in"/>
				<div id="value"></div>
				
				<a href="?pageName=newUser.jsp">Register</a>
			</div>
		</form><!-- form -->
		<div class="button">
			
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->

<div class="toast">
    <div class="toast-header">
      Toast Header
    </div>
    <div class="toast-body">
     Invalid credentials.......
    </div>
  </div>

</body>

</body>
<script type="text/javascript">
function displayName()
{
	var user=JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
	
	   var name=user.name;
	   document.getElementById("name").innerHTML="Welcome" + name;
       return name;
}
displayName()
</script>
</html>