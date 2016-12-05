module TransactionsHelper
	def link_to_remove_field(name, list)
		link_to("#", class: "btn btn-danger btn-circle btn-xs pull-right", onclick: "remove_fields(this, '#{list}', '#{name}')") do 
			content_tag(:i, nil, class: "fa fa-fw fa-wrench faa-wrench animated").html_safe
		end
	end
	def link_to_add_fields(name, f, association, id)
		new_object = f.object.plays.build
		fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |obj|
			render(association.to_s.singularize+"_fields", f: obj, name: name, id: id, assoc: association)
		end
		link_to("#", id: name, onclick: "add_fields('#{name}','#{association}','#{escape_javascript(fields)}')", class: "btn btn-info btn-block") do 
			(name + " " +content_tag(:span, 0, class: 'badge')).html_safe
		end
	end
end