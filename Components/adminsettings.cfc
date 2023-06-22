<cfcomponent output="false"> 
    <cffunction name="combos" access="remote">
		<cfquery name="local.combos" datasource="bookmyshow">
				SELECT 					
					*
				FROM 
					combos 
		</cfquery> 
		<cfreturn local.combos>
	</cffunction>  
	
</cfcomponent>  