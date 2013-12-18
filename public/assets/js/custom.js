// Freetable custom.js

function login_verify_user(){
      real_verify_user( $.cookie('WWUSERID'), $.cookie('sessionid'), function (data) {
      data = data.shift();
      console.log(data);
      if( typeof data['1'] != 'undefined' ) { window.location.replace("/main"); }
    });
}

function verify_user(){
      real_verify_user( $.cookie('WWUSERID'), $.cookie('sessionid'), function (data) {
      data = data.shift();
      console.log(data);
      if( typeof data['1'] == 'undefined' ) { window.location.replace("/"); }
    }); 
}

function real_verify_user( uid, sid, callback ){ 
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

function forgot_pass ( nick_or_email, callback ){
    $.ajax({  
      type: "POST",  
      url: "./api/forgot_password", 
      dataType: "json",
      data: 'nick_or_email=' + nick_or_email,  
      success: callback
    });
}

// Startup stuff for various pages

$(function() {  
// Main signin button
	$("#signin").click(function() {  
    login( $('#nickname').val(), CryptoJS.SHA512($('#password').val()), function( data ) {  
    data = data.shift();
    if( typeof data['WWUSERID'] != 'undefined') {
      $.cookie('WWUSERID', data['WWUSERID'], { expires: 30 });
      $.cookie('sessionid', data['sessionid'], { expires: 30 });
      window.location.replace("main");
    }else{ $('#error_message').text('Sign In Error'); }
        
    });  
    return false;
	});  

$("#signup").click(function() {
	window.location.assign("signup");
  return false;
	});

$("#forgot").click(function() {
  forgot_pass( $('#nickname').val(), function( data ) {  
    data = data.shift();
    if (typeof data[''] != 'undefined') {
      $.cookie('WWUSERID', data['WWUSERID'], { expires: 30 });
      $.cookie('sessionid', data['sessionid'], { expires: 30 });
      window.location.replace("forgotsent");
    }else{ $('#error_message').text('Sign In Error'); }

  return false;
  });
});  

