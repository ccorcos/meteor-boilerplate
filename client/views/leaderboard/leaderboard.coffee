Session.setDefault 'selected', null

Template.leaderboard.helpers
  users: () -> Meteor.users.find {}, {sort: {score: -1, username: 1}}
  selected: -> Session.get 'selected'

Template.leaderboard.events
  'click .add5': (e,t) ->
    Meteor.call 'add5', Session.get 'selected'
  'click .logout': (e,t) ->
    Meteor.logout()

Template.user.helpers
  isSelected: () -> 
    if Session.equals 'selected', @_id
      return 'selected' 
    else
      return ''

Template.user.events
  'click .user': (e,t) ->
    Session.set 'selected', @_id