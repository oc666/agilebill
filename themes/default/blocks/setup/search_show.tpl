{$method->exe("setup","search_show")}
{if ($method->result == FALSE)}
    {$block->display("core:method_error")}
{else}
    {if $results == 1}
        {translate results=$results}search_result_count{/translate}
    {else}
        {translate results=$results}search_results_count{/translate}
    {/if}
  <BR>
  

  {literal} 
    <script language="JavaScript">
    <!-- START
    	var module 		= 'setup';		
    	{/literal}
    	{if $VAR._print == TRUE}
    	var p 			= '&_escape=y&_print=y';
    	{else}
    	var p 			= '';
    	{/if}{literal}
    	var IMAGE 		= '{/literal}{$NONSSL_IMAGE}{literal}';
    	var order 		= '{/literal}{$order}{literal}';
    	var sort1  		= '{/literal}{$sort}{literal}';
    	var search_id 	= '{/literal}{$search_id}{literal}';
    	var page 		= {/literal}{$page}{literal};
    	var pages		= '{/literal}{$pages}{literal}';
    	var results		= '{/literal}{$results}{literal}';
    	var limit 		= '{/literal}{$limit}{literal}';
    	record_arr = new Array ({/literal}{$limit}{literal});
    	var i = 0;	
    //  END -->
    </script>
    <SCRIPT SRC="themes/{/literal}{$THEME_NAME}{literal}/search.js"></SCRIPT>
    {/literal}
    
    <!-- SHOW THE SEARCH NAVIGATION MENU -->
    <center><script language="JavaScript">document.write(search_nav_top());</script></center>
  
<!-- BEGIN THE RESULTS CONTENT AREA -->
<div id="search_results" onKeyPress="key_handler(event);"> 
 <table id="main1" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_background">
  <form id="form1" name="form1" method="post" action="">
    <tr>
      <td>
        <table id="main2" width="100%" border="0" cellspacing="1" cellpadding="2">
		
		
		  <!-- DISPLAY THE SEARCH HEADING -->
          <tr valign="middle" align="center" class="table_heading">
            <td width="5%" class="table_heading">&nbsp;</td>
            <td width="20%" class="table_heading">
              {literal} 
                 <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=setup}field_id{/translate}{literal}','id'));
				 </script>
              {/literal}
            </td>
            <td width="55%" class="table_heading"> 
              {literal} 
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=setup}field_site_name{/translate}{literal}','site_name'));
				</script>
              {/literal} 
            </td>
            <td width="20%" class="table_heading"> 	  
			  {literal} 
              	<script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=setup}field_nonssl_url{/translate}{literal}','nonssl_url'));
				</script>
			  {/literal}  
			</td>
          	</tr>
		  
		  
		  
			 <!-- LOOP THROUGH EACH RECORD --> 
			 {foreach from=$setup item=record}
             <tr id="row{$record.id}" onClick="row_sel('{$record.id}',1);" onDblClick="window.location='?_page=setup:view&id={$record.id},';" onMouseOver="row_mouseover('{$record.id}', 'row_mouse_over_select', 'row_mouse_over');" onMouseOut="row_mouseout('{$record.id}', '{$record._C}', 'row_select');" class="{$record._C}"> 
              <td align="center"> 
                <input type="checkbox" name="record{$record.id}" value="{$record.id}" onClick="row_sel('{$record.id}',1,'{$record._C}');">
              </td>
	            <td>{$record.id}</td>
	            <td>{$record.site_name}</td>
	            <td>{$record.nonssl_url}</td>
	          </tr>
              {literal}
              <script language="JavaScript">row_sel('{/literal}{$record.id}{literal}', 0, '{/literal}{$record._C}{literal}'); record_arr[i] = '{/literal}{$record.id}{literal}'; i++; </script>
              {/literal}	          {/foreach} 	
			  <!-- END OF RESULT LOOP --> 
		  	  
        </table>
      </td>
    </tr>
  </form>
 </table>
  
{if $VAR._print != TRUE}<br>

<center>

<input type="submit" name="Submit" value="{translate}view_edit{/translate}" 	onClick="mass_do('', module+':view', limit, module);" 		class="form_button">
    <br>
  </center>
{/if}
{/if}
</div>