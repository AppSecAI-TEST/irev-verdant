 <%@ include file="/WEB-INF/jsp/include.jsp" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<link rel="stylesheet" href="css/jquery-ui.css">
  <script src="js/jquery.js"></script>
  <script src="js/jquery-ui.js"></script>  
  <script type='text/javascript' src="js/popupmessage.js" ></script>
    <link rel="stylesheet" href="css/popupmessage.css">
   
    <link rel="stylesheet" type="text/css" href="irev-style.css" />
<style>
#drop{
	border:2px dashed #bbb;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	padding:25px;
	text-align:center;
	font:20pt bold,"Vollkorn";color:#bbb
}
#b64data{
	width:100%;
}
 
.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
 
<body>
<script>
var fileext;

//<!-- Begin Script
var progressEnd = 10; // set to number of progress <span>'s.
var progressColor = 'blue'; // set to progress bar color
var progressInterval = 1000; // set to time between updates (milli-seconds)

var progressAt = progressEnd;
var progressTimer;
function progress_clear() {
for (var i = 1; i <= progressEnd; i++) document.getElementById('progress'+i).style.backgroundColor = 'transparent';
progressAt = 0;
}
function progress_update() {
	//console.log("progress_update");
	tabledata();
	/*var filename=document.getElementById("filename").value;
	if(filename==null || filename=="")
		{
	alert("Please Select file to import");
		}
	*/
	document.getElementById("progressbar").style.display="block"
progressAt++;
if (progressAt > progressEnd) progress_clear();
else document.getElementById('progress'+progressAt).style.backgroundColor = progressColor;
progressTimer = setTimeout('progress_update()',progressInterval);
}
function progress_stop() {
clearTimeout(progressTimer);
progress_clear();
}
// End --> 

//$('#myTable tr:last').after('<tr>...</tr><tr>...</tr>');

</script>



