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

controllers = angular.module('controllers', [])
controllers.controller("HomeController", ['$scope', '$location', 'myJquery', '$interval',
  ($scope, $location, myJquery, $interval) -> 
    $scope.scrollTo = (id) ->
      myJquery.scrollTo(id)
    
    carousels = myJquery.startCarousels()
    
    $scope.$on('$destroy', () ->
      if angular.isDefined(carousels)
        $interval.cancel(carousels)
    )

])

controllers.controller("InfoController", ['$scope', 
  ($scope) ->

])

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
        indent = ($(this).children("li").outerWidth() + 12)*-1
        $(this).animate({'left': indent}, time, () ->
          $(this).children("li:last").after($(this).children("li:first"))
          $(this).css('left': '0')
        )
      )
    int = $interval(start, 5000)
)
