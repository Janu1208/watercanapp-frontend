<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
<script type="text/javascript">
function getUserId()
{
	var user=JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
	var id=user.id;
    return id;
}
getUserId();
</script>

<script type="text/javascript">
function reserveCan()
{
	event.preventDefault();
	var reserveCans=document.getElementById("reserveCans").value;
	var  userId = getUserId();
	
	var formData = "userId="+userId + "&reserveCans="+ reserveCans;
    var url = "http://localhost:8080/watercanappf-api/ReserveCanServlet?" + formData;
    		   $.get(url, function(response){
    			   console.log(response);
    			    var data= JSON.parse(response);
    			    console.log(reserveCans);
    			    console.log(data);
    			    if ( data.errorMessage != null) {
    			    	alert(data.errorMessage);
    			    	window.location.href= "?pageName=availableCans.jsp";
    			    }
    			    else
    			    	{
    			    	alert("reserved Succesfully");
    			    	window.location.href= "?pageName=userOperations.jsp";
    			    	}
    			       
    });		
}
</script>
</head>
<body style="text-align: center" font-color="red">
<jsp:include page="userOpHeader.jsp"></jsp:include><br>


<div id="id"></div>

<form onsubmit="reserveCan()">
<h1 >Reserve Cans</h1>
<br/>
<tr>
<td>
How many cans you want to Reserve?
</td>
<td>
<input type="number" name="reserveCans" id="reserveCans" placeholder="Enter no.of cans" min=1 required autofocus  /><br>
</td>
<br/>
<input type="submit"  value="Submit" class="btn btn-success">

<input type="button"  value="Reset" class="btn btn-danger" >
<input type="button" class ="button" value="Back" onclick="history.go(-1);"><br></br>
</tr>
 <a href="javascript:window.open('availCans.jsp', 'Password Policy', 'width=200,height=150');">Available Cans</a>							

</form>


</body>
</html>