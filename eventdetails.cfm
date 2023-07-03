 <html lang="en">
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
		<cfset url.eventid = decrypt(#url.eventid#, session.key, "AES", "HEX") />            
		<header id="header">			
			<div class="d-flex flex-column">
		    	<div class="profile">        
		        	<h6 class="text-light">BOOKMYSHOW</h6>        
		      	</div>
				<nav id="navbar" class="nav-menu navbar">
			        <ul>			          	
			          	<li><a href="index.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>logout</span></a></li>		          
			        </ul>
					<ul>			          	
			          	<li><a href="home.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>Back</span></a></li>		          
			        </ul>
		        </nav>			      		      	
		    </div>
		</header>
		<cfset datevalue="#LSDateFormat(now(), 'yyyy-mm-dd')#">
		<cfif isDefined("form.datepicker")>
			<cfset datevalue="#form.datepicker#">
			<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" eventid="#url.eventid#" datepicker="#form.datepicker#" method="gettheatreinfo" returnVariable="theatre">					
		<cfelse>
			<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" eventid="#url.eventid#" datepicker="" method="gettheatreinfo" returnVariable="theatre">		
		</cfif>		
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
														<td>
															<input placeholder="Selected date" type="date" onchange="comboassign(this.value)" value="#datevalue#" name="datepicker" id="datepicker" class="form-control datepicker">
														</td>
														<td>
															<b>VENUE NAME</b>
														</td>
														<td>
															<b>SHOW TIME</b>
														</td>
													</tr>
													<tr>														
														<cfloop index="i" from="1" to="#theatre.RecordCount#">
															<td>
																<svg width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
																	<path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
																</svg>
														    </td>
															<td>
																#theatre.theatrename[i]#  #theatre.theatreadd[i]#
															</td>
															<td>
																<cfset encryptedtheatreid=Encrypt(#theatre.id[i]#, session.key, "AES", "HEX") /> 
																<cfset encryptedeventid=Encrypt(#url.eventid#, session.key, "AES", "HEX") /> 
																<cfset encrypteddate=Encrypt(#datevalue#, session.key, "AES", "HEX") /> 
																<button type="button" onclick="eventseats('#encryptedtheatreid#','#encryptedeventid#','#encrypteddate#')" class="btn btn-outline-dark">#theatre.hr[i]# : #theatre.mi[i]#</button>
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