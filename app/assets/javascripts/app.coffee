app = angular.module('app', [
  'templates',
  'ngRoute',
  'controllers'
])

app.config(['$routeProvider', '$locationProvider',
  ($routeProvider, $locationProvider) -> 
    $routeProvider
      .when('/',
        templateUrl: 'index.html'
        controller: 'HomeController'
        redirectTo: (current, path, search) ->
          if search.goto 
            '/' + search.goto
          else
            '/'
      )
      .when('/site-info',
        templateUrl: 'site-info.html'
        controller: 'InfoController'
      )
      .otherwise(
        redirectTo: '/'
      )
    $locationProvider.html5Mode(true)
])
