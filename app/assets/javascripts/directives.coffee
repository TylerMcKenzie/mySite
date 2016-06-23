app = angular.module('app')
app.directive('mobileMenu', () ->
  restrict: 'A',
  link: (scope, elm, attr) ->
  	btn = elm.siblings('button')
  	btn.on('click', (e) ->
  	  navHeight = elm.parent().outerHeight()
  	  elmHeight = elm.outerHeight()
  	  elm.toggleClass('open')
  	  if elm.hasClass('open') then elm.stop().animate({height: 'toggle'}) else elm.stop().animate({height: 'toggle'})
  	)
  	elm.on('click', (e) ->
  	  if elm.hasClass('open') then elm.stop().animate({height: 'toggle'}) else elm.stop().animate({height: 'toggle'})
  	)
  )

app.directive('boxAnim' , () ->
  restrict: 'A',
  link: (scope, elm, attr) ->
    image = elm.find('#layer1')
    path0 = elm.find('#g5272')
    path1 = elm.find('#path5282')
    path2 = elm.find('#path5274')
    path3 = elm.find('#path5284')
    path4 = elm.find('#path5276')
    path5 = elm.find('#path5280')

    tl1 = new TimelineMax(
      repeat: -1,
      yoyo: true)
    tl1
    .from(path0, 1, { x: -1000, ease: Power2.easeOut }, '-=1')
    .from(path1, 1, { y: 1000, ease: Power2.easeOut }, '-=1')
    .from(path2, 1, { x: -1000, ease: Power2.easeOut }, '-=1')
    .from(path3, 1, { x: 2000, ease: Power2.easeOut }, '-=1')
    .from(path4, 1, { y: -1000, ease: Power2.easeOut }, '-=1')
    .from(path5, 1, { x: 3000, ease: Power2.easeOut }, '-=1')
    .to(image, 0.5, { rotation: -180, transformOrigin: '50% 50%', ease: Power0.easeIn })
    return
)

app.directive('spirAnim', () ->
  restrict: 'A',
  link: (scope, elm, attr) ->
    spirals = elm.find('path')

    posNeg = () -> 
      random = Math.random()*(2-(0))+(0)
      if random <= 1 
        -1 
      else 
        1
        
    tl1 = new TimelineMax(repeat: -1)
    rerunTl1 = (object) ->
      i = 0
      while i < object.length

        randTime = Math.floor(Math.random()*(3-(2))+(2))
        tl1.from(object[i], randTime, { 
          rotation: 360, 
          onComplete: rerunTl1,
          onCompleteParams: [object[i]],
          transformOrigin: "50% 50%", 
          ease: Power0.easeOut 
          }, '-='+randTime)
        i++
    rerunTl1(spirals)

    rerunTl2 = (object) ->
      i = 0
      while i < object.length

        dir = posNeg()
        randTime = Math.random()*(4-(2))+(2)
        randTop = Math.random()*(300-(0))+(0)
        TweenMax.fromTo(object[i], randTime, { 
          x: 1500*dir, 
          y: randTop,
          ease: Power0.easeOut
           }, {
          x: -1500*dir,
          onComplete: rerunTl2, 
          onCompleteParams: [object[i]],
          repeatDelay: randTime-2,
          ease: Power0.easeOut,
          repeat: -1
            }, '-=4')
        i++
    rerunTl2(spirals)


)