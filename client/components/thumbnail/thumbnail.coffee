Template.thumbnail.events
  'change #thumbnail-upload': (e,t) ->
    file = e.target.files[0]
    if not file? then return

    data = processImage file, 200, 200, (data) ->
      
      img = new FS.File(data)

      img.metadata =  
        date: Date.now()
        ownerId: Meteor.userId()

      Images.insert img,  (err, fileObj) ->
        if err
          console.log err
        else
          Meteor.call 'setImg', fileObj._id



Template.thumbnail.rendered = ->
  $thumb = $(@find('img.thumbnail'))
  Meteor.defer ->
    aspect = $thumb.width() / $thumb.height()
    if aspect > 1
      $thumb.css("width", "auto")
      $thumb.css("height", "100%")
      $thumb.css("transform", "translateX(-" + ((1-(1/aspect))/2*100).toString() + "%)")
    else
      $thumb.css("width", "100%")
      $thumb.css("height", "auto")
      $thumb.css("transform", "translateY(-" + ((1-aspect)/2*100).toString() + "%)")

      