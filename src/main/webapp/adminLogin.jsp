<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<body style="text-align:center">
<jsp:include page="headers.jsp"></jsp:include><br>

<script type="text/javascript">

function reset()
{
	window.location.href = "?pageName=adminLogin.jsp";
}
function adminlogin()
{
	event.preventDefault();
	var Name=document.getElementById("Name").value;
	var Password=document.getElementById("Password").value;
	
	var formData = "Name="+ Name +"&Password="+ Password;
    var url = "http://localhost:8080/watercanappf-api/AdminServlet?" + formData;
    console.log(url);
    $.get(url, function(response){
    console.log(response);
    var data= JSON.parse(response);
    
    if ( data.errorMessage != null) {
    	alert(data.errorMessage)
    }
    else
    	{
    	alert("Login Succesfull");
    	window.location.href= "?pageName=adminOperations.jsp";
    	}
       
    });
			
}
</script>
<h1> Admin Login </h1> <br><br>

<div class="container-fluid">
        <div class="row">
            <div class="col">
<form onsubmit="adminlogin()" >
<table align="center">

<tr>
<td>
<label style="font-family: verdana;"> Name:</label><br>
</td>
<td> 
<input type="text" name="Name" id="Name" size=25 placeholder="Enter your name" required autofocus /> 
</td>


<td> 
&nbsp; &nbsp; &nbsp;<label style="font-family: verdana;"> Password:</label>
</td>
<td>
<input type="password" name="Password" id="Password" size=25 placeholder="Enter password" required/> <br>
<br/>
</td>
</tr>


<input type="submit"  value="Submit" class="btn btn-success"  >
</td>
<td>
<input type="button"  value="Reset" class="btn btn-danger" onclick="reset()">

</div>
</div>
</div>

<div>
<div>
<div>
</table>
</div>
</div>
</div>
</form>

</body>
</html>