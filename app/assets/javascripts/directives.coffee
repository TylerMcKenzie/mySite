app = angular.module('app')
.directive('mobileMenu', () ->
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

.directive('boxAnim' , () ->
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

.directive('spirAnim', () ->
  restrict: 'A',
  link: (scope, elm, attr) ->
    spirals = elm.find('path')

        
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
      posNeg = () -> 
        random = Math.random()*(2-(0))+(0)
        if random <= 1 
          -1 
        else 
          1
      dir = posNeg()
      randTime = Math.random()*(6-(2))+(2)
      randTop = Math.random()*(600-(0))+(0)
      TweenMax.fromTo(object, randTime, { 
        x: 1500*dir, 
        y: randTop*dir,
        ease: Power0.easeOut
         }, {
        x: -1500*dir,
        onComplete: rerunTl2, 
        onCompleteParams: [object],
        repeatDelay: randTime-2,
        ease: Power0.easeOut
          })
    i = 0
    while i < spirals.length
      rerunTl2(spirals[i])
      i++
)

.directive('landscapeAnim', () -> 
  restrict: 'A',
  link: (scope, elm, attr) ->

    # Ground Animation
    gGroup = elm.find("g#ground")
    ground = elm.find('#layer5')

    groundC = ground.clone()
    groundC.appendTo(gGroup)
    groundW = ground[0].getBoundingClientRect().width

    groundTl = new TimelineMax(repeat: -1)
    groundTl.set(groundC, { x: groundW-1 })
    groundTl.to(gGroup, 10, { x: -groundW, ease: Power0.easeOut})

    # Clouds Animation(s)

    # First Group
    cloudsG1 = elm.find('#cloud_g_1a')
    cloudG1 = elm.find('#layer3')
    cloudG1Of = cloudG1[0].getBoundingClientRect().width
    cloudG1c = cloudG1.clone()
    cloudG1c.appendTo(cloudsG1)


    cloudTl1 = new TimelineMax(repeat: -1)
    cloudTl1.set(cloudG1c, { x: cloudG1Of })
    cloudTl1.to(cloudsG1, 120, { x: -cloudG1Of, ease: Power0.easeOut })
    
    # Second Group

    cloudsG2 = elm.find('#cloud_g_2a')
    cloudG2 = elm.find('#layer4')
    cloudG2Of = cloudG2[0].getBoundingClientRect().width
    cloudG2c = cloudG2.clone()
    cloudG2c2 = cloudG2.clone()
    cloudG2c.appendTo(cloudsG2)
    cloudG2c.prependTo(cloudsG2)


    cloudTl2 = new TimelineMax(repeat: -1)
    cloudTl2.set(cloudG2c, { x: cloudG2Of })
    cloudTl2.set(cloudG2c2, { x: -cloudG2Of })
    cloudTl2.to(cloudsG2, 80, { x: -cloudG2Of, ease: Power0.easeOut })
)