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
		<cfinvoke component="BOOKMYSHOW.Components.adminsettings" method="getcombo" returnVariable="combos">		  	 
		<body>
			<header id="header">			
				<div class="d-flex flex-column">
					<div class="profile">        
						<h6 class="text-light">BOOKMYSHOW</h6>        
					</div>
					<nav id="navbar" class="nav-menu navbar">
						<ul>			          	
							<li><a href="combosettings.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>Combos</span></a></li>		          
						</ul>
						<ul>			          	
							<li><a href="index.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>logout</span></a></li>		          
						</ul>
					</nav>			      		      	
				</div>
			</header>		
			<cfoutput>	
				ADMIN
			</cfoutput>
		</body>
	</form>
</html>