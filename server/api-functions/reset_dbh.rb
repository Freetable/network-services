def reset_dbh(dbh)
	while dbh.next_result
  	dbh.store_result rescue ''
    end
  end
