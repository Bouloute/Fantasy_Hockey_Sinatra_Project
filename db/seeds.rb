draisaitl = Player.create(name: "Leon Draisaitl", role: "Skater", stats: "P: 110, G: 43, +/-: -7", team: "EDM", picture_path: "https://assets.nhle.com/mugs/nhl/20192020/EDM/8477934.png")
Player.create(name: "Connor McDavid", role: "Skater", stats: "P: 97, G: 34, +/-: -6", team: "EDM", picture_path: "https://assets.nhle.com/mugs/nhl/20192020/EDM/8478402.png")
pastrnak = Player.create(name: "David Pastrnak", role: "Skater", stats: "P: 95, G: 48, +/-: 21", team: "BOS", picture_path: "https://assets.nhle.com/mugs/nhl/20192020/BOS/8477956.png")
Player.create(name: "Tuukka Rask", role: "Goalie", stats: "SV%: .929, GAA: 2.12, GP: 41", team: "BOS", picture_path: "https://assets.nhle.com/mugs/nhl/20192020/BOS/8471695.png")
Player.create(name: "Anton Khudobin", role: "Goalie", stats: "SV%: .930, GAA: 2.22, GP: 30", team: "DAL", picture_path: "https://assets.nhle.com/mugs/nhl/20192020/DAL/8471418.png")
Player.create(name: "John Carlson", role: "Defensemen", stats: "P: 75, G: 15, +/-: 12", team: "WSH", picture_path: "https://assets.nhle.com/mugs/nhl/20192020/WSH/8474590.png")
Player.create(name: "Quinn Hughes", role: "Defensemen", stats: "P: 53, G: 8, +/-: -10", team: "VAN", picture_path: "https://assets.nhle.com/mugs/nhl/20192020/VAN/8480800.png")
Player.create(name: "Zach Werenski", role: "Defensemen", stats: "P: 41, G: 20, +/-: 9", team: "CBJ", picture_path: "https://assets.nhle.com/mugs/nhl/20192020/CBJ/8478460.png")



admin = User.create(username: "admin", email: "admin@admin", password: "admin")

my_team = Team.create(name: "My first Team", user_id: admin.id)
my_team.players.push(draisaitl)
my_team.players.push(pastrnak)

