Template.settings.events
  'click .logout': (e,t) ->
    Meteor.logout()
  'click .exitSettings': (e,t) ->
    Router.go 'leaderboard'