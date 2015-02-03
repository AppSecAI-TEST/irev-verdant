  <%@ include file="/WEB-INF/jsp/include.jsp" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
    <html>  
    <head>
    <title><fmt:message key="title"/></title>  
    <link rel="stylesheet" type="text/css" href="irev-style.css" />	  
	<link rel="stylesheet" href="css/jquery-ui.css">
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui.js"></script>   
    <script type='text/javascript' src="js/popupmessage.js" ></script>
    <link rel="stylesheet" href="css/popupmessage.css">
    </head>  
    
    <body>  
    

    <script>
     // alert("refresh " + '<%=request.getParameter("refresh")%>'); 
   
   
   function Redirect(){
	   (""+window.location).replace(/&?savestat=([^&]$|[^&]*)/i, "");
		location.reload(true);
		 }  
                      
   </script> 
      <div id="pageHdr">
	<fmt:message key="Company.heading"/>
</div>         
      
      <div>  
       <form:form method="post" align ="left" commandName="editCompany" >  
       <br>
        <table>  
         <tr>  
          <td>Company Name :</td>  
          <td><form:input path="Companyname" required="required" />  
          </td>  
         </tr>  
         <tr> 
          
         <tr>  
          <td>Company Address :</td>  
          
          <td><form:textarea   path="CompanyAddress"  rows="5" cols="70" /></td>
           
         </tr>
         <tr>  
          <td>Precision for Report values :</td>  
          
          <td><form:input type="number"  path="nprecision" maxlength="2"  /></td>
           
         </tr>
         
         <tr> 
          <td><input type="submit" value="Save" class="myButton"/> <span> </span>            
           <!--<input type="button" value="Back" name="cancel" class="myButton" onclick="Redirect()"/>  -->   
          </td> 
         </tr>  
        </table>  
        <form:hidden path="Companyid" />  
        
       </form:form>  
      </div>  
       
     <script>
     $(document).ready(function () {
    	 var savestat='<%=request.getParameter("savestat")%>';
   		//alert (parmdelete);
   		if(savestat!=null && savestat!="")
   			{
   			if(savestat==1)
 				{
 		flashMessenger.setText('Saved');
 				}               
   			}
   		var ref='<%=request.getParameter("refresh")%>';
   	   if(ref=="true")
   		   {
   	         var url = '<%=request.getContextPath()%>/assettree.htm?treemode=edit';     
   	                       parent.frames['AssetTree'].location = url; }
  		 
  	});
     </script>
    </body>  
    </html>  