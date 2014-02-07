'use strict'

angular.module('whoruApp', ['ngRoute','ngSanitize','ngTouch'])
  .config(['$compileProvider', ($compileProvider) ->
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel|skype):/)
  ])
