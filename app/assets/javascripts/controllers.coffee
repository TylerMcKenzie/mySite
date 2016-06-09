controllers = angular.module('controllers', [])

# Web ----

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

controllers.controller("WebInfoCtrl", ['$scope', 
  ($scope) ->

])

# Mobile ----

controllers.controller("MobileHomeCtrl", ['$scope', 'myJquery', 
  ($scope, myJquery) ->
    $scope.openHMenu = () ->
      myJquery.openNav()

])

controllers.controller("MobileInfoCtrl", ['$scope', 'myJquery',
  ($scope, myJquery) ->

])