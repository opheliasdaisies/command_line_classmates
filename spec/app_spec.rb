require "../app"

describe "#make_student" do
	it "should create new students with each having a name, a twitter, and a blog" do
		expect(make_students(["Ash", "Misty", "Brock"], ["@pikachupower", "@splashy", "@rox"], ["http://www.catchemall.com", "http://starmiefanclub.com", "http://rockyroad.com"])).to be_a_kind_of(Array)
	end
	it "should create new students with each having a name, a twitter, and a blog" do
		expect(make_students(["Ash", "Misty", "Brock"], ["@pikachupower", "@splashy", "@rox"], ["http://www.catchemall.com", "http://starmiefanclub.com", "http://rockyroad.com"]).length).to eq(3)
	end
end