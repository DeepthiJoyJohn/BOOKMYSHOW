 <!DOCTYPE html>
	<head>	    
		<title>BOOKMYSHOW</title>
	    <link href="show/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="show/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="show/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	    <link href="show/css/style.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
		<script src="js/home.js" type="text/javascript"></script>
	</head>	
	<body>	
		<header id="header">			
			<div class="d-flex flex-column">
		    	<div class="profile">        
		        	<h6 class="text-light">BOOKMYSHOW</h6>        
		      	</div>		      		      	
		    </div>
			<nav id="navbar" class="nav-menu navbar">
			        <ul>			          	
			          	<li><a href="index.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>Logout</span></a></li>		          
			        </ul>
		    </nav>	
		</header>
		<cfoutput>	
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getseats" theatreid="#url.id#" returnVariable="seats">	
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getseatdetails" theatredetailsid="#url.id#" eventid="#url.eventid#" returnVariable="seatsdetails">		
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getcountofselected" theatredetailsid="#url.id#" returnVariable="countofselected">																						  	 
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
																				    <cfif #seatsdetails.seatstatus[z]# eq "sold">
																						<cfset disable="disabled">
																					<cfelse>
																						<cfset disable="">
																					</cfif>	
																					<cfif ((#seatsdetails.rowno[z]# eq #y#) AND (#seatsdetails.colno[z]# eq #x#)) AND (#seats.id[i]# eq #seatsdetails.theatredetailsid[z]#)>																		     
																						<td><button #disable# type="button" onclick="markseat(#seatsdetails.id[z]#)" id="#seatsdetails.id[z]#" class="#seatsdetails.seatstatus[z]#">#seatsdetails.value[z]#</button></td>																																											
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
												<table>
													<cfif #seats.RecordCount# gte 1>
													<tr>
														<td><button class="available">&nbsp;</button><b> available</b></td>
														<td><button class="selected">&nbsp;</button><b> selected</b></td>
														<td><button class="sold">&nbsp;</button><b> sold</b><div id="1"></div></td>
													</tr>
													<cfelse>
														<span>No seats defined!!!</span>
													</cfif>
													<cfif #countofselected.RecordCount# gte 1>
														<tr>
															<cfset totalamt=(#countofselected.cellamt#)*(#countofselected.RecordCount#)>
															<td><button onclick="payamt(#url.id#)" class="btn btn-danger btn-sm">Book & Pay Amt-#totalamt#</button></td>
														</tr>
													</cfif>
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