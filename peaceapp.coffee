if Meteor.isClient
  Template.body.events = "click .btn": ->
    go()

  go = ->
    if Meteor.users.findOne()
      me = Meteor.user()._id
      all = Meteor.users.find({_id :{$ne:me}}).fetch()
      total = all.length
      randomIndex = Math.floor(Math.random() * (total+0));
      if all[randomIndex].services.facebook
        $('#other-image').attr("src","http://graph.facebook.com/" + all[randomIndex].services.facebook.id + "/picture/?type=large");
        $('#other-gender').html(all[randomIndex].services.facebook.gender)
        $('#other-name').html(all[randomIndex].profile.name)

  Template.body.friends = ->
    Meteor.users.find().count()

  Template.body.shares = ->
    #Meteor.shares.find().count()
    0

  Template.body.me = ->
    me = Meteor.user()
    if me
      if me.services.facebook
        object = {}
        object.image = "http://graph.facebook.com/" + me.services.facebook.id + "/picture/?type=large"
        object.gender = me.services.facebook.gender
        object.name = me.profile.name
        object



if Meteor.isServer
  Meteor.startup ->


