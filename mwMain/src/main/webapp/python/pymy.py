from flask import Flask

# 웹서버 생성 
app = Flask(__name__)
print(app)
print(__name__)

from flask_cors import CORS
CORS(app)

#url
@app.route('/codi')
def productName():
    return jsonString


if __name__ == '__main__':

