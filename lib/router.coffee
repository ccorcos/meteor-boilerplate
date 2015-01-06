Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

# if the user isnt logged in, render the login template.
# or the user can signup. But the point is that this
# should reactively update once the user has signed up.
Router.onBeforeAction checkLoggedIn, except: ['login', 'signup', 'forgot']

checkLoggedIn = ->
  # if Meteor.loggingIn()
    # @render 'loading'
  if not Meteor.userId()
    @redirect 'login'
  else
    @next()

Router.route 'home',
  path: '/'
  template: 'leaderboard'
  # waitOn: -> Meteor.subscribe 'users'

Router.route 'login'
Router.route 'signup'
Router.route 'forgot'
