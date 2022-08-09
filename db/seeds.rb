# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Task.destroy_all

task1 = Task.create(description: "Coding Interview",    time: "2022-08-09 @ 1130", shouldRemind: true)
task2 = Task.create(description: "Dentist Appointment", time: "2022-08-09 @ 1800", shouldRemind: true)
