app = angular.module('app')
app.factory('myJquery', ($interval) -> 
  scrollTo: (elemID) ->
    elemPos = $("#"+ elemID).offset().top
    if self.pageYOffset != elemPos
      $('body').animate(
        scrollTop: elemPos
      1000)
      false
  startCarousels: () ->
    start = () ->
      $(".carousel_inner ul").each(() ->
        time = Math.random() * (2000 - 500) + 500
        indent = ($(this).children("li").outerWidth() + 5)*-1
        $(this).animate({'left': indent}, time, () ->
          $(this).children("li:last").after($(this).children("li:first"))
          $(this).css('left': '0')
        )
      )
    int = $interval(start, 5000)
  carouselHoverText: () ->
    $(".hover-t").mouseenter( 
      () ->
        div = $(this).siblings(".hover-text")
        $(div).fadeIn(300)
      )
    $(".hover-text").mouseleave(
      () ->
        $(this).stop().fadeOut(300)
        )
  checkMobile: () ->
    isMobile = 
      Android: ->
        navigator.userAgent.match /Android/i
      BlackBerry: ->
        navigator.userAgent.match /BlackBerry/i
      iOS: ->
        navigator.userAgent.match /iPhone|iPad|iPod/i
      Opera: ->
        navigator.userAgent.match /Opera Mini/i
      Windows: ->
        navigator.userAgent.match(/IEMobile/i) or navigator.userAgent.match(/WPDesktop/i)
      any: ->
        isMobile.Android() or isMobile.BlackBerry() or isMobile.iOS() or isMobile.Opera() or isMobile.Windows()
    console.log(isMobile.any())
)
