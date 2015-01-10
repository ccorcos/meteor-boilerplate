Template.signup.rendered = ->
  noError()

Template.signup.events
  'submit form#signup': formSubmit (e, t, values) ->
   
    # Trim and validate
    username = _.str.trim values.username
    email = _.str.trim values.email
    password = values.password
    verify = values.verify

    if password != verify
      error "Passwords do not match."
      return

    if password.length <= 3
      error "Password must have more than 4 characters."
      return

    Accounts.createUser
      username: username
      email: email
      password: password
    ,
      (err) ->
        if err
          error(err.reason)
        else
          noError()
          afterSignup()