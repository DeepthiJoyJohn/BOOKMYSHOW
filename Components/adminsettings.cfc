<cfcomponent output="false"> 
	<!--Insert to location table-->
	<cffunction name="addlocation" access="remote">
		<cfargument name="locationname">
		<cfquery name="local.addlocation" datasource="bookmyshow">
				INSERT INTO
					locations (locationname)
				VALUES 
					(<cfqueryparam value="#arguments.locationname#" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery> 
	</cffunction>
	<!--End-->
</cfcomponent>  