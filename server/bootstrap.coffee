Meteor.startup ->
  # if the database is empty, create a bunch of take users
  if Meteor.users.find().count() is 0
    for i in [0...10]
      user = Fake.user fields: ['name', 'email']
      username = user.name.toLowerCase()
      email = user.email

      unless Meteor.users.findOne({username:username})
        userId = Accounts.createUser
            username: username
            email: email
            password: '000000'

        img = new FS.File('https://randomuser.me/api/portraits/thumb/lego/' + i.toString() + '.jpg')
        img.metadata =  
          date: Date.now()
          ownerId: userId

        Images.insert img,  (err, fileObj) ->
          # console.log fileObj
          if err
            console.log err
          else
            Meteor.users.update {_id: userId}, {$set: {imgId: fileObj._id}}


