Accounts.validateNewUser (user) ->
  if user.username?.length >= 3 then return true
  throw new Meteor.Error 403, "Username must have at least 3 characters."

Accounts.validateNewUser (user) ->
  if user.emails?.length > 0 then return true
  throw new Meteor.Error 403, "User must provide an email address."
