resetForm = function(id) {
	var element = document.getElementById(id);
	$(element)[0].reset();

}

make_hidden = function(id) {
	var e = document.getElementById(id);
	e.style.display = 'none';
}

make_visible = function(id) {
	var e = document.getElementById(id);
	e.style.display = 'block';
}

// Translate form to array
// Then put in JSON format
function serializeObject(form) {
	var jsonObject = {};
	var array = form.serializeArray();
	$.each(array, function() {
		jsonObject[this.name] = this.value;
	});
	return jsonObject;

};

