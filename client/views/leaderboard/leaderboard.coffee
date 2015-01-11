Session.setDefault 'selected', null

Template.leaderboard.helpers
  users: () -> Meteor.users.find {}, {sort: {score: -1, username: 1}}
  selected: -> Session.get 'selected'

Template.leaderboard.events
  'click .add5': (e,t) ->
    Meteor.call 'add5', Session.get 'selected'
  'click .logout': (e,t) ->
    Meteor.logout()
  'click .toSettings': (e,t) ->
    Router.go 'settings'

Template.user.helpers
  isSelected: () -> 
    if Session.equals 'selected', @_id
      return 'selected' 
    else
      return ''

Template.user.events
  'click .user': (e,t) ->
    Session.set 'selected', @_id



Template.leaderboard.rendered = ->
  # animations!
  @find(".list")._uihooks =
    insertElement: (node, next) ->
      $node = $(node)
      # set the opacity initally to zero
      $node.css('opacity', '0')
      # insert to the dom
      $node.insertBefore(next)
      # animate the opacity
      $node.velocity {opacity: 1},
        duration: 500
        easing: 'ease-in-out'
        queue: false

    moveElement: (node, next) ->
      $node = $(node)
      $next = $(next)
      $node.insertBefore(next)

    removeElement: (node) ->
      $node = $(node)
      # animate off the screen to the left
      $node.velocity {translateX: '-100%'},
        duration: 250
        easing: 'ease-in'
        queue: false
        complete: -> 
          # remove when complete
          $node.remove()
