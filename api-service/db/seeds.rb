# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Category.create([
  {
    name: "Domaci pisci"
  },
  {
    name: "Filozofija"
  },
  {
    name: "Klasici"
  },
  {
    name: "Istorija"
  },
  {
    name: "Poezija"
  },
  {
    name: "Psihologija"
  },
  {
    name: "Trileri"
  },
  {
    name: "Drama"
  },
])

Book.create([
  {
    name: "Slucaj Vinca",
    description: "Prvi roman o srpskom Cernobilju. Vinca, 15. oktobar 1958. U poslepodnevnim satima oglasio se centralni alarm za detekciju povisenog radioaktivnog zracenja",
    price: 799.00,
    category_id: 1
  },
  {
    name: "Knjiga o Titu",
    description: "Nad ovim rukopisom 18. maja 2014. godine preminuo je Dobrica Cosic, jedan od najznacajnijih ljudi u istoriji Srbije i pisac cije je pero iznedrilo pripovest o najvaznijoj porodici srpske knjizevnosti. Knjiga o Titu vaskrsava i ozivljava jednu epohu koju su, sasvim sigurno, obelezila dva coveka - predsednik i pisac, Josip Broz i Dobrica Cosic.",
    price: 1499.00,
    category_id: 1
  },
  {
    name: "Pitajte filozofa",
    description: "Pitajte filozofa je izuzetna knjiga u kojoj je obradeno mnostvo filozofskih pitanja, koja su slucajni prolaznici postavljali filozofima, od onih sustinskih pitanja klasicne filozofije",
    price: 629.10,
    category_id: 2
  },
  {
    name: "Majstor i Margarita",
    description: "Tridesetih godina proslog veka u Moskvu stize davo. Ubrzo po dolasku, ovaj neocekivani posetilac sa svojim pomocnicima, medu kojima su i jedan macor koji govori i prelepa vestica, unosi pometnju kod Moskovljana koji odbijaju da veruju kako u Boga tako i u davola.",
    price: 999.0,
    category_id: 3
  },
  {
    name: "Prica o Rusiji",
    description: "Veliki poznavalac Rusije neodoljivo govori o pricama koje su oblikovale proslost zemlje - i o tome sta nam kazu o njenoj sadasnjosti.",
    price: 1199.0,
    category_id: 4
  },
  {
    name: "Zmajeva riznica",
    description: "Stihovi cika Jove najbolji su prvi koraci u otkrivanju sveta, jer deca kroz pesme otkrivaju sta je dobro i lepo. Zabavna i poucna, leprsava i svevremena, poezija Jovana Jovanovica neizbezni je dodatak svacijem odrastanju i sagledavanju lepote srpskog jezika.",
    price: 1099.0,
    category_id: 5
  },
  {
    name: "Zajednicko razmisljanje",
    description: "Zivimo u VUCA svetu. Ako nas je vreme pandemije necemu naucilo, to je da je izvesno samo da nista nije izvesno. VUCA je akronim nastao devedesetih godina u americkoj vojsci kao ilustracija promenjenih okolnosti u okruzenju.",
    price: 809.10,
    category_id: 6
  },
  {
    name: "Nocna skola",
    description: "Medutim, Akademija Simerija nije obicna skola. Kompjuteri i mobilni telefoni su zabranjeni. Ucenici su mesavina nadarenih, surovih i privilegovanih tinejdzera. Oni - a mozda i neki profesori - kriju tajnu.",
    price: 1199.0,
    category_id: 7
  },
  {
    name: "Poslednji sati",
    description: "Na prvi pogled, Katarina Safran je olicenje uspeha. Njeno ime je sinonim za vestinu, strucnost i neumornu posvecenost medicinskom pozivu i kardiohirurgiji.",
    price: 999.0,
    category_id: 8
  }
])

Author.create([
  {
    name: "Goran Milasinovic"
  },
  {
    name: "Dobrica CosiC"
  },
  {
    name: "Ijan Olasov"
  },
  {
    name: "Mihail Bulgakov"
  },
  {
    name: "Orlando Fajdzis"
  },
  {
    name: "Jovan Jovanovic Zmaj"
  },
  {
    name: "Karolina Volf"
  },
  {
    name: "K. Dz. Doerti"
  },
  {
    name: "Jelena Bacic Alimpic"
  },
])

BookAuthor.create([
  {
    book_id: 1,
    author_id: 1,
  },
  {
    book_id: 2,
    author_id: 2,
  },
  {
    book_id: 3,
    author_id: 3,
  },
  {
    book_id: 4,
    author_id: 4,
  },
  {
    book_id: 5,
    author_id: 5,
  },
  {
    book_id: 6,
    author_id: 6,
  },
  {
    book_id: 7,
    author_id: 7,
  },
  {
    book_id: 8,
    author_id: 8,
  },
  {
    book_id: 9,
    author_id: 9,
  },
])
Order.create([
  {
    status: "Processing",
    ordered_at: Time.new(2024, 1, 18, 10, 30, 0),
    scheduled_at: Time.new(2024, 1, 20, 14, 0, 0),
    address: "123 Main St",
    phone: "555-1234",
    full_name: "Igor Ciganovic"
  },
  {
    status: "Processing",
    ordered_at: Time.new(2024, 1, 18, 11, 45, 0),
    scheduled_at: Time.new(2024, 1, 21, 12, 30, 0),
    address: "456 Oak St",
    phone: "555-5678",
    full_name: "Hamza Muric"
  },
  {
    status: "Shipped",
    ordered_at: Time.new(2024, 1, 19, 9, 15, 0),
    scheduled_at: Time.new(2024, 1, 22, 16, 0, 0),
    address: "789 Pine St",
    phone: "555-4321",
    full_name: "Milan Jovanovic"
  },
  {
    status: "Delivered",
    ordered_at: Time.new(2024, 1, 20, 8, 0, 0),
    scheduled_at: Time.new(2024, 1, 23, 10, 45, 0),
    address: "101 Cedar St",
    phone: "555-8765",
    full_name: "Lazar Vuksanovic"
  },
  {
    status: "Cancelled",
    ordered_at: Time.new(2024, 1, 21, 13, 30, 0),
    scheduled_at: Time.new(2024, 1, 24, 15, 15, 0),
    address: "202 Elm St",
    phone: "555-9876",
    full_name: "Mehmedalija Karisik"
  }
])
OrderItem.create([
  {
    quantity: 3,
    price_per_unit: 629.1,
    book_id: 3,
    order_id: 1
  },
  {
    quantity: 1,
    price_per_unit: 999.0,
    book_id: 4,
    order_id: 1
  },
  {
    quantity: 3,
    price_per_unit: 1500.0,
    book_id: 2,
    order_id: 2
  },
  {
    quantity: 2,
    price_per_unit: 1199.0,
    book_id: 5,
    order_id: 3
  },
  {
    quantity: 1,
    price_per_unit: 1099.0,
    book_id: 6,
    order_id: 4
  },
  {
    quantity: 1,
    price_per_unit: 1199.0,
    book_id: 8,
    order_id: 5
  },
])
