import sys
import os

import pymysql
import base64
import requests
import pandas as pd
import json

# 기상청 동네코드 자료 DB location 테이블에 입력

file_path = "./locationXY.json"
json_data1 = {}
with open(file_path, "r") as json_file:
    json_data1 = json.load(json_file)


# DB info
project_db = pymysql.connect(
    user='admin',
    passwd='awsje0914',
    host='openproject.cvlxlk5s1yan.ap-northeast-2.rds.amazonaws.com',
    db='open',
    charset='utf8'
)

cursor = project_db.cursor(pymysql.cursors.DictCursor)

query = """
    insert into location(code, city, gu, dong, x, y)
    values(%s,%s,%s,%s,%s,%s)
    """

for i in range(0, len(json_data1)):

    #print(json_data1[i])
    code = json_data1[i].get('id')
    city = json_data1[i].get('City')
    gu = json_data1[i].get('Gu')
    dong = json_data1[i].get('Dong')
    x = json_data1[i].get('X')
    y = json_data1[i].get('Y')

    values = (code, city, gu, dong, x, y)
    cursor.execute(query, values)


#result = cursor.fetchall()
#print(result)

cursor.close()
project_db.commit()
#database.close()

