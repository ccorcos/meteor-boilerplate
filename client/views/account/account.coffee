@afterLoginSignup = ->
  Router.go 'home'

Template.login.events
  'click .toForgot': (e,t) ->
    Router.go 'forgot'
  'click .toSignup': (e,t) ->
    Router.go 'signup'

Template.signup.events
  'click .toLogin': (e,t) ->
    Router.go 'login'

Template.forgot.events
  'click .toLogin': (e,t) ->
    Router.go 'login'
