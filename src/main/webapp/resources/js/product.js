// AJAX call for autocomplete 
$(function(){
   	var token = $("meta[name='_csrf']").attr("content");
   	var header = $("meta[name='_csrf_header']").attr("content");
   	
	$("#name").keyup(function(){
		$.ajax({
	   		url: contextRoot + '/rest/products/search',
	 		type:      'GET',
			datatype:  "json",
			data:      'nameLike=' + $(this).val(),
	 		beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
		success: function(productList){
			$("#suggesstion-box").show();
			 displayProducts(productList);
//			$("#suggesstion-box").html(productList);
			$("#name").css("background","#FFF");
		}
		});
	});
});
	   
function displayProducts(productList) {
  $('#suggesstion-box').html("");
  jQuery.each(productList, function(i, product) {
   $("#suggesstion-box").append( '<a> ' + product.name + '</a><br>');
  });
}

//To select country name
function selectCountry(val) {
	$("#name").val(val);
	$("#suggesstion-box").hide();
}