<div id="appbody">



	<h2>Import Test Data</h2>
 
	<form:form name="form1" id="form1" method="POST" commandName="TestData" enctype="multipart/form-data">
 
		<form:errors path="*" cssClass="errorblock" element="div" />
 
		<br>
		<table id="tblmain">
		<tr><td>Test Center * :</td>  
		<td><form:input path="testcenter" required="required" /></td>
		
		</tr>
		
		<tr>
		<td>Test Name * :</td>  
          <td><form:input path="testname" required="required" />  
          </td>
          <td>Test date *:</td>
	     <td><form:input id="dttest" path="strtestdate" type="datetime-local" required="required" /> </td>
		</tr>
		<tr>
		<td > Product Serial No: </td>
       <td >
			           
			 <form:select path="productserialid" required="required" >  
			 <option value="">--Select--</option>              
			 <c:forEach items="${prodserlist}" var="prdser"> 
			  <form:option label="${prdser.productserial}"   value="${prdser.productserialid}"/>	     
			</c:forEach>
			</form:select>
			   &nbsp; &nbsp;&nbsp;  Selected Product Type : ${prodtype}
          </td>
          <td>Test Type * :</td> 
          
          <td>          
           <form:select id="testtype"  path="testtype"  required="required" >           		 
		</form:select>              
          </td> 
          </tr>
          <tr>
          <td>Test Description * :</td>  
        <td><form:textarea id="testdesc"  path="testdesc"  rows="2" cols="50" /></td>   
          
		<td>Test Procedure  :</td> 
		<td><form:textarea id="testproc"  path="testproc"  rows="2" cols="40" /></td>   
		        
		</tr>
		<tr>
		<td>Instruments Used  :</td> 
		<td><form:textarea   path="instruments"  rows="2" cols="50" /></td>
		<td>Calibration Status  :</td> 
		<td><form:textarea   path="calibration"  rows="2" cols="40" /></td> 
		</tr>
        </table> 
         <br> 
         
         
       <table id="tbimport">  
       <tr> 
      
		<td>File Type * :</td> 
          
          <td width="50">
           <form:select id="ftype" name="D1" path="filetype"  ></form:select>
         
		</td>
		</tr>
	
		<tr>
		<td>
		<div id="imp">
		<p><input type="file" name="filename" id="filename" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" title=" click here to select an VP Data file"/></p>
		</div>
		</td>
		
		
		</table>
		<table id="tbimport1">
		<tr>
		<td width="20%"> Frequency :</td>
       <td>		
           <input type="number" id="selfreq" name="D1" size="10" ></input>
        </td>
        <td><form:select path="frequnit" id="frequnit">
        <form:option value="MHz" label="MHz"></form:option>
   		 <form:option value="GHz" label="GHz"></form:option>  
   		 
		</form:select> 
        <td>		
           <input type="button" id="lg" class="mybutton" value ="Add Freq" onclick="AddNew();" />
        </td>
	  </tr>
		</table>
		
		
	<table id="tblData" class="hover order-column cell-border">
	<thead>
				<tr>
					<th scope="col"> Frequency </th>					
					<th scope="col"> </th>
					
				</tr>
	</thead>
	<tbody>
    <c:forEach items="${freqlist}" var="freqlst">
		<tr>
			<td> <c:out value="${freqlst.frequency}"/> <br>
			
			
			<td> </td> <br>
			<td> <img src='img/delete.jpg' class='btnDelete'/><img src='img/edit.jpg' class='btnEdit'/> </td>
		</tr>
    </c:forEach> 
	</tbody>
	</table> 
	
	
	
	    <form:hidden id="testid" path="testid"></form:hidden>
		<form:hidden id="strfreq" path="strjsonfreq"></form:hidden>
		<form:hidden id="originalfilename" path="originalfilename"></form:hidden>
		<form:hidden path="ptype" ></form:hidden>
		<input type="submit" id="more" value="More" name="fmaction" class="myButton" onclick="progress_update();form1.submit();"/>
		<input type="submit" id="done" value="Done" name="fmaction" class="myButton" onclick="progress_update();form1.submit();"/>
		<input type="submit" id="save" value="Save" name="fmaction" class="myButton" onclick="form1.submit();" style="visibility:hidden"/>
		<input type="button" id="cancel" value="Cancel"  class="myButton" style="visibility:hidden" onclick="fncancel();"/>
		<span><form:errors path="filename" cssClass="error" />
		</span>
 
	</form:form>
	<table align="center" id="progressbar" style="display:none"><tr><td><b>Loading ....</b>
<div style="font-size:8pt;padding:2px;border:solid black 1px">
<span id="progress0">&nbsp; &nbsp;</span>
<span id="progress1">&nbsp; &nbsp;</span>
<span id="progress2">&nbsp; &nbsp;</span>
<span id="progress3">&nbsp; &nbsp;</span>
<span id="progress4">&nbsp; &nbsp;</span>
<span id="progress5">&nbsp; &nbsp;</span>
<span id="progress6">&nbsp; &nbsp;</span>
<span id="progress7">&nbsp; &nbsp;</span>
<span id="progress8">&nbsp; &nbsp;</span>
<span id="progress9">&nbsp; &nbsp;</span>
<span id="progress10">&nbsp; &nbsp;</span>
</div>
</td></tr></table>
	
 </div>



<script>
var mode='<%=request.getParameter("mode")%>';

