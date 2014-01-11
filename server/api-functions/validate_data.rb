def validate( values, types )
	fail = false
	bake = []
	(0..values.length).each do |c|
	bake.push([values[c], types[c]])
	end

	bake.each do |myeval|
		case myeval.last
			when 'uuid'
				fail = true if myeval.first !~ /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
			when 'integer'
 				fail = true if myeval.first.to_i == myeval.first
			when 'password'
				fail = true if myeval.first !~ /^[0-9a-f]{128}$/
		end
	end
return fail
end
