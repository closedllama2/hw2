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

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all


# Generate models and tables, according to the domain model.
# TODO!

# In the terminal, run: rails generate model ______
# #in terminal, execute the migration file
# rails db:migrate


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Insert data into Studio table
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

#Insert data into Actor table
c_bale = Actor.new
c_bale["name"] = "Christian Bale"
c_bale.save

m_caine = Actor.new
m_caine["name"] = "Michael Caine"
m_caine.save

l_neeson = Actor.new
l_neeson["name"] = "Liam Neeson"
l_neeson.save

k_holmes = Actor.new
k_holmes["name"] = "Katie Holmes"
k_holmes.save

g_oldman = Actor.new
g_oldman["name"] = "Gary Oldman"
g_oldman.save

h_ledger = Actor.new
h_ledger["name"] = "Heath Ledger"
h_ledger.save

a_eckhart = Actor.new
a_eckhart["name"] = "Aaron Eckhart"
a_eckhart.save

m_gyllenhaal = Actor.new
m_gyllenhaal["name"] = "Maggie Gyllenhaal"
m_gyllenhaal.save

t_hardy = Actor.new
t_hardy["name"] = "Tom Hardy"
t_hardy.save

j_levitt = Actor.new
j_levitt["name"] = "Joseph Gordon-Levitt"
j_levitt.save

a_hathaway = Actor.new
a_hathaway["name"] = "Anne Hathaway"
a_hathaway.save

#Insert data into Movie table

bb = Movie.new
bb["title"] = "Batman Begins"
bb["year_released"] = 2005
bb["rated"] = "PG-13"
bb["studio_id"] = new_studio["id"]
bb.save

tdk = Movie.new
tdk["title"] = "The Dark Knight"
tdk["year_released"] = 2008
tdk["rated"] = "PG-13"
tdk["studio_id"] = new_studio["id"]
tdk.save

tdkr = Movie.new
tdkr["title"] = "The Dark Knight Rises"
tdkr["year_released"] = 2012
tdkr["rated"] = "PG-13"
tdkr["studio_id"] = new_studio["id"]
tdkr.save

#Insert data into Role table

#Batman Begins roles
bw_bb = Role.new
bw_bb["movie_id"] = bb["id"]
bw_bb["actor_id"] = c_bale["id"]
bw_bb["charachter_name"] = "Bruce Wayne"
bw_bb.save

bw_bb = Role.new
bw_bb["movie_id"] = bb["id"]
bw_bb["actor_id"] = m_caine["id"]
bw_bb["charachter_name"] = "Alfred"
bw_bb.save

bw_bb = Role.new
bw_bb["movie_id"] = bb["id"]
bw_bb["actor_id"] = l_neeson["id"]
bw_bb["charachter_name"] = "Ra's Al Ghul"
bw_bb.save

bw_bb = Role.new
bw_bb["movie_id"] = bb["id"]
bw_bb["actor_id"] = m_gyllenhaal["id"]
bw_bb["charachter_name"] = "Rachel Dawes"
bw_bb.save

bw_bb = Role.new
bw_bb["movie_id"] = bb["id"]
bw_bb["actor_id"] = g_oldman["id"]
bw_bb["charachter_name"] = "Commissioner Gordon"
bw_bb.save


#The Dark Knight roles

bw_tdk = Role.new
bw_tdk["movie_id"] = tdk["id"]
bw_tdk["actor_id"] = c_bale["id"]
bw_tdk["charachter_name"] = "Bruce Wayne"
bw_tdk.save

bw_tdk = Role.new
bw_tdk["movie_id"] = tdk["id"]
bw_tdk["actor_id"] = h_ledger["id"]
bw_tdk["charachter_name"] = "Joker"
bw_tdk.save

bw_tdk = Role.new
bw_tdk["movie_id"] = tdk["id"]
bw_tdk["actor_id"] = a_eckhart["id"]
bw_tdk["charachter_name"] = "Harvey Dent"
bw_tdk.save

bw_tdk = Role.new
bw_tdk["movie_id"] = tdk["id"]
bw_tdk["actor_id"] = m_caine["id"]
bw_tdk["charachter_name"] = "Alfred"
bw_tdk.save

bw_tdk = Role.new
bw_tdk["movie_id"] = tdk["id"]
bw_tdk["actor_id"] = m_gyllenhaal["id"]
bw_tdk["charachter_name"] = "Rachel Dawes"
bw_tdk.save

#The Dark Knight Rises roles

bw_tdkr = Role.new
bw_tdkr["movie_id"] = tdkr["id"]
bw_tdkr["actor_id"] = c_bale["id"]
bw_tdkr["charachter_name"] = "Bruce Wayne"
bw_tdkr.save

bw_tdkr = Role.new
bw_tdkr["movie_id"] = tdkr["id"]
bw_tdkr["actor_id"] = g_oldman["id"]
bw_tdkr["charachter_name"] = "Commissioner Gordon"
bw_tdkr.save

bw_tdkr = Role.new
bw_tdkr["movie_id"] = tdkr["id"]
bw_tdkr["actor_id"] = t_hardy["id"]
bw_tdkr["charachter_name"] = "Bane"
bw_tdkr.save

bw_tdkr = Role.new
bw_tdkr["movie_id"] = tdkr["id"]
bw_tdkr["actor_id"] = j_levitt["id"]
bw_tdkr["charachter_name"] = "John Blake"
bw_tdkr.save

bw_tdkr = Role.new
bw_tdkr["movie_id"] = tdkr["id"]
bw_tdkr["actor_id"] = a_hathaway["id"]
bw_tdkr["charachter_name"] = "Selina Kyle"
bw_tdkr.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# loop through movies
all_movies = Movie.all
studio_name = Studio.find_by({ "name" => "Warner Bros." })

puts "%-30s %-10s %-10s %s" % ["Title", "Year", "Rating", "Studio"]
puts "-" * 60

for movie in all_movies
    title = movie["title"]
    year = movie["year_released"]
    rating = movie["rated"]
    studio = studio_name["name"]
    puts "%-30s %-10s %-10s %s" % [title, year, rating, studio]
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# loop through roles

puts "%-30s %-20s %s" % ["Title", "Actor", "Character"]
puts "-" * 60

for movie in all_movies
  roles = Role.where({ "movie_id" => movie["id"] })
  for role in roles
    actor = Actor.find_by({ "id" => role["actor_id"] })
    title = movie["title"]
    name = actor["name"]
    charachter = role["charachter_name"]
    puts "%-30s %-20s %s" % [title, name, charachter]
  end
end


