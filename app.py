#!/usr/bin/python3

import flask
import markdown as md
app = flask.Flask(__name__)


@app.route("/")
def index():
    return flask.render_template("index.html",
                                 txt=md.markdown(
                                    open("./md/home.md", "r").read()
                                    )
                                 )


@app.route("/av")
def av():
    return flask.render_template("av.html",
                                 txt=md.markdown(
                                     open("./md/av.md", "r").read()
                                 )
                                 )


@app.route("/about")
def about():
    return flask.render_template("about.html",
                                 txt=md.markdown(
                                     open("./md/about.md", "r").read()
                                    )
                                 )


@app.route("/contact")
def contact():
    return flask.render_template("contact.html",
                                 txt=md.markdown(
                                     open("./md/contact.md", "r").read()
                                    )
                                 )


@app.route("/robots.txt")
def bots():
    return flask.send_file("./static/robots.txt")


@app.route("/sitemap.xml")
def sitemap():
    return flask.send_file("./static/sitemap.xml")


@app.route("/<string:page>")
def error404(page):
    return flask.render_template("404.html")


if __name__ == "__main__":
    app.run(debug=True)
