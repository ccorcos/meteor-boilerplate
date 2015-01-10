Template.settings.events
  'click .logout': (e,t) ->
    Meteor.logout()
  'click .exitSettings': (e,t) ->
    console.log "here"
    Router.go 'leaderboard'