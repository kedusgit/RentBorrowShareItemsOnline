
var contextRoot = "/" + window.location.pathname.split( '/' )[1];

function receivingProductSubmit(productId){
   	var token = $("meta[name='_csrf']").attr("content");
   	var header = $("meta[name='_csrf_header']").attr("content");
   	var dataToSend = JSON.stringify(serializeObject($('#productReceivingForm')));
   	alert(dataToSend);
   	
   	 $.ajax({
		type: 'POST',
		url: contextRoot + '/rest/receivings/receivingProducts/add/' + productId.value,
		dataType: "json",           		// Accepts
 		data:dataToSend,
 		contentType: 'application/json',   	// Sends
 		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		timeout : 600,
		success: function(){
			$('#errors').html("");
 			$("#result").append( '<H3 align="center"> OKAY!! <H3>');                
	 	    $('#result').show();
		},
		error: function(errorObject ){	
			alert(errorObject);
		}
//			if (errorObject.responseJSON.errorType == "ValidationError") {
//	 			$('#success').html("");
//	 			$('#errors').html("");
//	 			$("#errors").append( '<H3 align="center"> Error(s)!! <H3>');                
//	  			    $("#result").append( '<p>');
//	  	
//	  			    var errorList = errorObject.responseJSON.errors;
//	 	 	        $.each(errorList,  function(i,error) {			   
//	 		    		$("#errors").append( error.message + '<br>');
//			    	});
//	 	 	        $("#errors").append( '</p>');
//	 	 	        $('#result').show();
//			}
//			else {
//				alert(errorObject.responseJSON.errors(0));   // "non" Validation Error
//			}
// 		}
	});
}