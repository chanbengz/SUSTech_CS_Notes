from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def main():
    if request.method == 'GET':
        return render_template('main.html')
    if request.method == 'POST':
        user = request.form.get('user')
        password = request.form.get('password')
        res = f'User: {user}\nPassword: {password}'
        return res
    return 'Invalid Method'

if __name__ == '__main__':
    app.run('0.0.0.0', 8888, debug=True)
