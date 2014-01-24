
'use strict'


# TODO: TEST
do (angular = angular, $ = $) ->

  angular.module('whoruApp')
    .directive 'heightAsWindow', ($window) ->
      restrict: 'A'
      link: (scope, elem, attrs) ->

        $$window = $ $window
        $header = $ '.header-container'

        includeHeader = attrs['heightAsWindow'] is 'header'

        setHeight = ->
          height = $$window.height()

          if includeHeader
            height -= ($header.height() - 10)

          elem.css('min-height', height)

        $$window.resize ->
          do setHeight

        do setHeight

