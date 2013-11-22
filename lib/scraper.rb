# require the libraries that we need
require "open-uri"	#open the file on the internet
require "nokogiri"	#line10 takes the file and translates it so we can use it in ruby
					#line14 looks through the html

class Scraper
	attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	def get_students_names
		names = html.search("h3").map { |h3| h3.text }
	end

	def get_students_twitter
		all_first_children = html.search(".social li:first-child").text
		split_twitter = all_first_children.strip.split("\n                \n              \n                \n                  \n                  ")
	end

	def get_students_blogs
		html.search(".back").collect do |back_class|
			if back_class.search(".blog").text == "Blog"
				back_class.search(".blog")[0]["href"]
			else
				"none"
			end
		end
	end

end

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com")
puts my_scraper.get_students_blogs.inspect
#puts my_scraper.get_students_names.inspect