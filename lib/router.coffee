Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

# if the user isnt logged in, render the login template.
# or the user can signup. But the point is that this
# should reactively update once the user has signed up.
Router.onBeforeAction ->
    if not Meteor.userId()
      @redirect 'login'
    else
      @next()
  , 
    except: ['login', 'signup', 'forgot', 'reset']

  
Router.route 'home',
  path: '/'
  template: 'leaderboard'
  waitOn: -> 
    if Meteor.userId()
      return Meteor.subscribe 'users'




Router.route 'login'
Router.route 'signup'
Router.route 'forgot'

Router.route 'reset',
  path: 'reset/:id'
  onBeforeAction: ->
    unless @params.id
      @redirect 'home'
    Session.set 'resetPasswordToken', @params.id
    @next()

