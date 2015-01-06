@delay = (ms, func) -> Meteor.setTimeout func, ms

@nonEmptyStrings = (strings...) ->
  for string in strings
    if not (Match.test(string, String) and string.length > 0)
      return false
  return true
