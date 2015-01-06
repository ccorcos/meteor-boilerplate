# don't mess up any underscore methods in case another package uses them
@_ = _.extend lodash, _

# _.str.lower = (string) -> string.toLowerCase()