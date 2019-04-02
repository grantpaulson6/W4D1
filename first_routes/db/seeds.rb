# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: 'Leo DaVinci')
User.create!(username: 'Emmanual Leutz')
User.create!(username: 'smurphf')
User.create!(username: 'Vanessa')

Artwork.create!(title: "Mona Lisa", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/687px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg", artist_id: 1)
Artwork.create!(title: "Washington Crossing the Potomac", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Washington_Crossing_the_Delaware_by_Emanuel_Leutze%2C_MMA-NYC%2C_1851.jpg/300px-Washington_Crossing_the_Delaware_by_Emanuel_Leutze%2C_MMA-NYC%2C_1851.jpg", artist_id: 2)
 
ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
ArtworkShare.create!(artwork_id: 2, viewer_id: 3)
ArtworkShare.create!(artwork_id: 2, viewer_id: 1)
