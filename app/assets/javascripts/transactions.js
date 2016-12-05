function remove_fields(link, list, name) {
  $(link).parent("li."+list).remove()
  $("a#"+name).children().html($("input[for="+name+"]").length)
}

function add_fields(name, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $("a#"+name).parent().append(content.replace(regexp, new_id))
  $("a#"+name).children().html($("input[for="+name+"]").length)
}

$(document).ready(function(){
	$('#new_customer').bind('ajax:beforeSend', function(event, id){
		event.preventDefault()
		
		if ($('#transaction_customer_id').val()){
			return false
		}
	})

	$('#new_customer').bind('ajax:success', function(event, id){
		$('#transaction_customer_id').val(JSON.parse(id))
	})
});