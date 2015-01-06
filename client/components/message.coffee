Session.setDefault 'message', ''
@message = (msg) -> Session.set 'message', msg
@noMessage = (msg) -> Session.set 'message', ''
Template.registerHelper 'message', -> Session.get('message')