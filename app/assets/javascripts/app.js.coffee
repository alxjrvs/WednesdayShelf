app = angular.module 'WednesdayShelf', ['ngRoute', 'ngAnimate'], ($routeProvider, $locationProvider) ->

  TEMPLATES = {
    "generateUser" : "/assets/generate_user_template.html",
    "createAccount" : "/assets/create_account_template.html",
    "signIn" : "/assets/sign_in_template.html",
  }
  $routeProvider.when('/Newcomer', {
        templateUrl: TEMPLATES.generateUser
  }).
  when('/Sign_in', {
        templateUrl: TEMPLATES.signIn
  }).
  when('/Create_Account', {
    templateUrl: TEMPLATES.createAccount
  }).
  otherwise({
    redirectTo: '/Newcomer'
  })

app.controller "SidebarCtrl", ($scope) ->

