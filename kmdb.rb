# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Agent.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# rails generate model Studio
# rails generate model Movie
# rails generate model Actor
# rails generate model Role
# rails generate model Agent
# rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
wb = Studio.new
wb["name"] = "Warner Bros."
wb.save

agent_sam = Agent.new
agent_sam["name"] = "Sam Feng"
agent_sam.save

agent_tom = Agent.new
agent_tom["name"] = "Tom Hanks"
agent_tom.save

# Inserting all movies
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = wb.id
batman_begins.save

dark_knight_1 = Movie.new
dark_knight_1["title"] = "The Dark Knight"
dark_knight_1["year_released"] = 2008
dark_knight_1["rated"] = "PG-13"
dark_knight_1["studio_id"] = wb.id
dark_knight_1.save

dark_knight_2 = Movie.new
dark_knight_2["title"] = "The Dark Knight Rises"
dark_knight_2["year_released"] = 2012
dark_knight_2["rated"] = "PG-13"
dark_knight_2["studio_id"] = wb.id
dark_knight_2.save

# Inserting all actors/actresses
a_cb = Actor.new
a_cb["name"] = "Christian Bale"
a_cb["agent_id"] = agent_sam.id
a_cb.save

a_mc = Actor.new
a_mc["name"] = "Michael Caine"
a_mc["agent_id"] = agent_sam.id
a_mc.save

a_ln = Actor.new
a_ln["name"] = "Liam Neeson"
a_ln["agent_id"] = agent_sam.id
a_ln.save

a_kh = Actor.new
a_kh["name"] = "Katie Holmes"
a_kh["agent_id"] = agent_tom.id
a_kh.save

a_go = Actor.new
a_go["name"] = "Gary Oldman"
a_go["agent_id"] = agent_sam.id
a_go.save

a_hl = Actor.new
a_hl["name"] = "Heath Ledger"
a_hl["agent_id"] = agent_sam.id
a_hl.save

a_ae = Actor.new
a_ae["name"] = "Aaron Eckhart"
a_ae["agent_id"] = agent_sam.id
a_ae.save

a_mg = Actor.new
a_mg["name"] = "Maggie Gyllenhaal"
a_mg["agent_id"] = agent_sam.id
a_mg.save

a_th = Actor.new
a_th["name"] = "Tom Hardy"
a_th["agent_id"] = agent_sam.id
a_th.save

a_jgl = Actor.new
a_jgl["name"] = "Joseph Gordon-Levitt"
a_jgl["agent_id"] = agent_tom.id
a_jgl.save

a_ah = Actor.new
a_ah["name"] = "Anne Hathaway"
a_ah["agent_id"] = agent_tom.id
a_ah.save

# Inserting roles
r_bb_bw = Role.new
r_bb_bw["movie_id"] = batman_begins.id
r_bb_bw["actor_id"] = a_cb.id
r_bb_bw["character_name"] = "Bruce Wayne"
r_bb_bw.save

r_bb_a = Role.new
r_bb_a["movie_id"] = batman_begins.id
r_bb_a["actor_id"] = a_mc.id
r_bb_a["character_name"] = "Alfred"
r_bb_a.save

r_bb_rag = Role.new
r_bb_rag["movie_id"] = batman_begins.id
r_bb_rag["actor_id"] = a_ln.id
r_bb_rag["character_name"] = "Ra's Al Ghul"
r_bb_rag.save

r_bb_rd = Role.new
r_bb_rd["movie_id"] = batman_begins.id
r_bb_rd["actor_id"] = a_kh.id
r_bb_rd["character_name"] = "Rachel Dawes"
r_bb_rd.save

r_bb_cg = Role.new
r_bb_cg["movie_id"] = batman_begins.id
r_bb_cg["actor_id"] = a_go.id
r_bb_cg["character_name"] = "Commissioner Gordon"
r_bb_cg.save

r_dk1_bw = Role.new
r_dk1_bw["movie_id"] = dark_knight_1.id
r_dk1_bw["actor_id"] = a_cb.id
r_dk1_bw["character_name"] = "Bruce Wayne"
r_dk1_bw.save

r_dk1_j = Role.new
r_dk1_j["movie_id"] = dark_knight_1.id
r_dk1_j["actor_id"] = a_hl.id
r_dk1_j["character_name"] = "Joker"
r_dk1_j.save

r_dk1_hd = Role.new
r_dk1_hd["movie_id"] = dark_knight_1.id
r_dk1_hd["actor_id"] = a_ae.id
r_dk1_hd["character_name"] = "Harvey Dent"
r_dk1_hd.save

r_dk1_a = Role.new
r_dk1_a["movie_id"] = dark_knight_1.id
r_dk1_a["actor_id"] = a_mc.id
r_dk1_a["character_name"] = "Alfred"
r_dk1_a.save

r_dk1_rd = Role.new
r_dk1_rd["movie_id"] = dark_knight_1.id
r_dk1_rd["actor_id"] = a_mg.id
r_dk1_rd["character_name"] = "Rachel Dawes"
r_dk1_rd.save

r_dk2_bw = Role.new
r_dk2_bw["movie_id"] = dark_knight_2.id
r_dk2_bw["actor_id"] = a_cb.id
r_dk2_bw["character_name"] = "Bruce Wayne"
r_dk2_bw.save

r_dk2_cg = Role.new
r_dk2_cg["movie_id"] = dark_knight_2.id
r_dk2_cg["actor_id"] = a_go.id
r_dk2_cg["character_name"] = "Commissioner Gordon"
r_dk2_cg.save

r_dk2_b = Role.new
r_dk2_b["movie_id"] = dark_knight_2.id
r_dk2_b["actor_id"] = a_th.id
r_dk2_b["character_name"] = "Bane"
r_dk2_b.save

r_dk2_jb = Role.new
r_dk2_jb["movie_id"] = dark_knight_2.id
r_dk2_jb["actor_id"] = a_jgl.id
r_dk2_jb["character_name"] = "John Blake"
r_dk2_jb.save

r_dk2_sk = Role.new
r_dk2_sk["movie_id"] = dark_knight_2.id
r_dk2_sk["actor_id"] = a_ah.id
r_dk2_sk["character_name"] = "Selina Kyle"
r_dk2_sk.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
all_movies = Movie.all
for movies in all_movies
  title = movies["title"]
  year_released = movies["year_released"]
  rated = movies["rated"]
  studio = movies["studio_id"]
  studio_display = Studio.find_by({"id" => studio})
  puts "#{title.ljust(25)}  #{year_released.to_s.ljust(6)}  #{rated.ljust(6)}  #{studio_display.name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
all_cast = Role.all
for cast in all_cast
  movie_id = cast["movie_id"]
  movie_name = Movie.find_by({"id" => movie_id})
  actor_id = cast["actor_id"]
  actor_name = Actor.find_by({"id" => actor_id})
  character = cast["character_name"]
  puts "#{movie_name.title.ljust(25)}   #{actor_name.name.ljust(22)}  #{character}"
end

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent Sam Feng"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!
agent_sam_feng = Agent.find_by({"name" => "Sam Feng"})
represented_by_sam = Actor.where({"agent_id" => agent_sam_feng["id"]})
for actor in represented_by_sam
  actor_name = actor["name"]
  puts "#{actor_name}"
end

