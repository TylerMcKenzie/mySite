app = angular.module('app')
app.directive('mobileMenu', () ->
  restrict: 'A',
  link: (scope, elm, atr) ->
  	btn = elm.siblings('button')
  	btn.on('click', (e) ->
  	  navHeight = elm.parent().outerHeight()
  	  elmHeight = elm.outerHeight()
  	  elm.toggleClass('open')
  	  if elm.hasClass('open') then elm.stop().animate({height: 'toggle'}) else elm.stop().animate({height: 'toggle'})
  	)
  	elm.on('click', (e) ->
  	  console.log(e.target)
  	)
  )