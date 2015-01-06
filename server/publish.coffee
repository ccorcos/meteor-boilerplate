
Meteor.publish 'users', -> 
  # must be logged in!
  if @userId 
    Meteor.users.find {}, 
      fields:
        _id: 1
        username: 1
        score: 1
  else
    return false