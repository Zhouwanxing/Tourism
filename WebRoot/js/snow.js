// JavaScript Document
var minSize = 5;
var maxSize = 50;
var newOne = 100;
var color = "#fff";
var flake = $("<div></div>").css({"position":"absolute","top":"-50px"}).html("*");
$(function(){
	var h=$(document).height();
	var w=$(document).width();
	setInterval(function(){
		var left = Math.random()*w;
		var opacity = 0.7+Math.random();
		var endtop = h;
		var endleft = Math.random()*w;
		var fall = 4000+Math.random()*3000;
		var size = minSize+Math.random()*maxSize;
		flake.clone().appendTo("body").css({
			"left" : left,
			"opacity" : opacity,
			"font-size" : size,
			"color" : color
		}).animate({
			"top" : endtop,
			"left" : endleft,
			"opacity" : 0.5
		},fall,function(){$(this).remove();});
	},newOne);
});
