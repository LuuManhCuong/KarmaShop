/**
 * 
 */
console.log("xin chàooo")

function myFunction(e) {
	var radioElements = document.querySelectorAll('input[name="gender"]');
	var selectedValue = '';
	radioElements.forEach(function(radioElement) {
		if (radioElement.checked) {
			selectedValue = radioElement.value;
		}
	});
	console.log(selectedValue);

}