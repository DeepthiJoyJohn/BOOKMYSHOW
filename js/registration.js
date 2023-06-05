window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
		window.close();
    }
function validate(){
	 var passValue1 = document.getElementById("password1").value;
	 var passValue2 = document.getElementById("password2").value;
		 if((passValue1!="" && passValue2!="") || (passValue1!=null && passValue2!=null)){
		 	 if(passValue1!=passValue2){
		 		document.getElementById("message").innerHTML="PASSWORDS NOT MATCHING!!";
		 		document.getElementById("message").style.color="red";
		 	 }else{
		 	 	document.getElementById("message").innerHTML="";
		 	 }	
		 }
		 
}
function validateemail(){
	var emailname = document.getElementById("emailname").value;	
		if(emailname=="" || emailname==null){
			 
				document.getElementById("emailspan").innerHTML="EMAIL CANT BR NULL!!";
				document.getElementById("emailspan").style.color="red";
		}else{
				 document.getElementById("emailspan").innerHTML="";
	    }	
		
		
}
function passwordnullcheck(){
	
	var passValue1 = document.getElementById("Pass").value;
	var Uname = document.getElementById("Uname").value;	
	document.getElementById("username").innerHTML="";
    document.getElementById("password").innerHTML="";	
	document.getElementById("message").innerHTML="";	
	document.getElementById("username").style.color="red";	
	document.getElementById("username").style["font-size"]="10px";
	document.getElementById("password").style.color="red";
	document.getElementById("password").style["font-size"]="10px"; 
	
		if((passValue1=="" || passValue1==null) && (Uname=="" || Uname==null)){
			document.getElementById("username").innerHTML="Required";
			document.getElementById("password").innerHTML="Required";				 
		}else if(passValue1=="" || passValue1==null){
		 	document.getElementById("password").innerHTML="Required";	
			 document.getElementById("username").innerHTML="";	 		
		}else if(Uname=="" || Uname==null){
			document.getElementById("username").innerHTML="Required";	
			document.getElementById("password").innerHTML="";	 		
		}else{
			document.getElementById("username").innerHTML="";
			document.getElementById("password").innerHTML="";		 					 			
		}		 
}
function registrationnullcheck(){
	var username = document.getElementById("username").value;
	var emailname = document.getElementById("emailname").value;	
	var password1 = document.getElementById("password1").value;	
	var password2 = document.getElementById("password2").value;	
	document.getElementById("usernamespan").innerHTML="";
    document.getElementById("emailspan").innerHTML="";
	document.getElementById("paswordspan").innerHTML="";
	document.getElementById("paswordspan1").innerHTML="";
	document.getElementById("paswordspan2").innerHTML="";
	document.getElementById("usernamespan").style.color="red";
	document.getElementById("usernamespan").style["font-size"]="10px";
	document.getElementById("emailspan").style.color="red";
	document.getElementById("emailspan").style["font-size"]="10px"; 
	document.getElementById("paswordspan").style.color="red";
	document.getElementById("paswordspan").style["font-size"]="10px"; 
	document.getElementById("paswordspan2").style.color="red";
	document.getElementById("paswordspan2").style["font-size"]="10px"; 
	document.getElementById("paswordspan1").style.color="red";
	document.getElementById("paswordspan1").style["font-size"]="10px"; 
		if(username=="" || username==null){
			document.getElementById("usernamespan").innerHTML="Required";				
		}
		if(emailname=="" || emailname==null){
		 	document.getElementById("emailspan").innerHTML="Required";			 
		}
		if(password1=="" || password1==null){
			document.getElementById("paswordspan1").innerHTML="Required";					
		}
		if(password2=="" || password2==null){
			document.getElementById("paswordspan2").innerHTML="Required";								
		}
		if(password2!=password1){
			document.getElementById("paswordspan").innerHTML="Password Doest Match!!";						
		}		 
}
function contactcheck(){
	var firstname = document.getElementById("firstname").value;
	var lastname = document.getElementById("lastname").value;	
	var dob = document.getElementById("dob").value;	
	var address = document.getElementById("address").value;	
	var street = document.getElementById("street").value;
	var email = document.getElementById("email").value;	
	var phone = document.getElementById("phone").value;			
	document.getElementById("firstnamespan").innerHTML="";
    document.getElementById("lastnamespan").innerHTML="";
	document.getElementById("dobspan").innerHTML="";
	document.getElementById("addressspan").innerHTML="";
	document.getElementById("streetspan").innerHTML="";
	document.getElementById("emailspan").innerHTML="";
	document.getElementById("phonespan").innerHTML="";
	document.getElementById("firstnamespan").style.color="red";
	document.getElementById("firstnamespan").style["font-size"]="10px";
	document.getElementById("lastnamespan").style.color="red";
	document.getElementById("lastnamespan").style["font-size"]="10px"; 
	document.getElementById("dobspan").style.color="red";
	document.getElementById("dobspan").style["font-size"]="10px"; 
	document.getElementById("addressspan").style.color="red";
	document.getElementById("addressspan").style["font-size"]="10px"; 
	document.getElementById("phonespan").style.color="red";
	document.getElementById("phonespan").style["font-size"]="10px"; 
	document.getElementById("streetspan").style.color="red";
	document.getElementById("streetspan").style["font-size"]="10px"; 
	document.getElementById("emailspan").style.color="red";
	document.getElementById("emailspan").style["font-size"]="10px"; 
		if(firstname=="" || firstname==null){
			document.getElementById("firstnamespan").innerHTML="Required";				
		}
		if(lastname=="" || lastname==null){
		 	document.getElementById("lastnamespan").innerHTML="Required";			 
		}
		if(dob=="" || dob==null){
			document.getElementById("dobspan").innerHTML="Required";					
		}
		if(address=="" || address==null){
			document.getElementById("addressspan").innerHTML="Required";								
		}
		if(street=="" || street==null){
			document.getElementById("streetspan").innerHTML="Required";								
		}
		if(email=="" || email==null){
			document.getElementById("emailspan").innerHTML="Required";								
		}
		if(phone=="" || phone==null){
			document.getElementById("phonespan").innerHTML="Required";								
		}
			 
}
function testbox(value) {
	var passValue1 = document.getElementById("phone").value;	
	if (isNaN(passValue1)) 
	{
		alert ("phone No should be No");
		document.getElementById("phone").value="";
	} 
	else
	{
		return (true);
	} 
}