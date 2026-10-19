# Remove the previous sample set if this seed file has already been run.
previous_seed_titles = [
  "Spirited Away", "The Grand Budapest Hotel", "Moonlight",
  "Everything Everywhere All at Once", "Paddington 2"
]
Movie.where(title: previous_seed_titles).delete_all

# Safe to run repeatedly: existing titles are updated rather than duplicated.
movies = [
  { title: "Pirates of the Caribbean", rating: "PG-13", release_date: "2003-06-28", description: "A quick-witted pirate captain races to recover a cursed ship and its treasure." },
  { title: "Avatar", rating: "PG-13", release_date: "2009-12-18", description: "A former Marine becomes part of the Na'vi world on the moon Pandora." },
  { title: "Harry Potter", rating: "PG", release_date: "2001-11-16", description: "A young wizard begins his education at Hogwarts School of Witchcraft and Wizardry." },
  { title: "My Neighbor Totoro", rating: "G", release_date: "1988-04-16", description: "Two sisters discover a gentle forest spirit in the Japanese countryside." },
  { title: "Green Book", rating: "PG-13", release_date: "2018-11-16", description: "A pianist and his driver form an unlikely friendship on a concert tour." },
  { title: "Parasite", rating: "R", release_date: "2019-05-30", description: "A struggling family becomes entangled with a wealthy household." },
  { title: "Nomadland", rating: "R", release_date: "2021-02-19", description: "A woman travels the American West after losing her home and job." },
  { title: "CODA", rating: "PG-13", release_date: "2021-08-13", description: "A hearing teenager navigates family, music, and a future of her own." }
]

movies.each do |attributes|
  movie = Movie.find_or_initialize_by(title: attributes[:title])
  movie.update!(attributes)
end
