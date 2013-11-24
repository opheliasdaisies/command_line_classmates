require "./lib/scraper"
require "./lib/student"
require "launchy"

student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

names = student_scraper.get_students_names
twitters = student_scraper.get_students_twitter
blogs = student_scraper.get_students_blogs

def make_students(name, twitter, blog)
	num = name.length
	students = []
	num.times do |i|
		students << Student.new(name[i], twitter[i], blog[i])
	end
	students
end

def list_students(students)
	puts "Would you like a list of all students? Yes or no?"
	list = gets.chomp.downcase
	if list == "yes"
		students.each do |student|
			puts student.name
		end
	elsif list == "no"
		puts "Okay, then let's move on."
	else
		puts "I didn't understand that."
		list_students(students)
	end
end

def lookup(students)
	puts "Which student would you like to look up? Please give their first and last name."
	student_name = gets.chomp
	selection = []
	students.each do |person|
		if student_name.downcase == person.name.downcase
			puts "You have selected #{person.name}."
			selection << person
		end
	end
	if selection.length == 0
		puts "Sorry, I did not recognize that name."
		lookup(students)
	else
		selection[0]
	end
end

def which_thing(person)
	puts "Would you like to launch #{person.name}'s twitter or blog?"
	to_launch = gets.chomp.downcase
	if to_launch == "twitter"
		launch_twitter(person)
	elsif to_launch == "blog"
		#launch blog
	else
		puts "I did not understand your response."
		which_thing(person)
	end
end

def launch_twitter(person)
	if person.twitter == "none"
		puts "Sorry, #{person.name} does not have a twitter account listed."
	else
		twitter_handle = person.twitter[1..person.twitter.length]
		Launchy.open("http://twitter.com/#{twitter_handle}")
	end
end

def launch_blog(person)

end


students = make_students(names, twitters, blogs)
list_students(students)
selection = lookup(students)
which_thing(selection)