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
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" location="" event="" language="" listing="admin" method="geteventimages" returnVariable="events">
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
					<cfif isDefined("form.addbtn") AND (form.eventtypename neq "")>
						<cfinvoke component="BOOKMYSHOW.Components.adminsettings" eventtypename="#form.eventtypename#" method="addeventtypes" >
						<cflocation url="eventtypes.cfm">
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
															<b>EVENT NAME</b>
														</td>
														<td>
															<b>EVENT TYPE</b>
														</td>
														<td>
															<b>EVENT LOCATION</b>
														</td>
														<td>
															<b>EVENT LANGUAGE</b>
														</td>
														<td>
															<b>EVENT FROM</b>
														</td>
														<td>
															<b>EVENT TO</b>
														</td>
														<td>
															<button type="button" class="btn btn-success btn-sm" onclick="window.open('createevents.cfm?view=false&id=0','popUpWindow','height=600,width=950');" ><i class="bx bx-book-add"></i></button>	
														</td>
													</tr>
													<cfset slno="1">																										
													<cfloop index="i" from="1" to="#events.RecordCount#">														
														<tr>
															<td>
																#slno#	
															</td>
															<td>
																#events.eventname[i]#
															</td>
															<td>
																#events.eventtype[i]#
															</td>
															<td>
																#events.eventtype[i]#
															</td>
															<td>
																#events.eventlanguage[i]#
															</td>
															<td>
																#events.eventlanguage[i]#
															</td>
															<td>
																#events.eventlanguage[i]#
															</td>
															<td>
																<a title="DETELE" href="Components/adminsettings.cfc?method=deleteeventtype&id=#events.id[i]#">
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