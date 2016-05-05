User.destroy_all

User.create([
  {
    first_name: "Scott",
    last_name: "Madrid",
    email:  "samadrid92@gamil.com",
    current_city: "Los Angeles",
    profile_pic: "http://i.telegraph.co.uk/multimedia/archive/03235/potd-husky_3235255k.jpg"
  },
  {
    first_name: "Justin",
    last_name: "Tam",
    email: "justin@hotmail.com",
    current_city: "San Francisco",
    profile_pic: "http://i.telegraph.co.uk/multimedia/archive/03235/potd-husky_3235255k.jpg"
  }
])
