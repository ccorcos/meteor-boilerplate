Session.setDefault 'error', ''
@error = (msg) -> Session.set 'error', msg
@noError = (msg) -> Session.set 'error', ''
Template.registerHelper 'error', -> Session.get('error')
