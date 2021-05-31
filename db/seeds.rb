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
# story would look like on the app when opened. It's a random extract from 50 shades of grey (chapter 24 i think).
story_nath_3 = Story.create!(
  author: nathalie,
  tags: ["BDSM", "Romance"],
  vibration_compatibility: true,
  intensity: 4,
  reading_time: 90,
  title: "Something Gray",
  content: "“Do you like the mirror Mrs Grey?” the hoarse whisper next to my ear suggests that he too, is a fan. One arm is locked around my waist, securing me to him and the other is trailing slow, fingertip-circles over my belly, not going anywhere near where I want them to go.

  My head rolls back onto his shoulder, my eyes almost flickering closed, lids heavy with desire, “mmhh,” I mewl my affirmation.

  He chuckles quietly, “look at us baby,” the sharp spike of pain that connects my nipple to my sex makes my eyes fly open as Christian pinches the straining bud. I gasp and shudder embarrassingly against him.

  “So eager Mrs Grey, so responsive,” he teases, “shall I make you come like this?” he’s rolling my peak between his thumb and forefinger, a leisurely squeeze and roll through the lace of the bra – just enough to drive me wild but not enough to get me off.

  “Please,” I manage past my panting breaths. Any which way, I don’t care as long as you do!

  Watching him – us is unspeakably erotic; my desire pooling, building, heaving I decide to help things along. He senses the shift in my arms that I want to slip from their hold so I can touch him but his growling order stops me, “keep still baby, if you move I stop.”

  I whimper and re-join my hands behind his neck, thrusting my breasts forward.

  “I want you too baby, I just want to play a bit, enjoy this moment with my wife.” Instead of soothing me the way he draws out the word wife sends lashings of fire through my veins, my stomach muscles already starting to quiver in anticipation of my brewing release.

  Fuck!

  “Look at your breasts Anastasia,” he cups one breast from the bottom, holding it for our mutual appreciation.  The balcony bra retains my breasts in a perfect display, the very low cut of the demi cups only just covering my puckering areola. His voice is turning huskier, his look darker as he brushes his thumb over the dark raring point.

  This time we gasp together, sucking in a fervent breath before Christian spins me around, crushing his mouth to mine. The harsh assault steals all reason, only awareness of blazing sensation remains; it feels like his hands are everywhere at once.

  I push off his shirt and roughly undo his belt, my fingers suddenly deft in their eagerness. I slide my hands down the sides of his torso, beneath the elastic of his boxers to get rid of both undies and pants in one go. He steps out of his slacks and I grip him firmly, working my fist down the length of him. When he inhales against my vigorous attack I trace the seal of his mouth with my tongue.

  Bodies joined, hungry sounds escaping, he starts walking us back, up against the edge of the bed. I break away; placing both palms on his chest I push so he topples backwards onto the covers. He laughs at my audacity, the throaty rumble is a shockingly sexy sound so I follow, crawling up to straddle him.

  In a surprise move he sits up, holding my hips in place, “so brazen Mrs Grey but I hope you know you’re not in charge right now.” Even though his eyes are smiling they’re also scorching with his unguarded want, clearly he has a plan for our first wedded union. I pout and bat my lashes but truthfully, I’m eager to be driven to passion by his expert steering. “Turn around baby.”

  I swivel and sit on his lap; my legs tucked back, knees planted on either side of his thighs, facing the mirror once more. His plan is suddenly crystal clear, I’m completely open to him, legs spread wide. Like this, both of his hands are free to touch and caress wherever he wants. His erection, currently hot and rigid between the cheeks of my behind, ready to push through my wet folds and we can watch it all, together.

  I’m grateful that he seems to have reached the edge of his control as he lifts my hips and brings me down, his hips shoving up to fill me with all of his hard length – finally letting me feel the delicious stretch my sex has been aching for.

  He grunts, his teeth bared as if in pain as he fights to hold off his release, keeping me still. I groan in pleasure, one hand finding a grip on his thigh while the other rakes through his hair.

  His hand snakes down, finding the sensitive heart in my slick mound his fingers start to circle there, the pressure perfect. “Fuck Ana, you’re so tight, so wet. Move baby, push up with your knees.” He growls though his gritted teeth as his other hand finds my breast. Pulling the bra cup down he tweaks my nipple, echoing the phenomenal pleasure down below.

  I don’t need to be asked twice, flexing my quads I drive up, to his very tip before forcing myself down, finding that sensational grind and friction that starts the inevitable spiral resulting from this much stunning stimulation.

  Watching him touching me, filling me has us unravelling rapidly, “come baby, come now!” he demands, his clever fingers increasing their fantastic rhythm, matching the increasing speed of my strokes up and down his ever hardening shaft perfectly.

  I fall hard, spectacularly as the coiled tension releases like a cracked whip in a blinding shudder that’s intensified by Christian’s vicious pulsing inside me, the aftershocks of our shared orgasm prolonging my gratification. Christian pants into my neck, dropping tender, out-of-breath kisses behind my ear as we float back to our senses."
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
