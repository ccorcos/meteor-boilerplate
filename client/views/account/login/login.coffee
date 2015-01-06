Template.login.rendered = ->
  noError()

Template.login.events
  'submit form#login' : formSubmit (e, t, values) ->
   
    # Trim and validate
    username = _.str.trim values.username
    password = values.password

    Meteor.loginWithPassword username, password,
      (err) ->
        if err
          error(err.reason)
        else
          noError()
          afterLoginSignup()