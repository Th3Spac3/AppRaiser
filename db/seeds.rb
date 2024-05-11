# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Theme.delete_all
Theme.reset_pk_sequence
Theme.create([
               {name: "Рубин"},
               {name: "Топаз"},
               {name: "Алмаз"},
               {name: "Нефрит"},
             ])

Image.delete_all
Image.reset_pk_sequence
Image.create([
               {name: "i1", file: "pictures/i1.png", average_value: 0, theme_id: 1},
               {name: "i2", file: "pictures/i2.png", average_value: 0, theme_id: 1},
               {name: "i3", file: "pictures/i3.png", average_value: 0, theme_id: 1},
               {name: "i4", file: "pictures/i4.png", average_value: 0, theme_id: 1},
               {name: "i5", file: "pictures/i5.png", average_value: 0, theme_id: 1},
               {name: "i6", file: "pictures/i6.png", average_value: 0, theme_id: 3},
               {name: "i7", file: "pictures/i7.png", average_value: 0, theme_id: 3},
               {name: "i8", file: "pictures/i8.png", average_value: 0, theme_id: 3},
               {name: "i9", file: "pictures/i9.png", average_value: 0, theme_id: 2},
               {name: "i10", file: "pictures/i10.png", average_value: 0, theme_id: 2},
               {name: "i11", file: "pictures/i11.png", average_value: 0, theme_id: 2},
               {name: "i12", file: "pictures/i12.png", average_value: 0, theme_id: 2},
               {name: "i13", file: "pictures/i13.png", average_value: 0, theme_id: 4},
               {name: "i14", file: "pictures/i14.png", average_value: 0, theme_id: 4},
               {name: "i15", file: "pictures/i15.png", average_value: 0, theme_id: 4},
             ])