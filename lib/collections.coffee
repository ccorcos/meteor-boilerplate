imageStore = new FS.Store.GridFS("images");

@Images = new FS.Collection "images", 
  stores: [imageStore]
  filter: 
    allow: 
      contentTypes: ['image/*']

# has to be your image to maniuplate, and you must be logged in to see images.
Images.allow
  insert: (userId, doc) ->
    console.log "insert", doc
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

if Meteor.isServer
  # when collectionhooks work for collectionfs
  Images.files.before.insert (userId, doc) ->
    doc.metadata =  
      date: Date.now()
      ownerId: userId
    console.log "before", doc
    return doc

  Images.files.after.insert (userId, doc) ->
    # set the user's img
    Meteor.users.update {_id:userId}, {$set: {imgId: doc._id}}
    # remove all images attributed to this owner except
    # the one that was just added
    Images.remove 
      'metadata.ownerId': userId
      _id: {$ne: doc._id}