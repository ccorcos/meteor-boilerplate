
Meteor.publish 'users', -> 
  # must be logged in!
  if @userId 
    return Meteor.users.find {}, 
      fields:
        _id: 1
        username: 1
        score: 1