require "rails_helper"

RSpec.describe "When I visit the course index page" do

  before :each do
    student_1 = Student.create(name: "Kathy", age: 26, house: "Ravenclaw")
    student_2 = Student.create(name: "Chandler", age: 27, house: "Slytherin")
    course_1 = Course.create(name: "Defense against the Dark Arts")
    course_2 = Course.create(name: "Herbology")
    course_3 = Course.create(name: "Potions")
    StudentCourse.create(student: student_1, course: course_1)
    StudentCourse.create(student: student_2, course: course_1)
    StudentCourse.create(student: student_1, course: course_2)
    StudentCourse.create(student: student_2, course: course_3)
  end

  it "displays a list of courses and the number of students enrolled" do

    visit "/courses"

    expect(page).to have_content("#{course_1.name}: #{course_1.students.count}")
    expect(page).to have_content("#{course_2.name}: #{course_2.students.count}")
    expect(page).to have_content("#{course_3.name}: #{course_3.students.count}")
  end



end
