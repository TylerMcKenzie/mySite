controllers = angular.module('controllers', [])

controllers.controller("HomeController", ['$scope', '$location', 'myJquery', '$interval',
  ($scope, $location, myJquery, $interval) -> 
    $scope.scrollTo = (id) ->
      myJquery.scrollTo(id)


    myJquery.checkMobile()
    carousels = myJquery.startCarousels()
    carouselHover = myJquery.carouselHoverText()
    $scope.$on('$destroy', () ->
      if angular.isDefined(carousels)
        $interval.cancel(carousels)
    )

])

controllers.controller("InfoController", ['$scope', 
  ($scope) ->

])