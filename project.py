import web

urls = (
    '/', 'index',
    '/heroes', 'heroes_page',
    '/items', 'items_page',
    '/teams', 'teams_page',
    '/guides', 'guides_page',
    '/about', 'about_page',
    '/hero/(.*)/(.*)', 'hero_page',
    '/about', 'about_page'

)

varglobals = {
   'menu' : [
        ("/", "Home"),
        ("/heroes", "Heroes"),
        ("/items", "Items"),
        ("/teams", "Teams"),
        ("/guides", "Guides"),
        ("/about", "About")
    ]
}

db = web.database(dbn='mysql', user='root', pw='', host="127.0.0.1", port=3306, db='ceng3507')
render = web.template.render('templates/', base='base', globals=varglobals)

class index:
    def GET(self):
        data= []
        announcements = list(db.query("SELECT * FROM announcements"))
        for announcement in announcements:
            announcementdata = {}
            announcementdata['id'] = announcement.announcement_id
            announcementdata['headline'] = announcement.headline
            announcementdata['image'] = announcement.image
            announcementdata['content'] = announcement.content
            data.append(announcementdata)
        return render.index(data)

class heroes_page:
    def GET(self):
        data= []
        heroes = list(db.query("SELECT * FROM heroes"))
        for row in heroes:
            herodata = {}
            herodata['id'] = row.hero_id
            herodata['name'] = row.name
            herodata['image'] = row.image
            herodata['primaryAttribute'] = row.primary_attribute
            herodata['roles'] = row.roles
            herodata['attackType'] = row.attack_type
            herodata['faction'] = row.faction
            data.append(herodata)
        return render.heroes(data)
class items_page:
    def GET(self):
        data= []
        items = list(db.query("SELECT * FROM items"))
        for row in items:
            itemdata = {}
            itemdata['id'] = row.id
            itemdata['name'] = row.name
            itemdata['image'] = row.image
            itemdata['first'] = row.first_description
            itemdata['second'] = row.second_description

            data.append(itemdata)
        return render.items(data)

class teams_page:
    def GET(self):
        data = []
        teams = list(db.query("SELECT * FROM teams"))
        for team in teams:
            teamdata = {}
            teamdata['id'] = team.id
            teamdata['name'] = team.name
            teamdata['content'] = team.content
            teamdata['image'] = team.image
            teamplayers = db.query("SELECT * FROM teams_players AS tp, players AS p WHERE tp.pid = p.id and tp.tid = $teamid", vars={"teamid": team.id})
            teamdata['players'] = [ {"name": p.name, "image": p.image} for p in teamplayers ]
            data.append(teamdata)
        return render.teams(data)

class guides_page:
    def GET(self):
        return render.guides()

class about_page:
    def GET(self):
        return render.about()

class hero_page:
    def GET(self, hero_name, hero_id):

        hid=int(hero_id)
        hero = db.select("heroes", where="hero_id=$hid", vars=locals())[0]

        data = []
        abilities = list(db.query("SELECT * FROM abilities"))

        for table in abilities:
            abilitydata = {}
            abilitydata['id']=table.ability_id
            abilitydata['name']=table.name
            abilitydata['description']=table.description
            abilitydata['image']=table.image
            abilitydata['manacost']=table.manacost
            abilitydata['cooldown']=table.cooldown
            heroability = db.query("SELECT * FROM heroes_abilities AS ha, abilities AS a WHERE ha.aid = a.ability_id and ha.hid = $heroid", vars={"heroid": hid})
            abilitydata['abilities'] = [ {"name": a.name, "image": a.image, "description":a.description, "manacost":a.manacost, "cooldown":a.cooldown} for a in heroability]
            data.append(abilitydata)

        from urllib import quote_plus
        return render.hero(hero, quote_plus, data)

if __name__ == "__main__":
    app = web.application(urls, globals())
    web.httpserver.runsimple(app.wsgifunc(), ("127.0.0.1", 1234))
