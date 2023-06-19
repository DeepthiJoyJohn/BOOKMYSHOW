function invokecfc(value) {	
	$(document).ready(function(){	
		$.ajax({
			type: "GET",
			url: '../Components/bookmyshow.cfc?method=geteventimages&event='+value,
			cache: false,
			success: function(data){	
				
			},
		});

});
}
function eventdetails(value) {	
	window.location="eventdetails.cfm?id="+value;
}
function eventseats(value) {
	window.location="theatreseats.cfm?id="+value;
}
function payamt(id) {
	$.ajax({
		type: "GET",
		url: 'Components/bookmyshow.cfc?method=updatepayment&theatredetailsid='+id,					
		success: function(data){
			location.reload();
		},
	});
}
function markseat(value){
	            
				$.ajax({
					type: "GET",
					url: 'Components/bookmyshow.cfc?method=updateseatstatus&seatid='+value,					
					success: function(data){
						location.reload();
					},
				});
				
				
	
}

