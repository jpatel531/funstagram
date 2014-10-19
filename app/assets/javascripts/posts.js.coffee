$(document).ready ->
    $.get '../tags.json', (tags) ->
        $('.bootstrap-tagsinput input').typeahead {source: tags}

angular.module('Funstagram', []).controller 'PresenceCtrl', ['$http', '$scope', ($http, $scope) ->

    $scope.testing = 'hello'

    pusher = new Pusher 'f38be82a5e0d1eba525b'
    presenceChannel = pusher.subscribe 'presence-users'

    presenceChannel.bind 'pusher:subscription_succeeded', (members) ->
        $scope.$apply -> 
            $scope.members = members
            $scope.members.count = members.count

    presenceChannel.bind 'pusher:member_added', (member) ->
        $scope.$apply -> $scope.members.count = $scope.members.count

    presenceChannel.bind 'pusher:member_removed', (member) ->
        $scope.$apply -> $scope.members.count = $scope.members.count

]