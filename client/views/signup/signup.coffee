Template.signup.created = ->
  @vm = new ViewModel
    username: ''
    email: ''
    password: ''
    verify: ''
    error: ''
    canSignup: ->
      nonEmptyStrings @username, @email, @password, @verify
    signup: ->
      if @password() isnt @verify
        @error 'Passwords do not match.'
      else 
        @error ''
        Accounts.createUser
          username: @username()
          email: @email()
          password: @password()
          profile:
            score: 0
        ,
          (err) ->
            if err
              @error err.reason
            else
              # the router should reactively update and remove the signup screen

  # @vm.addHelpers @

Template.signup.rendered = ->
  @vm.bind @
