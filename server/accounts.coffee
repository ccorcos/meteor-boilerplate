Accounts.validateNewUser (user) ->
  if user.username?.length >= 3 then return true
  throw new Meteor.Error 403, "Username must have at least 3 characters."

Accounts.validateNewUser (user) ->
  if user.emails?.length > 0 then return true
  throw new Meteor.Error 403, "User must provide an email address."

Accounts.emailTemplates.resetPassword.text = (user, url) ->
   url = url.replace('#/reset-password', 'reset')
   return "Click this link to reset your password: " + url

Accounts.onCreateUser (options, user) ->
  user.score = 0
  if options.profile then user.profile = options.profile
  return user
