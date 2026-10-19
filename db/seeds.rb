# Remove the previous sample set if this seed file has already been run.
previous_seed_titles = [
  "My Neighbor Totoro", "Green Book", "Parasite", "Nomadland", "CODA",
  "Spirited Away", "The Grand Budapest Hotel", "Moonlight",
  "Everything Everywhere All at Once", "Paddington 2"
]
Movie.where(title: previous_seed_titles).delete_all

# Safe to run repeatedly: existing titles are updated rather than duplicated.
movies = [
  { title: "Pirates of the Caribbean", rating: "PG-13", release_date: "2003-06-28", description: "A quick-witted pirate captain races to recover a cursed ship and its treasure." },
  { title: "Avatar", rating: "PG-13", release_date: "2009-12-18", description: "A former Marine becomes part of the Na'vi world on the moon Pandora." },
  { title: "Harry Potter", rating: "PG", release_date: "2001-11-16", description: "A young wizard begins his education at Hogwarts School of Witchcraft and Wizardry." }
]

movies.each do |attributes|
  movie = Movie.find_or_initialize_by(title: attributes[:title])
  movie.update!(attributes)
end
