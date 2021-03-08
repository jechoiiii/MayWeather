import pymysql
project_db = pymysql.connect(
user='aia',
passwd='aia',
host='openproject.cjo3m3qn9rnp.ap-northeast-2.rds.amazonaws.com',
db='open',
charset='utf8'
)
cursor1 = project_db.cursor()

sql = "SELECT apiproductinfo FROM ootd"
print(sql)
cursor1.execute(sql)

apikeyword = []
while True :
 
    row = cursor1.fetchone()
 
    if row==None :
        break;
    print(row[0])
    print(type(row[0]))
    apikeyword.append(row[0])
    
print(apikeyword)
print(apikeyword[1])
a = '하하'
b = '호호'

project_db.close()