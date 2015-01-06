Meteor.methods
  add5: (userId) ->
    # must perform checks on all meteor method inputs
    check userId, String
    # make sure a user is logged in
    if @userId
      Meteor.users.update {_id:userId}, {$inc: {score: 5}}