$(document).ready( function () {
	var testtype = document.getElementById('testtype');
	var ptype=document.getElementById("ptype").value;
	var i;
	testtype.innerHTML="";
	
	if( ptype=="L" || ptype=="S" ) {	
		var el = document.createElement("option");
		el.textContent = "--Select--";
		el.value = "-1";
		testtype.appendChild(el);
	    el = document.createElement("option");
	    el.textContent = 'Azimuth';
	    el.value ='A';
	    testtype.appendChild(el);
	    el = document.createElement("option");
	    el.textContent = 'Elevation';
	    el.value ='E';
	    testtype.appendChild(el);  }
	else 	
	{	 
		var el = document.createElement("option");
		el.textContent = "--Select--";
		el.value = "-1";
		testtype.appendChild(el);
	    el = document.createElement("option");
	    el.textContent = 'With CP Conversion';
	    el.value ='CP';
	    testtype.appendChild(el);
	    el = document.createElement("option");
	    el.textContent = 'Without CP Conversion';
	    el.value ='NCP';
	    testtype.appendChild(el); 
	    el = document.createElement("option");
	    el.textContent = 'Direct CP';
	    el.value ='DCP';
	    testtype.appendChild(el); }
	
	//document.getElementById("strfreq").value='{"jsonfreq":[{"freq":100, "lg":1},{"freq":1000, "lg":2},{"freq":2000, "lg":2}]}';
	/*if(document.getElementById("ptype").value=="C")
		{
		document.getElementById("A").style.visibility="hidden";
		document.getElementById("E").style.visibility="hidden";
		}
	else
		{
		document.getElementById("NCP").style.visibility="hidden";
		document.getElementById("DCP").style.visibility="hidden";
		document.getElementById("CP").style.visibility="hidden";
		}*/
	
	var testid=document.getElementById("testid").value;
	 console.log("testid "+testid);
	 if(testid!="" && testid!=null && testid !='null' && testid!=0)
		{
		 document.getElementById("frequnit").disabled = true;
		 document.getElementById("testtype").value='${testtype}';
		 //$("#testtype").trigger( "onchange" );
		 $("#testtype").val('${testtype}').change();
		 if(mode=='edit')
			 {
			 document.getElementById("tbimport").style.visibility="hidden";
			 document.getElementById("tbimport1").style.visibility="hidden";
			 document.getElementById("tblData").style.visibility="hidden";
			 document.getElementById("more").style.visibility="hidden";
			 document.getElementById("done").style.visibility="hidden";
			 document.getElementById("save").style.visibility="visible";
			 document.getElementById("cancel").style.visibility="visible";
			 }		 
		}
	 else{
		 document.getElementById("more").style.visibility="visible";
		 document.getElementById("done").style.visibility="visible";
		 document.getElementById("save").style.visibility="hidden";
		 document.getElementById("cancel").style.visibility="hidden";
	 }
	 
	 if( testid!="" && testid!=null && testid !='null' && testid!=0 && mode!='edit'){
	 $('#tblmain').find('input, textarea, button, select,checkbox').attr('disabled',true);
	 document.getElementById("more").style.visibility="visible";
	 document.getElementById("done").style.visibility="visible";
	 document.getElementById("save").style.visibility="hidden";
	 document.getElementById("cancel").style.visibility="hidden";
	 }
	
} );
$('#testtype').on('change', function() {
	  var sel= this.value ; // or $(this).val()
	  var ftype = document.getElementById('ftype');
	  var ptype=document.getElementById("ptype").value;
	  ftype.innerHTML="";
		
		if(sel=="A" && ptype=="L") {	   
		    var el = document.createElement("option");
		    el.textContent = 'Yaw Data';
		    el.value ='yaw';		    
		    ftype.appendChild(el);}
		if(sel=="A" && ptype=="S") {
			 var el = document.createElement("option");
			el.textContent = "--Select--";
			el.value = "-1";
			ftype.appendChild(el);
		    el = document.createElement("option");
		    el.textContent = 'VP Data';
		    el.value ='Vdata';
		    ftype.appendChild(el);
		    el = document.createElement("option");
		    el.textContent = 'HP Data';
		    el.value ='Hdata';
		    ftype.appendChild(el);    
		}
		if(sel=="E" && ptype=="L") {
			 var el = document.createElement("option");
			el.textContent = "--Select--";
			el.value = "-1";
			ftype.appendChild(el);
		    el = document.createElement("option");
		    el.textContent = 'Pitch Data';
		    el.value ='pitch';
		    ftype.appendChild(el);
		    el = document.createElement("option");
		    el.textContent = 'Roll Data';
		    el.value ='roll';
		    ftype.appendChild(el);    
		}
		if(sel=="CP" && ptype=="C") {
			 var el = document.createElement("option");
			el.textContent = "--Select--";
			el.value = "-1";
			ftype.appendChild(el);	  
		    el = document.createElement("option");
		    el.textContent = 'VP Data';
		    el.value ='Vdata';
		    ftype.appendChild(el);
		    el = document.createElement("option");
		    el.textContent = 'HP Data';
		    el.value ='Hdata';
		    ftype.appendChild(el);
		        
		}
		if(sel=="NCP" && ptype=="C") {
			 var el = document.createElement("option");
			el.textContent = "--Select--";
			el.value = "-1";
			ftype.appendChild(el);	  
		     el = document.createElement("option");
		    el.textContent = 'VP Data';
		    el.value ='Vdata';
		    ftype.appendChild(el);
		    el = document.createElement("option");
		    el.textContent = 'HP Data';
		    el.value ='Hdata';
		    ftype.appendChild(el);
		    ftype.appendChild(el);    
		}
		if(sel=="DCP" && ptype=="C") {
			   
		    var el = document.createElement("option");
		    el.textContent = 'CP Data';
		    el.value ='CPdata';
		    ftype.appendChild(el);}
		
	});

