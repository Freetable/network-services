def query_db( *args )
	sp = args.shift
	values = args.shift
	results = ''

	@@dbh_pool.with do |dbh|

		unless values.nil?
			values.each { |value| results += "'#{dbh.escape(value)}', " }
			2.times { results[results.length-1] = '' }
		end
		
		#logger.info("CALL #{sp}(#{results})")
		
		results = dbh.query("CALL #{sp}(#{results})").to_a

reset_dbh(dbh)
end

return results
end

