app = angular.module('app', [
  'templates',
  'ngTouch',
  'ngRoute',
  'controllers'
])

app.config(['$routeProvider', '$locationProvider',
  ($routeProvider, $locationProvider) ->
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
    $routeProvider
      .when('/',
        templateUrl: if !isMobile.any() then 'web/index.html' else 'mobile/index.html'
        controller: if !isMobile.any() then 'WebHomeCtrl' else 'MobileHomeCtrl'
        redirectTo: (current, path, search) ->
          if search.goto 
            '/' + search.goto
          else
            '/'
      )
      .when('/site-info',
        templateUrl: if !isMobile.any() then 'web/site-info.html' else 'mobile/site-info.html'
        controller: if !isMobile.any() then 'WebInfoCtrl' else 'MobileInfoCtrl'
      )
      .otherwise(
        redirectTo: '/'
      )
    $locationProvider.html5Mode(true)
    return
])
