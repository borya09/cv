
'use strict'
do (angular = angular) ->

  angular.module('whoruApp')
    .directive('whSliderSelector', ->
      {
        restrict: 'C',
        replace: false
        scope:{
          item:'='
        },
        controller: ['$scope', ($scope) ->
          item = $scope.item
          images = item.images
          currentPos = 0

          item.morePrev = false
          item.moreNext = true

          setCurrent = ->
            currentItem = images[currentPos]
            currentItem.current = true if currentItem

          removeCurrent = ->
            currentItem = images[currentPos]
            currentItem.current = false if currentItem


          setIfMore = ->
            item.morePrev = currentPos > 0
            item.moreNext = currentPos < (images.length - 1)


          item.previous = ->
            do removeCurrent
            currentPos-- if currentPos > 0
            do setIfMore
            do setCurrent

          item.next = ->
            do removeCurrent
            currentPos++ if currentPos < (images.length - 1)
            do setIfMore
            do setCurrent

          do setCurrent
          do setIfMore
        ]
        template: '''
          <button class="previous" ng-class="item.morePrev? 'more' : 'no-more' " ng-click="item.previous()">
            <span>‹</span>
          </button>
          <button class="next" ng-class="item.moreNext? 'more' : 'no-more' " ng-click="item.next()">
            <span>›</span>
          </button>
        '''
      }
    )
