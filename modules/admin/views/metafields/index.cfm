<cfoutput>	
	<script type='text/javascript' src="//code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<link href="//code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" type="text/css" rel="stylesheet" media="all">
	<script type='text/javascript' src="/assets/js/admin/reorder.js"></script>
	<script type="text/javascript">	
		$(function() {
			initSortable('#urlFor(				
				route		= "admin~Field",
				controller	= "metafields",
				action		= "updateOrder",
				modelName	= params.modelname, 
				params		= buttonParams
			)#');
		});
	</script>
	<cfset contentFor(headerTitle	= '<span class="elusive icon-user"></span> #metafieldInfo.singular# Fields')>
	<cfif !isNull(metafields)>
		<cfset contentFor(headerButtons = 
					'<li class="headertab">
						#linkTo(
							text		= "<span class=""elusive icon-user""></span> Add Field",
							route		= "admin~Field",
							controller	= "metafields",
							action		= "new",
							modelName	= params.modelName, 
							params		= buttonParams,
							class		= "btn btn-default"
						)#	
					</li>')>
			
		<style type="text/css">
			.actions .btn, .label {
				margin-bottom:3px !important;
				display:inline-block;
			}
		</style>
		
		<strong>Tip:</strong> You can change the order of the fields by dragging and dropping.<br><br>
		
		<table class="table table-striped" id="sortable">
			<thead>
				<tr>
					<th class="col-md-1">&nbsp;</th>
					<th class="col-md-2">Type</th>
					<th>Name</th>					
					<th class="col-md-1">Actions</th>
				</tr>
			</thead>
			<tbody> 	
				<cfloop query="metafields">
					<tr rel="#metafields.id#">
						<td class="text-center">
							<span class="elusive icon-move"></span>
						</td>						
						<td>
							#type#
						</td>
						<td>
							#name#
						</td>						
						<td class="actions">						
							<a href=
							'#urlFor(
								route		= "admin~FieldId",
								controller	= "metafields",
								action		= "edit",
								modelName	= params.modelname, 
								id			= id,
								params		= buttonParams
							)#' 
							class="btn btn-default btn-sm"><span class="elusive icon-pencil"></span></a>
							<a href=
							'#urlFor(
								route		= "admin~FieldId",
								controller	= "metafields",
								action		= "delete",
								modelName	= params.modelname, 
								id			= id,
								params		= buttonParams
							)#' 
							class="btn btn-danger btn-sm confirmDelete"><span class="elusive icon-trash"></span></a>
						</td>
					</tr>			
				</cfloop>	
			</tbody>
		</table>
	<cfelse>
		<h3>There was an issue, go back and try again.</h3><br><br>

	</cfif>
	
</cfoutput>