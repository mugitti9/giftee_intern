// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// railsujsはrails5.1.0以降デフォで入っている。入れないこと！！！
//= require jquery
//= require activestorage
//= require uikit_js/uikit.min.js
//= require uikit_js/uikit-icons.min.js
//= require_tree .
//= require quill.global

$(function(){
	$('#notif-textarea').keyup(function(){
		var len = $(this).val().length;
		$("#notif-charcount").text(140 - len)
	});
});


