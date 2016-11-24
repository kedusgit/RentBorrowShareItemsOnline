
var contextRoot = "/" + window.location.pathname.split( '/' )[1];
function storeSubmit(){
   	var token = $("meta[name='_csrf']").attr("content");
   	var header = $("meta[name='_csrf_header']").attr("content");
   	var dataToSend = JSON.stringify(serializeObject($('#storeForm')));

   	 $.ajax({
		type: 'POST',
		url: contextRoot + '/stores/save',
		dataType: "json",           		// Accepts
 		data:dataToSend,
 		contentType: 'application/json',   	// Sends
 		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		timeout : 600,
		success: function(){
			$('#errors').html("");
			$('#errors').html("");
 			$("#success").append( '<H3 align="center"> OKAY!! <H3>');                
	 	    $('#result').show();
		},
		error: function(jqXHR,  textStatus,  exception ){
			console.log(jqXHR);
			if (jqXHR.responseJSON.errorType == "ValidationError") {
	 			$('#success').html("");
	 			$('#errors').html("");
	 			$("#errors").append( '<H3 align="center"> Error(s)!! <H3>');                
	  			    $("#result").append( '<p>');
	  	
	  			    var errorList = errorObject.responseJSON.errors;
	 	 	        $.each(errorList,  function(i,error) {			   
	 		    		$("#errors").append( error.message + '<br>');
			    	});
	 	 	        $("#errors").append( '</p>');
	 	 	        $('#result').show();
			}
			else {
				alert(jqXHR.responseJSON.errors(0));   // "non" Validation Error
			}
 		}
	});
}