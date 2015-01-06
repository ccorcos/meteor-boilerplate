Session.setDefault 'error', ''
@error = (msg) -> Session.set 'error', msg
@noError = (msg) -> Session.set 'error', ''
Template.registerHelper 'error', -> Session.get('error')

Session.setDefault 'message', ''
@message = (msg) -> Session.set 'message', msg
@noMessage = (msg) -> Session.set 'message', ''
Template.registerHelper 'message', -> Session.get('message')