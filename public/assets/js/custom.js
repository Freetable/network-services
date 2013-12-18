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
      url: "./api/recover_password", 
      dataType: "json",
      data: 'nick_or_email=' + nick_or_email,  
      success: callback
    });
}

function reset_pass ( uid, password, sid, callback ){
    $.ajax({
      type: "POST",
      url: "./api/set_password",
      dataType: "json",
      data: 'wwuserid=' + uid + '&password=' + password + '&sessionid=' + sid,
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
  window.location.assign("forgot");
  return false;
  });

$("#recoverpassword").click(function() {
  //window.location.replace("forgot");
	forgot_pass ( $('#nickname').val(), function () { 
	window.location.replace("forgotsent");
	});
  return false;
  });

$("#resetpassword").click(function() {
  // This needs to also check for case, numbers, and special characters
	var pwd1 = $('#passworda').val();
  var pwd2 = $('#passwordb').val();
  if( pwd1.length < 8 ) {
  	if( pwd1 == pwd2 ) {
  		reset_pass ( QueryString.uid, CryptoJS.SHA512(pwd1), QueryString.sid, function () { window.location.replace("passwordset"); });
  	}else{
  		$("#error_message").text("Passwords don't match");
  	}
	}else{
  	$("#error_message").text("Password isn't long enough");
  }
  return false;
  });
});
 

// Helpers

var QueryString = function () {
  // This function is anonymous, is executed immediately and 
  // the return value is assigned to QueryString!
  var query_string = {};
  var query = window.location.search.substring(1);
  var vars = query.split("&");
  for (var i=0;i<vars.length;i++) {
    var pair = vars[i].split("=");
    	// If first entry with this name
    if (typeof query_string[pair[0]] === "undefined") {
      query_string[pair[0]] = pair[1];
    	// If second entry with this name
    } else if (typeof query_string[pair[0]] === "string") {
      var arr = [ query_string[pair[0]], pair[1] ];
      query_string[pair[0]] = arr;
    	// If third or later entry with this name
    } else {
      query_string[pair[0]].push(pair[1]);
    }
  } 
    return query_string;
} ();


