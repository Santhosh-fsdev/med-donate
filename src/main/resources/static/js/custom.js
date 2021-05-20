$.validator.addMethod("pswcheck", function(value) {
   return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/.test(value)
});

$.validator.addMethod("phoneIND", function(value) {
	   return /^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}$/.test(value)  
	});

