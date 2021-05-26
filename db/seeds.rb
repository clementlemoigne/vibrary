require "faker"

Reaction.destroy_all
Favorite.destroy_all
Reading.destroy_all
FavoriteAuthor.destroy_all
Story.destroy_all
User.destroy_all

#Bree is the reader, others are authors
bree = User.create!(age: 48, username: "BreeVDK", email: "bree.dh@gmail.com", password: "123456", whitelist: ["Public", "Romance", "Fantasy"], blacklist: ["Furry", "Accounting", "Leather"])
granny = User.create!(age: 74, username: "GrannySmith", email: "aglae.sydonie@gmail.com", password: "123456", whitelist: ["Furry", "Romance", "BDSM"], blacklist: ["Public", "Horror", "Threesome"])
brigitte = User.create!(age: 68, username: "BrigitteM", email: "brigitte.m@elysee.fr", password: "123456", whitelist: ["LGBTQ+", "Leather", "Accounting"], blacklist: ["Threesome", "Feet", "Furry"])
nathalie = User.create!(age: 54, username: "BatNath", email: "nath.richon@gmail.com", password: "123456", whitelist: ["Romance", "Fantasy"], blacklist: ["Furry", "Accounting", "Leather"])

# Random Users, they're just here to allow us to add reactions to our stories.
user1 = User.create!(age: rand(18..99), username: Faker::GreekPhilosophers.name, email: Faker::Internet.email, password: "azerty")
user2 = User.create!(age: rand(18..99), username: Faker::GreekPhilosophers.name, email: Faker::Internet.email, password: "azerty")
user3 = User.create!(age: rand(18..99), username: Faker::GreekPhilosophers.name, email: Faker::Internet.email, password: "azerty")
user4 = User.create!(age: rand(18..99), username: Faker::GreekPhilosophers.name, email: Faker::Internet.email, password: "azerty")
user5 = User.create!(age: rand(18..99), username: Faker::GreekPhilosophers.name, email: Faker::Internet.email, password: "azerty")

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
  content: "Despite my warnings Brian and Carl were now walking around the Sussex Countryside that warm Wednesday afternoon, particularly two small villages Gwyn had apparently mentioned 'Ed's Uncle' living near and they walked about looking for 'a teacher' - Thank God they never found one.",
)
story_granny_2 = Story.create!(
  author: granny,
  tags: ["Public", "Fantasy"],
  vibration_compatibility: true,
  intensity: 3,
  reading_time: 15,
  title: "Countryside Adventure Chapter 3",
  content: "Brian saw the sense but Carl considered it a challenge and wasn't having that from 'no fuckin' Farmer Giles' and if he wanted to look round he fuckin' would, looking contemptuously at the farmer and walking straight past him.",
)
story_granny_3 = Story.create!(
  author: granny,
  tags: ["Public", "Fantasy"],
  vibration_compatibility: true,
  intensity: 4,
  reading_time: 15,
  title: "Countryside Adventure Chapter 4",
  content: "By the time the police officer arrived she saw their car pulling away from the pub car park and managed to write down the registration number. A check of the computer would show that it had the registration plates of another Ford Focus the same colour that had been stolen from a railway station car park in London three days before.",
)

# Bree has 3 bookmarked stories, 1 & 2 from Brigitte and 3 from Nath. 
# Bree started reading 3 stories, Brigitte 3 and Nath 1 & 2.
# Nath 2 & 3 and Brigitte 2 are the best rated stories, 
# with 4 upvotes 1 downvote on nath 3, 3 upvotes on nath 2, 2 upvotes on brigitte 2.
story_brigitte_1 = Story.create!(
  author: brigitte,
  tags: ["Public"],
  vibration_compatibility: false,
  reading_time: 20,
  title: "Nothing Between Us",
  content: "Thuy's our neighbor and an old classmate of mine from high school. We had been friends since we were children. One day when she was eleven, she had randomly decided her new American name would be Jennifer. I argued for something like Thea that would be at least close to Thuy, but she stuck with Jennifer and in time only her family and I were left using her original name. My mom sometimes accommodated me.",
)

