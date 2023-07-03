 <!DOCTYPE html>
	<head>	    
		<title>BOOKMYSHOW</title>
	    <link href="show/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="show/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="show/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	    <link href="show/css/style.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
		<script src="js/home.js" type="text/javascript"></script>
		<script src="js/seat.js" type="text/javascript"></script>
	</head>	
	<cfoutput>	
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
					<ul>			          	
			          	<li><a href="eventdetails.cfm?eventid=#url.eventid#" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>Back</span></a></li>		          
			        </ul>
		    </nav>	
		</header>	
		<cfset url.theatreid = decrypt(#url.theatreid#, session.key, "AES", "HEX") />   
		<cfset url.datevalue = decrypt(#url.datevalue#, session.key, "AES", "HEX") />  
		
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getseats" theatreid="#url.theatreid#" returnVariable="seats">
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getsoldseats" theatreid="#url.theatreid#" returnVariable="seatssold">				
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
													<table class="center" align="center">
														<tr>
															<td>#seats.theatretype[i]# Rs-#seats.cellamt[i]#</td>	
														</tr>
														<tr>
															<td>
																<table>
																	<cfloop index="y" from="1" to="#seats.noofrows[i]#">
																		<tr>
																			<cfloop index="x" from="1" to="#seats.noofcols[i]#">
																				<cfset btnclass="btn btn-light btn-sm">
																			    <cfset btndis="">
																			    <cfif structKeyExists(seatssold,"#i##y##x#")>
																					<cfset btnclass="btn btn-secondary btn-sm">
																					<cfset btndis="disabled">
																				</cfif>
																			    <td><button #btndis# type="button" name="seatbtn" onclick="selectseat(#i##y##x#)" id="#i##y##x#" value="#seats.cellamt[i]#" class="#btnclass#">#x#</button></td>																																			
																			</cfloop>
																		</tr>
																	</cfloop>
																</table>
															</td>
														</tr>
													</table>
												</cfloop>
												<table class="center" align="center">
													<tr>
														<td><button class="btn btn-light btn-sm">&nbsp;</button><b> available</b></td>
														<td><button id="0" class="btn btn-success btn-sm">&nbsp;</button><b> selected</b></td>
														<td><button class="btn btn-secondary btn-sm">&nbsp;</button><b> sold</b></td>
													</tr>													
													<tr class="bottom" id="bottomtr">
														<td colspan="3" align="center"><button type="button" onclick="payamt1('#url.datevalue#','#url.theatreid#')" id="payamt" class="btn btn-danger btn-sm"><span class="btn" id="payamt"></span></button></td>
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