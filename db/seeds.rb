User.create!(email: "admin@admin.com", password: "123123", admin: true)
User.create!(email: "michal@michal.com", password: "123123", admin: false)
User.create!(email: "bruno@bruno.com", password: "123123", admin: false)


books = Book.create([
  {
    title: 'Journey to the Center of the Earth',
    quantity: 30,
    price: 10900,
    published: true
  },
  {
    title: 'From the Earth to the Moon',
    price: 6300,
    quantity: 40,
    published: false
  },
  {
    title: 'Imaginary trip',
    price: 3600,
    quantity: 60,
    published: true
  },
])

authors = Author.create([
  {
    first_name: 'Jules',
    last_name: 'Verne'
  },
  {
    first_name: 'Dick',
    last_name: 'Pick',
  },
  {
    first_name: 'Rick',
    last_name: 'Pickle'
  },
])

AuthorsBook.create([
  {
    book: books.first,
    author: authors.first
  },
  {
    book: books[1],
    author: authors.first
  },
  {
    book: books[2],
    author: authors[1]
  },
  {
    book: books[2],
    author: authors[2]
  },
])