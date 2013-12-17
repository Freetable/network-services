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

// Startup stuff for various pages

$(function() {  
// Main signin button
	$("#signin").click(function() {  
    login( $('#nickname').val(), CryptoJS.SHA512($('#password').val()), function( data ) {  
    data = data.shift();
    if( typeof data['WWUSERID'] != 'undefined') {
      $.cookie('WWUSERID', data['WWUSERID'], { expires: 30 });
      $.cookie('sessionid', data['sessionid'], { expires: 30 });
      window.location.("main");
    }else{
    $('<div class="alert alert-danger">Invalid Login <button class="close" data-dismiss="alert" aria-hidden="true" type="button">&times;</a></div>').prependTo("#body");
    }
        
    });  
    return false;
	});  




});  