function fncancel(){
	//alert("redirect");
	window.location = "setup.htm?oper=test";
	 }

function AddNew(){
console.log("filetype " +document.getElementById("ftype").value);
	var freq=document.getElementById("selfreq").value;	
	document.getElementById("selfreq").value="";
	
	$("#tblData tbody").append(
		"<tr>"+
		"<td>"+freq+"</td>"+		
		"<td><img src='img/delete.jpg' class='btnDelete'/></td>"+
		"</tr>");
	$(".btnDelete").bind("click", Delete);
};
function Add(){
	$("#tblData tbody").append(
		"<tr>"+
		"<td><input type='text'/></td>"+		
		"<td><img src='img/save.jpg' class='btnSave'><img src='img/delete.jpg' class='btnDelete'/></td>"+
		"</tr>");
	
		$(".btnSave").bind("click", Save);		
		$(".btnDelete").bind("click", Delete);
}; 
function Save(){
	var par = $(this).parent().parent(); //tr
	var tdName = par.children("td:nth-child(1)");	
	var tdButtons = par.children("td:nth-child(4)");

	tdName.html(tdName.children("input[type=text]").val());	
	tdButtons.html("<img src='img/delete.jpg' class='btnDelete'/><img src='img/edit.jpg' class='btnEdit'/>");

	$(".btnEdit").bind("click", Edit);
	$(".btnDelete").bind("click", Delete);
};
function Edit(){
	var par = $(this).parent().parent(); //tr
	var tdName = par.children("td:nth-child(1)");	
	var tdButtons = par.children("td:nth-child(4)");

	tdName.html("<input type='text' id='txtName' value='"+tdName.html()+"'/>");	
	tdButtons.html("<img src='img/save.jpg' class='btnSave'/>");

	$(".btnSave").bind("click", Save);
	$(".btnEdit").bind("click", Edit);
	$(".btnDelete").bind("click", Delete);
};
function Delete(){
	var par = $(this).parent().parent(); //tr
	par.remove();
};



function tabledata()
{
	var freq;
	var lg;
	var json='{"jsonfreq":[';
	var idx=0;
	 //console.log("tabledata");
	var table = $("#tblData");
	table.find('tr').each(function (i, el) {
        var $tds = $(this).find('td'),
            freq = $tds.eq(0).text()
           
        // document.getElementById("strfreq").value='{"jsonfreq":[{"freq":100},{"freq":1000},{"freq":2000}]}';
        if(freq!="" && freq!=null && freq !='null'){
       if(idx==0){
        json=json+'{"freq":'+freq+'}';}
       else{json=json+',{"freq":'+freq+'}';}
       
       idx=1;
        }
    });
	
	if(json.length > 15)
		{
		json=json+']}';
		document.getElementById("strfreq").value=json;
		console.log(""+json);
		}
}

</script>

 
</body>
</html>

