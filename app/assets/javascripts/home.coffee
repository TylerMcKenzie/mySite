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
        controller: 'GameController'
      )
      .otherwise(
        redirectTo: (current, path, search) ->
          '/' + search.goto if search.goto
          '/'
      )
    $locationProvider.html5Mode(true)
])

controllers = angular.module('controllers', [])
controllers.controller("HomeController", ['$scope', 
  ($scope) ->
    
])