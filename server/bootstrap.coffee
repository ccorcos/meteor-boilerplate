Meteor.startup ->
  # if the database is empty, create a bunch of take users
  if Meteor.users.find().count() is 0
    for i in [0...10]
      user = Fake.user fields: ['name', 'email']

      Accounts.createUser
        username: user.name.toLowerCase()
        email: user.email
        password: '000000'