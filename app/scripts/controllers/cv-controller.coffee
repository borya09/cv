'use strict'

# **Controller _'CvCtrl'_**
angular.module('whoruApp')

  .controller 'CvCtrl', ['$scope', '$rootScope', 'CvService', ($scope, $rootScope, cvService) ->

    navInfoOptions = {}

    # Retrieves and publish in the $scope the cv; and in the $rootScope, info for the header navbar
    get = ->
      cvService.get()
        .then (cv) ->
          $scope.cv = cv

          # Iterates over the parts in the cv to build the header navbar with each part
          for part in cv

            navInfoOpt = navInfoOptions[part.id]

            # Locale change, update the title
            # TODO: Test!
            if navInfoOpt
              navInfoOpt.title = part.title

            # Build the option for the header navbar
            else
              navInfoOpt =
                order : 2
                title : part.title
                href : '#' + part.id
              navInfoOptions[part.id] = navInfoOpt
              $rootScope.nav.push navInfoOpt


    # Listens to 'locale_changed' event
    $scope.$on 'locale_changed', ->
      do get

    # Fires initialization (get)
    do get

    return
  ]
