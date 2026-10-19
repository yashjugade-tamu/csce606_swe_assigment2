# Safe to run repeatedly: existing titles are updated rather than duplicated.
movies = [
  { title: "My Neighbor Totoro", rating: "G", release_date: "1988-04-16", description: "Two sisters discover a gentle forest spirit in the Japanese countryside." },
  { title: "Green Book", rating: "PG-13", release_date: "2018-11-16", description: "A pianist and his driver form an unlikely friendship on a concert tour." },
  { title: "Parasite", rating: "R", release_date: "2019-05-30", description: "A struggling family becomes entangled with a wealthy household." },
  { title: "Nomadland", rating: "R", release_date: "2021-02-19", description: "A woman travels the American West after losing her home and job." },
  { title: "CODA", rating: "PG-13", release_date: "2021-08-13", description: "A hearing teenager navigates family, music, and a future of her own." },
  { title: "Spirited Away", rating: "PG", release_date: "2001-07-20", description: "A young girl finds courage in a mysterious world of spirits." },
  { title: "The Grand Budapest Hotel", rating: "R", release_date: "2014-03-28", description: "A concierge and lobby boy race to protect a priceless painting." },
  { title: "Moonlight", rating: "R", release_date: "2016-10-21", description: "Three chapters trace a young man's search for identity and connection." },
  { title: "Everything Everywhere All at Once", rating: "R", release_date: "2022-03-25", description: "An overwhelmed laundromat owner discovers the multiverse depends on her." },
  { title: "Paddington 2", rating: "PG", release_date: "2017-11-10", description: "Paddington Bear tries to clear his name and find a stolen present." }
]

movies.each do |attributes|
  movie = Movie.find_or_initialize_by(title: attributes[:title])
  movie.update!(attributes)
end
