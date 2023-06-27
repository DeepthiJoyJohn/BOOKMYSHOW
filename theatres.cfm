<html>
	<form id="form" name="form" method="post" action="" enctype="multipart/form-data">
		<head>	    
			<title>BOOKMYSHOW</title>
			<link href="show/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			<link href="show/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
			<link href="show/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
			<link href="show/css/style.css" rel="stylesheet">		
			<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>		
			<script src="js/home.js" type="text/javascript"></script>
		</head>
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="gettheatreinfo" returnVariable="theatres">
		<body>
			<header id="header">			
				<div class="d-flex flex-column">
					<div class="profile">        
						<h6 class="text-light">BOOKMYSHOW</h6>        
					</div>
					<nav id="navbar" class="nav-menu navbar">
						<ul>			          	
							<li><a href="admin.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>Back</span></a></li>		          
						</ul>
						<ul>			          	
							<li><a href="index.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>logout</span></a></li>		          
						</ul>
					</nav>			      		      	
				</div>
			</header>		
			<cfoutput>	
				<section  class="d-flex flex-column justify-content-center align-items-center">				
				<form id="form" name="form" method="post" action="">
					<cfif isDefined("form.addbtn") AND (form.theatrename neq "" AND form.theatreaddress neq "" AND form.showtime neq "")>
						<cfinvoke component="BOOKMYSHOW.Components.adminsettings" theatrename="#form.theatrename#" showtime="#form.showtime#" theatreaddress="#form.theatreaddress#"method="addtheatres" >
						<cflocation url="theatres.cfm">
					</cfif> 
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
															<b>SL:NO</b>
														</td>														
														<td>
															<b>THEATRE NAME</b>
														</td>
														<td>
															<b>THEATRE ADDRESS</b>
														</td>
														<td>
															<b>SHOW TIME</b>
														</td>
													</tr>
													<tr>
													    <td></td>
														<td>
															<input type="text" class="form-control-sm" id="theatrename" name="theatrename"><br>
															<span id="errornamediv"></span>
														</td>
														<td>
															<textarea id="theatreaddress" name="theatreaddress" class="form-control-sm"></textarea><br>
															<span id="errornamediv1"></span>
														</td>
														<td>
															<input type="time" class="form-control-sm" id="showtime" name="showtime"><br>
															<span id="errornamediv2"></span>
														</td>
														<td>
															<button class="btn btn-primary btn-xs" onclick="checknullthea();" type="submit" id="addbtn" name="addbtn"><i class="bx bx-book-add"></i></button>
														</td>

													</tr>
													<cfset slno="1">																										
													<cfloop index="i" from="1" to="#theatres.RecordCount#">														
														<tr>
															<td>
																#slno#	
															</td>
															<td>
																#theatres.theatrename[i]#
															</td>
															<td>
																#theatres.theatreadd[i]#
															</td>
															<td>
																#theatres.hr[i]#:#theatres.mi[i]#
															</td>
															<td>
																<a title="DETELE" href="Components/adminsettings.cfc?method=deletetheatre&id=#theatres.id[i]#">
																<i class="bx bx-trash" aria-hidden="true"></i>
															</td>
														</tr>
														<cfset #slno#=#slno#+1>
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
	</form>
</html>