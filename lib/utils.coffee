@delay = (ms, func) -> Meteor.setTimeout func, ms

@nonEmptyStrings = (strings...) ->
  for string in strings
    if not (Match.test(string, String) and string.length > 0)
      return false
  return true

@formValues = (e) ->
  $(e.target).serializeArray()
    .map (obj) ->
      c = {}
      c[obj.name] = obj.value
      return c
    .reduce (a,b) -> _.extend(a,b)

@formSubmit = (func) ->
  return (e,t) ->
    e.preventDefault()
    values = formValues e
    func.bind(@)
    func(e,t,values)
    return false
