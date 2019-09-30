<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>

</head>
<body style="text-align: center" font-color="red">
<jsp:include page="userOpHeader.jsp"></jsp:include><br>
<script type="text/javascript">
function getUserId()
{
	var user=JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
	var id=user.id;
    return id;
}
</script>
<script type="text/javascript">

function orderCan()
{
	console.log("inerfunction");
	event.preventDefault();
	var orderCans=document.getElementById("orderCans").value;
	var  userId = getUserId();
	var formData = "userId="+userId + "&orderCans="+ orderCans;
    var url = "http://localhost:8080/watercanappf-api/OrderCanServlet?" + formData;
    		 $.get(url, function(response){
    			    var data= JSON.parse(response);
    			    if ( data.errorMessage != null) {
    			    	alert(data.errorMessage);
    			    	window.location.href= "?pageName=directOrder.jsp";

    			    }
    			    else
    			    	{
    			    	alert("ordered Succesfully");
    			    	window.location.href= "?pageName=userOperations.jsp";
    			    	}
    			       
    });
   
			
}

</script>
<script>
function validateOrderCans()
{
	var orderCans=document.getElementById("orderCans").value;
	var phoneNumberRegex=/^[0-9]*$/;
	if(orderCansRegex.test(orderCans))
		{
		document.getElementById("orderCanslocation").innerHTML="";

		}
			
	else
		{
		document.getElementById("orderCanslocation").innerHTML="please enter a valid number";


		}
	

}
</script>
<div id="id"></div>
<form onsubmit="orderCan()">
<h1>Order Cans</h1>
<br/>
How many cans you want to order?
<input type="number" name="orderCans" id="orderCans" placeholder="Enter no.of cans" onkeyup="validateOrderCans()" min=1 required autofocus  /><br>
<br/>
<span id="orderCanslocation" style="color:red"></span>

<input type="submit"  value="Submit" class="btn btn-success">

<input type="button"  value="Reset" class="btn btn-danger" >
<input type="button" class ="button" value="Back" class="btn btn-primary" onclick="history.go(-1);"><br></br>
 
 <a href="javascript:window.open('availCans.jsp', 'Password Policy', 'width=200,height=150');">Available Cans</a>							

</form>


</body>
</html>