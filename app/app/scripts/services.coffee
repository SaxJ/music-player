'use strict'

### Sevices ###

angular.module('app.services', [])

.factory 'version', -> "0.1"

.factory 'soundcloud', [
  '$rootScope'

  ($rootScope) ->
    soundcloud = {}
    $rootScope.activeQueue = []

    soundcloud.login = (callback) ->
      SC.connect ->
        $rootScope.$apply ->
          $rootScope.soundCloud_authenticated = true
          if callback?
            callback()
        SC.get '/me', (me) ->
          $rootScope.$apply ->
            $rootScope.soundcloud_user = me
          SC.get '/me/playlists', (pls) ->
            $rootScope.$apply ->
              $rootScope

    soundcloud.getMe = (callback) ->
      SC.get '/me', callback

    soundcloud.getPlaylists = (id, callback) ->
      SC.get "/users/#{id}/playlists", callback
]
