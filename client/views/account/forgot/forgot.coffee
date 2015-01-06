Template.forgot.rendered = ->
  noMessage()
  noError()

Template.forgot.events
  'submit form#recover': formSubmit (e, t, values) ->

    email = _.str.trim values.email

    unless email
      error 'Please provide an email address.'
      return

    message "Sending you an email..."

    Accounts.forgotPassword
      email: email
    ,
      (err) ->
        if err
          noMessage()
          error(err.reason)
        else
          noError()
          message "Check your email for a recovery link."
