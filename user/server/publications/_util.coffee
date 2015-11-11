@_pubQueryMatch = Match.Optional Match.OneOf String, Match.ObjectIncluding
  _id: Match.Optional Match.OneOf String, Match.ObjectIncluding
    $in: Match.Optional Array
  $or: Match.Optional Array
  $and: Match.Optional Array
  category: Match.Optional String
  products: Match.Optional Match.ObjectIncluding
    $in: Match.Optional Array

@_pubOptionsMatch = Match.Optional Match.ObjectIncluding
  fields: Match.Optional Object
  sort: Match.Optional Object
  limit: Match.Optional Number

@_pubImagesFields =
  fields:
    'copies.imagesGFS.key': 1

@_pubVideosFields =
  fields:
    'copies.videosGFS.key': 1

@_pubJsonsFields =
  fields:
    'copies.jsonsGFS.key': 1

@_pubCategoryFields =
  fields:
    name: 1
