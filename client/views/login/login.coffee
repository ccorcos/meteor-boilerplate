Template.login.created = ->
  @vm = new ViewModel
    usernameOrEmail: ''
    password: ''
    error: ''
    canLogin: -> 
      nonEmptyStrings @usernameOrEmail(), @password()
    login: ->
      Meteor.loginWithPassword @usernameOrEmail(), @password(), (err) =>
        if err
          @error err.reason
        else
          # the router should reactively update and remove the login screen
          
  # @vm.addHelpers @

Template.login.rendered = ->
  @vm.bind @
