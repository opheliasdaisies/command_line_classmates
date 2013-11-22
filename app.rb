require "./lib/scraper"
require "./lib/student"

student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

names = student_scraper.get_students_names
twitters = student_scraper.get_students_twitter
blogs = student_scraper.get_students_blogs

# def make_students(name, twitter, blog)
# 	num = name.length
# 	students = []
# 	num.times do |i|
# 		students << Student.new(name[i], twitter[i], blog[i])
# 	end
# end

students = []
28.times do |i|
	students << Student.new(names[i], twitters[i], blogs[i])
end

p students
