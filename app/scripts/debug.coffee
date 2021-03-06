window.angularGet = (name) -> angular.element(document).injector().get(name)

angular.module('debug', ['ansible', 'daemon.gamepad'])

.controller('DebugInfoCtrl', [
  '$scope'
  'ansible'
  'gamepadReporter'
  ($scope, ansible, gamepadReporter) ->
    $scope.debugProperties = [
        name: 'Platform'
        value: process.platform
      ,
        name: 'Architecture'
        value: process.arch
      ]

    $scope.lastMessage = 'None'
    ansible.on('message', (msg) ->
      console.log('ansible received messages')
      $scope.lastMessage = msg
      $scope.$apply()
    )
])