story_brigitte_2 = Story.create!(
  author: brigitte,
  tags: ["Public", "LGBTQ+"],
  vibration_compatibility: false,
  reading_time: 35,
  title: "Western Skies Ch. 04",
  content: "Disjointed, malformed visions raced through my head. Unbidden dreams came to me as my subconscious mind sifted though its memory vault, trying to make sense of the last few weeks. First came fragments of my new life in Montana; images paraded haphazardly beneath my eyelids, clear as daylight but just out of reach. I was driving the splendid Beartooth Highway with my dad, the day before I moved into the dorm...then it was my first day at school...and then Luke looking at me over his shoulder, blushing...",
)
story_brigitte_3 = Story.create!(
  author: brigitte,
  tags: ["BDSM", "LGBTQ+"],
  vibration_compatibility: false,
  reading_time: 25,
  title: "Tied Up in Knotts Ch. 12",
  content: "We should do something different when we stop next. Penn's arm was still draped behind my seat just as it had been for the last few days. As was my hand on his leg. Besides the type of flirting that simmered below the surface, this was as far as things had gone between us.",
)
story_nath_1 = Story.create!(
  author: nathalie,
  tags: ["Leather", "Romance"],
  vibration_compatibility: false,
  reading_time: 90,
  title: "The Six Feet Between Us",
  content: "Most nights as a child, I'd lie awake in bed staring at the ceiling and wondering if a 'tolerable' life was worth aspiring to, and if it wasn't, what was I waiting for? Perhaps, I should just cut to the chase and put myself out of my misery. Of course, I'm telling you this story, which means that I didn't, and I'm glad I persevered. But such was my life before The Middle.",
)
story_nath_2 = Story.create!(
  author: nathalie,
  tags: ["Leather", "Romance"],
  vibration_compatibility: false,
  reading_time: 45,
  title: "S'mores Ch. 04 - Forever Please",
  content: "The way her eyes examined me, as if every detail was being recorded for future use, had my breath catching in my throat. A low growl erupted from deep within her. Her lips were on my neck then her hands grabbed my waist and lifted me on the countertop. I wrapped my legs around her hips, pulling her closer to me, falling just short of making her part of me. I was not allowing her to change her mind and leave. Our lips and tongues battled for dominance once again. My arms wrapped around her neck, tangled in her hair, my nose filled with her strawberries and cream scent.",
)

# The third story from Nath is slightly longer so we have an example for what a "full"
# story would look like on the app when opened. It's a random extract from 50 shades of grey.
story_nath_3 = Story.create!(
  author: nathalie,
  tags: ["BDSM", "Romance"],
  vibration_compatibility: true,
  reading_time: 90,
  intensity: 4,
  title: "Something Gray",
  content: "When he comes away I catch his gaze. His eyes look unfocussed – cross-eyed with lust. “I’ve missed you, I’ve missed you so much.” His expression a strange blend of pain and elation, whispered words born of desperate need. He swiftly stretches to cover my body with his, kissing me wildly.  He raids my mouth mercilessly, our arms and legs tangling and writhing, taking in the exquisite pleasure of intimate contact.

  He rolls taking me with him and we pause for air, our breaths mingling and faces flushed. With my body on top of his I stroke my hand over the sprinkling of stubble, reacquainting myself with every curve and dip of his face. “You are so precious, thank you for taking another chance on me.”
  
  Another low hum is his reply and he closes his eyes as my gratitude sluices over him – clearly striking a cord. “Come here.” It’s a carnal command but I don’t understand and I raise an unsure brow. Where does he want me to go, I’m already here?
  
  “Come, sit here, on my chest.” He pats his sternum. His silky voice is dripping with erotic promise.
  
  I scoot up, eager to find out what passionate delight he has in store for me. It only takes a second for me to grasp the nature of the deeply intimate act he has in mind and I gnaw at my lip, my coyness getting the better of me.
  
  My legs are bent with my knees resting on either side of his head. My bottom sits on his chest, taking my weight which leaves my secret opening utterly gaping and vulnerable, not to mention very close to his sinful mouth. I can feel his breath on me, fluttering and making my heart stutter."
)

# Marks Granny as one of Bree's favorite authors
fav_author_1 = FavoriteAuthor.create!(
  user: bree,
  author: granny
)

# Marks Brigitte 1 & 2 and Nath 3 as bookmarked (read later)
farovite_1 = Favorite.create!(
  user: bree,
  story: story_brigitte_1
)
farovite_2 = Favorite.create!(
  user: bree,
  story: story_brigitte_2
)
farovite_3 = Favorite.create!(
  user: bree,
  story: story_nath_3
)

# Marks Nath 1 & 2 and Brigitte 3 as ongoing (started reading)
reading_1 = Reading.create!(
  user: bree,
  story: story_nath_1
)
reading_2 = Reading.create!(
  user: bree,
  story: story_nath_2
)
reading_3 = Reading.create!(
  user: bree,
  story: story_brigitte_3
)

# Reactions from the random users
reaction_1 = Reaction.create!(
  user: user1,
  story: story_nath_3,
  upvoted: true
)
reaction_2 = Reaction.create!(
  user: user2,
  story: story_nath_3,
  upvoted: true
)
reaction_3 = Reaction.create!(
  user: user3,
  story: story_nath_3,
  upvoted: true
)
reaction_4 = Reaction.create!(
  user: user4,
  story: story_nath_3,
  upvoted: true
)
reaction_5 = Reaction.create!(
  user: user5,
  story: story_nath_3,
  upvoted: false
)
reaction_6 = Reaction.create!(
  user: user1,
  story: story_nath_2,
  upvoted: true
)
reaction_7 = Reaction.create!(
  user: user2,
  story: story_nath_2,
  upvoted: true
)
reaction_8 = Reaction.create!(
  user: user3,
  story: story_nath_2,
  upvoted: true
)
reaction_9 = Reaction.create!(
  user: user5,
  story: story_brigitte_2,
  upvoted: true
)
reaction_10 = Reaction.create!(
  user: user4,
  story: story_brigitte_2,
  upvoted: true
)
