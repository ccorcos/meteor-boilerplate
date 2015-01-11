imageStore = new FS.Store.GridFS("images");

@Images = new FS.Collection "images", 
  stores: [imageStore]
  filter: 
    allow: 
      contentTypes: ['image/*']

# has to be your image to maniuplate, and you must be logged in to see images.
Images.allow
  insert: (userId, doc) ->
    doc.metadata?.ownerId is userId
  update: (userId, doc, fields, modifier) ->
    doc.metadata?.ownerId is userId
  remove: (userId, doc) ->
    doc.metadata?.ownerId is userId
  download: (userId, doc) ->
    userId?
  
Meteor.users.helpers
  img: () ->
    Images.findOne(@imgId)

# when collectionhooks work for collectionfs
# Images.after.insert (userId, doc) ->
#   # remove all images attributed to this owner except
#   # the one that was just added
#   Also se the user's imgId
#   Images.remove 
#     'metadata.ownerId': userId
#     _id: {$ne: doc._id}