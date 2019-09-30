<html>
<body style="text-align: center" font-color="red">
<jsp:include page="headers.jsp"></jsp:include><br>

<script type="text/javascript">
function myFunction() {
	  var x = document.getElementById("password");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
function reset() {
	window.location.href = "?pageName=newUser.jsp";
}
function register()
{
		event.preventDefault();
		var name = document.getElementById("name").value;
		var phoneNumber = document.getElementById("phoneNumber").value;
		var password = document.getElementById("password").value;

		var formData = "name=" + name + "&phoneNumber=" + phoneNumber
				+ "&password=" + password;
		var url = "http://localhost:8080/watercanappf-api/RegServlet?"
				+ formData;
		console.log(name);
		console.log(phoneNumber);
		console.log(password);
		console.log(url);
		$.get(url, function(response) {
			console.log(response);
			var data = JSON.parse(response);

			if (data.errorMessage != null) {
				//alert(data.errorMessage);
				window.location.href = "?pageName=newUser.jsp";

			} else {
				alert("successfully registered");
				window.location.href = "?pageName=ulogin.jsp";
			}
			

		});
}

function validateName()
{
	
	var name=document.getElementById("name").value;
	var nameRegex=/^[A-Za-z]*$/;
	if(nameRegex.test(name))
	{
	document.getElementById("namelocation").innerHTML="";
	}
else
	{
	document.getElementById("namelocation").innerHTML="Name should contain alphabets only";
	
	}
}
	
function validatePhoneNumber()
{
	var phoneNumber=document.getElementById("phoneNumber").value;
	var phoneNumberRegex=/^[0-9]*$/;
	if(phoneNumberRegex.test(phoneNumber))
		{
		document.getElementById("phoneNumberlocation").innerHTML="";

		}
			
	else
		{
		document.getElementById("phoneNumberlocation").innerHTML="Enter valid phone number";


		}
	

}

function validatePassword()
{
var password=document.getElementById("password").value;
var passwordRegex=/^[A-Za-z0-9~!@#$%^&()-_=+{}|,;:<>/]*$/;
if(passwordRegex.test(password))
{
document.getElementById("passwordlocation").innerHTML="";
}
else
{
document.getElementById("passwordlocation").innerHTML="Password should contain alphabets or numbers";

}
}

</script>  
<form> 
<h2 style="color: DARKVIOLET;">Registration Details</h2> 

  <p><font color="orangered" size="+1"><tt><b>*</b></tt></font> Indicates a  required field</p>
<br/>
<table align="center">
<tr>
<td>
<label style="font-family: verdana;"> Name:</label>
</td>


<td>
<input type="text" name="name" id="name" size=25 placeholder="Enter name" onkeyup="validateName()" required autofocus/>
 <font color="orangered" size="+1"><tt><b>*</b></tt></font> <br>
<span id="namelocation" style="color:red"></span>

<br/>

</td>
</tr> 

<tr>
<td>
<label style="font-family: verdana;">Contact No:</label>
</td>
<td>
<input type="tel" name="phoneNumber" id="phoneNumber" size=25 min="1" max="10" placeholder="Enter phoneNumber" onkeyup="validatePhoneNumber()" required autofocus/> 
 <font color="orangered" size="+1"><tt><b>*</b></tt></font> <br>
<span id="phoneNumberlocation" style="color:red"></span>
<br/>
</td>
</tr> 

<tr>
<td>
<label style="font-family: verdana;">Address:</label><br></td>
 <td> <textarea rows = "2" cols = "10" name = "description">Enter your address  here... </textarea><br></td> </tr>
<tr>
<td>
<label style="font-family: verdana;">Password:</label>
</td>

<td>
<input type="password" id ="password" name="password" maxlength="15" min ="8" size=25 placeholder="Enter password" onkeyup="validatePassword()" required  />
 <font color="orangered" size="+1"><tt><b>*</b></tt></font> 

 <a href="javascript:window.open('passwordRules.jsp', 'Password Policy', 'width=200,height=150');">Password Policy</a>	
 
 <input type="checkbox" onclick="myFunction()">Show Password
 <br/>					 
<span id="passwordlocation" style="color:red"></span>
<br/>

</td>
</tr>

						<tr>
							<td><input type="submit" value="Register" class="btn btn-success" onclick="register()"/></td>
							
							<td><input type="reset" value="Reset" class="btn btn-danger" onclick="reset()"></td>
						</tr>
					</table>

</form>  
</body>
</html>
