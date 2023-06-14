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
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getseats" returnVariable="seats">	
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getseatdetails" returnVariable="seatsdetails">									
		<cfoutput>					  	 
			<section  class="d-flex flex-column">				
				<form id="form" name="form" method="post" action="">
					<div class="container h-100 bodyclass">
						<div class="row d-flex justify-content-center align-items-center h-100">
							<div class="col-lg-12 col-xl-11">
								<div>
									<div>
										<div class="row justify-content-center">			            
											<div>
												<cfloop index="i" from="1" to="#seats.RecordCount#">												
													<table class="table">
														<tr>
															<td>#seats.theatretype[i]# Rs-#seats.cellamt[i]#</td>	
														</tr>
														<tr>
															<td>
																<table>
																	<cfloop index="y" from="1" to="#seats.noofrows[i]#">
																		<tr>
																			<cfloop index="x" from="1" to="#seats.noofcols[i]#">
																				<cfloop index="z" from="1" to="#seatsdetails.RecordCount#">
																					<cfif ((#seatsdetails.rowno[z]# eq #y#) AND (#seatsdetails.colno[z]# eq #x#)) AND (#seats.id[i]# eq #seatsdetails.theatredetailsid[z]# AND #seatsdetails.value[x]# neq "")>
																						<td><button>#seatsdetails.value[x]#</button></td>
																					<cfelse>
																						<td></td>
																					</cfif> 
																				</cfloop>																				
																			</cfloop>
																		</tr>
																	</cfloop>
																</table>
															</td>
														</tr>
													</table>
												</cfloop>
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