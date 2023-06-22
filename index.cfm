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
		      	<nav id="navbar" class="nav-menu navbar">
			        <ul>			          	
			          	<li><a href="registration.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>SignUp</span></a></li>		          
			        </ul>
		        </nav>		      	
		    </div>
		</header>	  	 
		<section  class="d-flex flex-column justify-content-center align-items-center">				
		  	<form id="form" name="form" method="post" action="">
				<div class="container h-100 bodyclass">
			    	<div class="row d-flex justify-content-center align-items-center h-100">
			      		<div class="col-lg-12 col-xl-11">
			        		<div class="card text-black" style="border-radius: 25px;">
			          			<div>
									<cfset usernamemessage="">
									<cfset passwordmessage="">
									<cfset loginmessage="">
									<cfif isDefined("form.log")>							                 	
										<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="login" 
										Uname="#form.Uname#" Pass="#form.Pass#" returnVariable="res">
										<cfif  ArrayContains(res, "Wrong Credendials") >
										    <cfset loginmessage="Wrong Credentials!!">
										</cfif>										
										<cfif  ArrayContains(res, "Username Required") >
											<cfset usernamemessage="Required">
										</cfif>	
										<cfif  ArrayContains(res, "Password Required") >
											<cfset passwordmessage="Required">										
										</cfif>	
										<cfif ArrayContains(res, "Correct")>											
											<cflocation url="home.cfm" addtoken="no">
										</cfif>	
										<cfif ArrayContains(res, "admin")>											
											<cflocation url="admin.cfm" addtoken="no">
										</cfif>										
									</cfif>
			            			<div class="row justify-content-center">			            
			              				<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
			               					<p class="text-center h5 fw-bold mb-5 mx-1 mx-md-4 mt-4">Log In</p>	
											<cfoutput>		                
												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-user fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<input type="text" id="Uname" required="yes" name="Uname" maxlength="15" class="form-control"/>
														<label class="form-label">User Name</label>													
														<span id="username">#usernamemessage#</span>
													</div>
												</div>			                  				
												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<input type="password" id="Pass" required="yes" name="Pass" maxlength="15" class="form-control"/>
														<label class="form-label">Password</label>
														<span id="password">#passwordmessage#</span>
													</div>													
												</div>
												<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">																			                	
							                		<span id="message">#loginmessage#</span>
							                	</div>
											</cfoutput>                 				
							                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">																			                	
							                	<input type="Submit" type="Submit" onclick="javascript:passwordnullcheck()" name="log" id="log"  class="btn btn-primary btn-lg" value="Log In">
							                </div>
			              				</div>
							            <div class="w-50 p-3"><br><br><br>
							                <img src="show/img/d.jpg" class="img-fluid" alt="Sample image">
							            </div>
			            			</div>
			          			</div>
			       	 		</div>
			      		</div>
			    	</div>
			  	</div>			
			</form>		    
		</section>	
	</body>
</html>