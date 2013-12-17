WednesdayShelf = angular.module('WednesdayShelf', ['ngAnimate', 'ngRoute'])


WednesdayShelf.controller "WSController", ($scope) ->

  $scope.signIn= ->
    $scope.isNonUserPathVisible = false
    $scope.isSignInVisible = true

  $scope.createAccount= ->
    $scope.isNonUserPathVisible = false
    $scope.isCreateAccountVisible = true

  $scope.resetToDefaults = ->
    $scope.isNonUserPathVisible = true
    $scope.isSignInvisible = false
    $scope.isCreateAccountVisible = false

  $scope.isNonUserPathVisible = true
  $scope.isSignInvisible = false
  $scope.isCreateAccountVisible = false




