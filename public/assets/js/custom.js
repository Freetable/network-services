// Freetable custom.js

function verify_user( uid, sid, callback ){ 
    $.ajax({
      type: "POST",
      url: "./api/verify_user",
      dataType: "json",
      data: 'wwuserid='+ uid + '&sessionid=' + sid,
      success: callback
		});

}

function login ( nickname, password, callback ){
    $.ajax({  
      type: "POST",  
      url: "./api/login", 
      dataType: "json",
      data: 'nickname='+ nickname + '&password=' + password,  
			success: callback
		});
}
