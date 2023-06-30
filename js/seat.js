$(document).ready( function() {
	var slides = document.getElementsByClassName("btn btn-success btn-sm");
	
	if(slides.length>1){
		document.getElementById("payamt").style.display="block";
	}else{
		document.getElementById("payamt").style.display="none";	
	}
	
});
function selectseat(id){
	var classname=document.getElementById(id).className;
	if(classname=="btn btn-light btn-sm"){
		document.getElementById(id).className='btn btn-success btn-sm';
	}else{
		document.getElementById(id).className='btn btn-light btn-sm';
	}
	var slides = document.getElementsByClassName("btn btn-success btn-sm");
	var amt=0.0;
	for(var i = 0; i < ((slides.length)-1); i++)
		{
			amt=amt+(slides[i].value*1);
		}
		if(amt>0){
			document.getElementById('payamt').innerHTML="Book & Pay Amt- "+amt;
			document.getElementById("payamt").style.display="block";
		}else{
			document.getElementById("payamt").style.display="none";
		}
}
function payamt(date,theatreid) {
	alert("S");
	var slides = document.getElementsByClassName("btn btn-success btn-sm");
	for(var i = 0; i < ((slides.length)-1); i++)
		{	
			alert(slides[i].id);
			$.ajax({
				type: "GET",
				url: 'Components/bookmyshow.cfc?method=updatepayment&seatid='+slides[i].id+'date='+date+'theatreid='+theatreid,					
				success: function(data){
					location.reload();
				},
			});
		}
}



   