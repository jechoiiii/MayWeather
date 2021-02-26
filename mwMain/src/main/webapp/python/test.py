import sys
import os

import pymysql
import base64
import requests
import pandas as pd
import json

file_path = "./locationXY.json"
json_data = {}
with open(file_path, "r") as json_file:
    json_data = json.load(json_file)

# DB info

project_db = pymysql.connect(
    user='admin',
    passwd='awsje0914',
    host='openproject.cvlxlk5s1yan.ap-northeast-2.rds.amazonaws.com',
    db='open',
    charset='utf8'
)

cursor = project_db.cursor(pymysql.cursors.DictCursor)

sql = 'select * from location;'
cursor.execute(sql)
result = cursor.fetchall()
print(result)

