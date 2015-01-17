import web

urls = (
    '/', 'index',
    '/heroes', 'heroes_page',
    '/items', 'items_page',
    '/teams', 'teams_page',
    '/guides', 'guides_page',
    '/about', 'about_page'

)

render = web.template.render('templates/')

class index:
    def GET(self):
        return render.index()

class heroes_page:
    def GET(self):
        return render.heroes()

class items_page:
    def GET(self):
        return render.items()

class teams_page:
    def GET(self):
        return render.teams()

class guides_page:
    def GET(self):
        return render.guides()

class about_page:
    def GET(self):
        return render.about()
"""
class book_list:
    def GET(self):
        return render.books(books)


class book:
    def GET(self, book_id):
        print(type(book_id))
        book = books[int(book_id)]
        return render.book(book)

"""
if __name__ == "__main__":
    app = web.application(urls, globals())
    web.httpserver.runsimple(app.wsgifunc(), ("127.0.0.1", 1234))