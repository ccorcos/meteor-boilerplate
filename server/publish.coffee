
Meteor.publishComposite 'users', () ->
  if @userId
    return {
      find: ->
        Meteor.users.find {}, 
          fields:
            _id: 1
            username: 1
            score: 1
            imgId: 1
      children: [{
        find: (user) ->
          if user.imgId?
            Images.find(user.imgId)
        }]}

Meteor.publishComposite 'user', (userId) ->
  if @userId
    return {
      find: ->
        Meteor.users.find {_id:userId}, 
          fields:
            _id: 1
            username: 1
            score: 1
            imgId: 1
      children: [{
        find: (user) ->
          if user.imgId?
            Images.find(user.imgId)
        }]}


# Meteor.publish 'users', -> 
#   # must be logged in!
#   if @userId 
#     return Meteor.users.find {}, 
#       fields:
#         _id: 1
#         username: 1
#         score: 1
#         imgId: 1

# Meteor.publish 'user', (userId)-> 
#   # must be logged in!
#   if @userId 
#     return Meteor.users.find {_id:userId}, 
#       fields:
#         _id: 1
#         username: 1
#         score: 1
#         imgId: 1