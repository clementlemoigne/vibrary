User.destroy_all
Story.destroy_all

#Bree is the reader, others are authors
bree = User.create!(age: 48, username: "BreeVDK", email: "bree.dh@gmail.com", password: "12345", whitelist: ["Public", "Romance", "Fantasy"], blacklist: ["Furry", "Accounting", "Leather"] )
granny = User.create!(age: 74, username: "GrannySmith", email: "aglae.sydonie@gmail.com", password: "12345", whitelist: ["Furry", "Romance", "BDSM"], blacklist: ["Public", "Horror", "Threesome"] )
brigitte = User.create!(age: 68, username: "BrigitteM", email: "brigitte.m@elysee.fr", password: "12345", whitelist: ["LGBTQ+", "Leather", "Accounting"], blacklist: ["Threesome", "Feet", "Furry"] )
nathalie = User.create!(age: 54, username: "BatNath", email: "nath.richon@gmail.com", password: "12345", whitelist: [ "Romance", "Fantasy"], blacklist: ["Furry", "Accounting", "Leather"] )

# Granny's stories are the ones recommended for latest chapters,
# she's followed by Bree so the last three chapters she published 
# are the ones Bree sees in her "New Chapters" section on her homepage.
story_granny_1 = Story.create!(
  author: granny, 
  tags: ["Public", "Fantasy"],
  vibration_compatibility: true,
  intensity: 4,
  reading_time: 15,
  title: "Countryside Adventure Chapter 2", 
  content: "Despite my warnings Brian and Carl were now walking around the Sussex Countryside that warm Wednesday afternoon, particularly two small villages Gwyn had apparently mentioned 'Ed's Uncle' living near and they walked about looking for 'a teacher' - Thank God they never found one."
)
story_granny_2 = Story.create!(
  author: granny, 
  tags: ["Public", "Fantasy"],
  vibration_compatibility: true,
  intensity: 3,
  reading_time: 15,
  title: "Countryside Adventure Chapter 3", 
  content: "Brian saw the sense but Carl considered it a challenge and wasn't having that from 'no fuckin' Farmer Giles' and if he wanted to look round he fuckin' would, looking contemptuously at the farmer and walking straight past him."
)
story_granny_3 = Story.create!(
  author: granny, 
  tags: ["Public", "Fantasy"],
  vibration_compatibility: true,
  intensity: 4,
  reading_time: 15,
  title: "Countryside Adventure Chapter 4", 
  content: "By the time the police officer arrived she saw their car pulling away from the pub car park and managed to write down the registration number. A check of the computer would show that it had the registration plates of another Ford Focus the same colour that had been stolen from a railway station car park in London three days before."
)

# Bree has 3 bookmarked stories, two from Brigitte and one from Nath. 
story_brigitte_1 = Story.create!(
  author: brigitte, 
  tags: ["Public"],
  vibration_compatibility: false,
  reading_time: 20,
  title: "", 
  content: "By the time the police officer arrived she saw their car pulling away from the pub car park and managed to write down the registration number. A check of the computer would show that it had the registration plates of another Ford Focus the same colour that had been stolen from a railway station car park in London three days before."
)
story_brigitte_2
story_brigitte_3
story_nath_1
story_nath_2
story_nath_3