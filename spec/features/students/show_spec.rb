require "rails_helper"

RSpec.describe "When I visit the show page" do
  it "can list all of a student's courses" do
    student_1 = Student.create(name: "Kathy", age: 26, house: "Ravenclaw")
    student_2 = Student.create(name: "Chandler", age: 27, house: "Slytherin")
    course_1 = Course.create(name: "Defense against the Dark Arts")
    course_2 = Course.create(name: "Herbology")
    course_3 = Course.create(name: "Potions")
    StudentCourse.create(student: student_1, course: course_1)
    StudentCourse.create(student: student_2, course: course_1)
    StudentCourse.create(student: student_1, course: course_2)
    StudentCourse.create(student: student_2, course: course_3)

    visit "/students/#{student_1.id}"

    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_2.name)

    visit "/students/#{student_2.id}"

    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_3.name)

  end
end
