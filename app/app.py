from deps.bottle import route, run, template

@route("/")
def index():
    return template("home_tem")


run(port="80", host="0.0.0.0")