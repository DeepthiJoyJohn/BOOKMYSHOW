function payamt1(datevalue,theatreid,eventid) {	
	var slides = document.getElementsByClassName("btn btn-success btn-sm");
	for(var i = 0; i < ((slides.length)-1); i++)
		{	
			if(slides[i].id!=0){
				$.ajax({
					type: "GET",
					url: 'Components/bookmyshow.cfc?method=updatepayment&seatid='+slides[i].id+'&date='+datevalue+'&theatreid='+theatreid+'&eventid='+eventid,					
					success: function(data){
						window.location.reload();
					},
				});
			}
			
		}		
}

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
		document.getElementById('bottomtr').className='bottomview';
}



   