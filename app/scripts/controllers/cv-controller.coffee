'use strict'

# **Controller _'CvCtrl'_**
angular.module('whoruApp')

  .controller 'CvCtrl', ['$scope', '$rootScope', 'CvService', ($scope, $rootScope, cvService) ->

    # Retrieves and publish in the $scope the cv
    get = ->
      cvService.get()
        .then (cv) ->
          $scope.cv = cv

    # Listens to 'locale_changed' event
    $scope.$on 'locale_changed', ->
      do get

    # Fires initialization (get)
    do get

    return
  ]
