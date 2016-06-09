app = angular.module('app')
app.directive('mobileMenu', () ->
  restrict: 'A',
  link: (scope, elm, atr) ->
  	btn = elm.siblings('button')
  	btn.on('click', (e) ->
  	  navHeight = elm.parent().outerHeight()
  	  elm.toggleClass('open')
  	  if elm.hasClass('open')
  	  	elm.stop().animate({top: navHeight})
  	  else
  	    elm.stop().animate({top: -navHeight})
  	)
  )