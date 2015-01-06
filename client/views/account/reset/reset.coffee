Template.reset.rendered = ->
  noMessage()
  noError()

Template.reset.events

  'submit form#reset': formSubmit (e, t, values) ->
    
    password = values.password
    verify = values.verify

    if password != verify
      error "Passwords do not match."
      return

    if password.length <= 3
      error "Password must have more than 4 characters."
      return

    message "Resetting your password..."

    Accounts.resetPassword Session.get('resetPasswordToken'), password,
      (err) ->
        if err
          noMessage()
          error(err.reason)
        else
          Session.set('resetPasswordToken', null)
          noMessage()
          noError()
          afterLoginSignup()


