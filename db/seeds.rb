# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Task.destroy_all

task1 = Task.create(description: "Start taking a prenatal vitamins.", time: "Week 1", shouldRemind: false)
task2 = Task.create(description: "Talk to doctor about safe medications during pregnancy.", time: "Week 2", shouldRemind: false)
task3 = Task.create(description: "Buy an at-home pregnancy test.", time: "Week 3", shouldRemind: true)
task4 = Task.create(description: "Make an appointment to see doctor to confirm pregnancy.", time: "Week 4", shouldRemind: true)
task5 = Task.create(description: "Buy a pregnancy book.", time: "Week 5", shouldRemind: false)
task6 = Task.create(description: "Compile a list of questions for first doctor's appointment.", time: "Week 7", shouldRemind: false)
task7 = Task.create(description: "Discuss recommended prenatal tests with the doctor.", time: "Week 8", shouldRemind: true)
task8 = Task.create(description: "Get a first-trimester screening.", time: "Week 11", shouldRemind: true)
task9 = Task.create(description: "Start sleeping on side.", time: "Week 13", shouldRemind: false)
task10 = Task.create(description: "As doctor about the quad marker screen.", time: "Week 15", shouldRemind: true)
task11 = Task.create(description: "Sign up for a childbirth class.", time: "Week 17", shouldRemind: false)
task12 = Task.create(description: "Get mid-pregnancy ultrasound.", time: "Week 18", shouldRemind: true)
task13 = Task.create(description: "Research the symptoms and risks of preeclampsia.", time: "Week 20", shouldRemind: true)
task14 = Task.create(description: "Get tested for gestational diabetes.", time: "Week 24", shouldRemind: true)
task15 = Task.create(description: "Start seeing doctor every two weeks.", time: "Week 28", shouldRemind: true)
task16 = Task.create(description: "Eat foods rich in iron.", time: "Week 31", shouldRemind: false)
task17 = Task.create(description: "Start seeing doctor weekly through delivery.", time: "Week 32", shouldRemind: true)
task18 = Task.create(description: "Get tested for Group B strep (GBS).", time: "Week 34", shouldRemind: true)
task19 = Task.create(description: "Do squats to help prepare for labor.", time: "Week 42", shouldRemind: false)
task20 = Task.create(description: "Deliver baby.", time: "Week 42", shouldRemind: true)
