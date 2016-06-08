controllers = angular.module('controllers', [])

controllers.controller("WebHomeCtrl", ['$scope', '$location', 'myJquery', '$interval',
  ($scope, $location, myJquery, $interval) -> 
    $scope.scrollTo = (id) ->
      myJquery.scrollTo(id)


    carousels = myJquery.startCarousels()
    carouselHover = myJquery.carouselHoverText()
    $scope.$on('$destroy', () ->
      if angular.isDefined(carousels)
        $interval.cancel(carousels)
    )

])

controllers.controller("MobileHomeCtrl", ['$scope', 
  ($scope) ->

])

controllers.controller("WebInfoCtrl", ['$scope', 
  ($scope) ->

])

controllers.controller("MobileInfoCtrl", ['$scope', 
  ($scope) ->

])