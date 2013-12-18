app = angular.module 'WednesdayShelf', []

app.controller "SidebarCtrl", ($scope) ->

  TEMPLATES = {
    "generateUser" : "/assets/generate_user_template.html",
    "createAccount" : "/assets/create_account_template.html",
    "signIn" : "/assets/sign_in_template.html",
  }
  $scope.templateUrl= TEMPLATES.generateUser

  $scope.showSignIn = ->
    $scope.templateUrl = TEMPLATES.signIn

  $scope.showCreateAccount = ->
    $scope.templateUrl = TEMPLATES.createAccount

  $scope.showGenerateUser = ->
    $scope.templateUrl = TEMPLATES.generateUser


