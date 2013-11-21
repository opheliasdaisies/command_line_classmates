require ("../lib/student")

describe Student, "#name" do
	it "should return the name of the student" do
		expect(Student.new("Mary", "@mary","http://mary.blog.com").name).to eq("Mary")
	end
end

describe Student, "#twitter" do
	it "should return the twitter handle of the student" do
		expect(Student.new("Joe", "@coffeejoe", "http://coffeerox.com").twitter).to eq("@coffeejoe")
	end
end

describe Student, "#blog" do
	it "should return the blog url of the student" do
		expect(Student.new("Lana", "@lalalady", "http://lala.wordpress.com").blog).to eq("http://lala.wordpress.com")
	end
end