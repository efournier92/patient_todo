# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Task.destroy_all

task1 = Task.create(description: "Start taking a prenatal vitamins.", week: 2, shouldRemind: false)
task2 = Task.create(description: "Talk to doctor about safe medications during pregnancy.", week: 2, shouldRemind: false)
task3 = Task.create(description: "Buy an at-home pregnancy test.", week: 3, shouldRemind: true)
task4 = Task.create(description: "Make an appointment to see doctor to confirm pregnancy.", week: 4, shouldRemind: true)
task5 = Task.create(description: "Buy a pregnancy book.", week: 5, shouldRemind: false)
task6 = Task.create(description: "Compile a list of questions for first doctor's appointment.", week: 7, shouldRemind: false)
task7 = Task.create(description: "Discuss recommended prenatal tests with the doctor.", week: 8, shouldRemind: true)
task8 = Task.create(description: "Get a first-trimester screening.", week: 11, shouldRemind: true)
task9 = Task.create(description: "Start sleeping on side.", week: 13, shouldRemind: false)
task10 = Task.create(description: "As doctor about the quad marker screen.", week: 15, shouldRemind: true)
task11 = Task.create(description: "Sign up for a childbirth class.", week: 17, shouldRemind: false)
task12 = Task.create(description: "Get mid-pregnancy ultrasound.", week: 18, shouldRemind: true)
task13 = Task.create(description: "Research the symptoms and risks of preeclampsia.", week: 20, shouldRemind: true)
task14 = Task.create(description: "Get tested for gestational diabetes.", week: 24, shouldRemind: true)
task15 = Task.create(description: "Start seeing doctor every two weeks.", week: 28, shouldRemind: true)
task16 = Task.create(description: "Eat foods rich in iron.", week: 31, shouldRemind: false)
task17 = Task.create(description: "Start seeing doctor weekly through delivery.", week: 32, shouldRemind: true)
task18 = Task.create(description: "Get tested for Group B strep (GBS).", week: 34, shouldRemind: true)
task19 = Task.create(description: "Do squats to help prepare for labor.", week: 40, shouldRemind: false)
task20 = Task.create(description: "Deliver baby.", week: 42, shouldRemind: true)
