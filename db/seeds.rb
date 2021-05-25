User.destroy_all
Story.destroy_all

#Bree is the reader, others are authors
bree = User.create!(age: 48, username: "BreeVDK", email: "bree.dh@gmail.com", password: "12345", whitelist: ["Public", "Romance", "Fantasy"], blacklist: ["Furry", "Accounting", "Leather"] )
granny = User.create!(age: 74, username: "GrannySmith", email: "aglae.sydonie@gmail.com", password: "12345", whitelist: ["Furry", "Romance", "BDSM"], blacklist: ["Public", "Horror", "Threesome"] )
brigitte = User.create!(age: 68, username: "BrigitteM", email: "brigitte.m@elysee.fr", password: "12345", whitelist: ["LGBTQ+", "Leather", "Accounting"], blacklist: ["Threesome", "Feet", "Furry"] )
nathalie = User.create!(age: 54, username: "BatNath", email: "nath.richon@gmail.com", password: "12345", whitelist: [ "Romance", "Fantasy"], blacklist: ["Furry", "Accounting", "Leather"] )

story_granny_1 = Story.create!(
  author: granny, 
  tags: ["Public", "Fantasy"],
  vibration_compatibility: true,
  intensity: 4,
  reading_time: 15,
  title: "Aventure à la campagne", 
  content: "Tout le monde la nommait la Grande-Forêt, et ce depuis la nuit des temps. 
  Tout le monde connaissait la Grande-Forêt sans jamais y avoir mis les pieds. La Grande-Forêt, comme son nom ne l’indiquait pas, était très, très, très grande. Elle couvrait presque la moitié du continent.
  Si sur ses lisières le peuplement semblait relativement clairsemé, il n’en allait pas de même sitôt parcourus quelques arpents."
)
story_granny_2 = Story.create!(
  author: granny, 
  tags: ["Public", "Fantasy"],
  vibration_compatibility: true,
  intensity: 4,
  reading_time: 15,
  title: "Aventure à la campagne", 
  content: "Tout le monde la nommait la Grande-Forêt, et ce depuis la nuit des temps. 
  Tout le monde connaissait la Grande-Forêt sans jamais y avoir mis les pieds. La Grande-Forêt, comme son nom ne l’indiquait pas, était très, très, très grande. Elle couvrait presque la moitié du continent.
  Si sur ses lisières le peuplement semblait relativement clairsemé, il n’en allait pas de même sitôt parcourus quelques arpents."
)
story_granny_3
story_brigitte_1
story_brigitte_2
story_brigitte_3
story_nath_1
story_nath_2
story_nath_3