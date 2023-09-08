# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

csv_text_regiones = File.read(Rails.root.join("db", "regiones.csv"))

csv_regiones = CSV.parse(csv_text_regiones, :headers => true, :encoding => "UTF-8")
csv_regiones.each do |row|
  t = Region.new
  t.id = row["id"]
  t.name = row["name"]
  t.ordinal = row["ordinal"]
  
  t.save
end

csv_text_provinces = File.read(Rails.root.join("db", "provincias.csv"))
csv_provinces = CSV.parse(csv_text_provinces, :headers => true, :encoding => "UTF-8")
csv_provinces.each do |row|
  t = Province.new
  t.id = row["id"]
  t.name = row["name"]
  t.region_id = row["region_id"]

  t.save
end

csv_text_comunes = File.read(Rails.root.join("db", "comunas.csv"))
csv_comunas = CSV.parse(csv_text_comunes, :headers => true, :encoding => "UTF-8")
csv_comunas.each do |row|
  t = Comune.new
  t.id = row["id"]
  t.name = row["name"]
  t.province_id = row["province_id"]
  t.region_id = row["region_id"]

  t.save
end