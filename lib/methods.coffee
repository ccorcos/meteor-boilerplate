Meteor.methods
  add5: (userId) ->
    # must perform checks on all meteor method inputs
    check userId, String
    # make sure a user is logged in
    if @userId
      Meteor.users.update {_id:userId}, {$inc: {score: 5}}
  setImg: (fileId) ->
    check fileId, String
    if @userId
      Meteor.users.update {_id:@userId}, {$set: {imgId: fileId}}
      # cleanup
      Images.remove 
        'metadata.ownerId': @userId
        _id: {$ne: fileId}
        