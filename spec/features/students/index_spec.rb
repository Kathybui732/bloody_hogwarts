require "rails_helper"

RSpec.describe "When I visit the student index page" do
  before :each do
    @student_1 = Student.create(name: "Kathy", age: 26, house: "Ravenclaw")
    @student_2 = Student.create(name: "Chandler", age: 27, house: "Slytherin")
  end

  it "can diplay a list of all student" do

    visit "/students"

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_1.age)
    expect(page).to have_content(@student_1.house)

    expect(page).to have_content(@student_2.name)
    expect(page).to have_content(@student_2.age)
    expect(page).to have_content(@student_2.house)
  end

  it "displays the average student age" do

    visit "/students"

    expect(page).to have_content(26.5)
  end

  it "alphabetizes all the students by name" do

    visit "/students"

    expect(page).to have_content(@student_2.name)
    expect(page).to have_content(@student_1.name)
  end
end
