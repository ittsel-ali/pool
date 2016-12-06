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
	def get_games(transaction)
		games = []
		games << {"count" => 0}
		games << {"count" => 0}
		games << {"time" => 0,"count" => 0}
		transaction.plays.each do |play|
			if play.game.game_type == 0
				games[0]["count"] +=  1
			elsif play.game.game_type == 1
				games[1]["count"] += 1
			elsif play.game.game_type == 2
				games[2]["time"] += play.quantity_or_duration.to_i
			end
		end
		games
	end
	def get_bill(transaction)
		bill = 0
		if transaction.plays.any?
			transaction.plays.each do |play|
				if play.game.game_type == 0 || play.game.game_type == 1
					bill = bill + (play.game.price.to_i)
				elsif play.game.game_type == 2
					bill = bill + (play.quantity_or_duration.to_i * play.game.price.to_i)
				end
			end
		end
		if transaction.edibles.any?
			transaction.edibles.each do |edible|
				bill = bill + (edible.price.to_i)
			end
		end
		bill
	end
end