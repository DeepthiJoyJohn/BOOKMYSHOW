 <html lang="en">
	<head>	    
		<title>BOOKMYSHOW</title>
	    <link href="show/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="show/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="show/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	    <link href="show/css/style.css" rel="stylesheet">	
		<script src="js/registration.js" type="text/javascript"></script>
	</head>	
	<body>	
		<header id="header">			
			<div class="d-flex flex-column">
		    	<div class="profile">        
		        	<h6 class="text-light">BOOKMYSHOW</h6>        
		      	</div>		      		      	
		    </div>
		</header>	
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="gettheatreinfo" returnVariable="theatre">
		<cfoutput>					  	 
			<section  class="d-flex flex-column justify-content-center align-items-center">				
				<form id="form" name="form" method="post" action="">
					<div class="container h-100 bodyclass">
						<div class="row d-flex justify-content-center align-items-center h-100">
							<div class="col-lg-12 col-xl-11">
								<div>
									<div>
										<div class="row justify-content-center">			            
											<div>
												<table class="table">
													<tr>
														<cfloop index="i" from="1" to="#theatre.RecordCount#">
															<td>
																#theatre.theatrename[i]#  #theatre.theatreadd[i]#
															</td>
															<td>
																<button type="button" class="btn btn-outline-dark">#theatre.hr[i]# : #theatre.mi[i]#</button>
															</td>
															<cfif i%1 eq 0>
																<tr>
															</cfif>
														</cfloop>
													</tr>
												</table>
											</div>											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>			
				</form>		    
			</section>
		</cfoutput>	
	</body>
</html>