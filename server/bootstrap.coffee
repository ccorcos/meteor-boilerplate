Meteor.startup ->
  # if the database is empty, create a bunch of take users
  if Meteor.users.find().count() is 0
    for i in [0...50]
      user = Fake.user fields: ['name', 'email']
      username = user.name.toLowerCase()
      email = user.email

      unless Meteor.users.findOne({username:username})
        Accounts.createUser
            username: username
            email: email
            password: '000000'