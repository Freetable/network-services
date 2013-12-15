def query_db( *args )
sp = args.shift
values = args.shift
results = ''

@@dbh_pool.with do |dbh|

values.each { |value| results += "'#{dbh.escape(arg)}', " }

2.times { results[results.length-1] = '' }

results = dbh.query("CALL #{sp}(#{results})").to_a

reset_dbh(dbh)
end

return results
end

