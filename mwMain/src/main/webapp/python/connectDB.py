import sys
import os

import pymysql
import base64
import requests
import pandas as pd

# RDS info
host ='openproject.cvlxlk5s1yan.ap-northeast-2.rds.amazonaws.com'
port = 3306
username = 'admin'
database = 'open'
password = 'awsje0914'

# Autorization Client Credentials Flow
def main():
    # get headers
    headers = get_headers(client_id, client_secret)

    # call RDS
    conn, cursor = connect_RDS(host,port,username,password,database)

if __name__ == '__main__':
    main(
        def connect_RDS(host,port,username,password,database):
            try:
                conn = pymysql.conenct(host,user=username,passwd=password,db=database,port=port,use_unicode=True,charset='utf8')

                #cursor는 DB와 SQL문장을 주고받는 역할
                cursor = conn.cursor()

                except:
                    logging.error('RDS에 연결되지 않았습니다.')
                    sys.exit(1)

                    return conn,cursor
        )


