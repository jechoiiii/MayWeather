from bs4 import BeautifulSoup as bs
from selenium import webdriver

keyword = '자켓'
product_data = []

url = 'https://www.brandi.co.kr/search?q='+keyword
driver = webdriver.Chrome(executable_path=r'/Users/christine/Downloads/chromedriver')
driver.get(url)

with open(keyword+'.png', 'wb') as file:
    file.write(driver.find_element_by_xpath('//*[@id="container"]/div[2]/div[2]/div[2]/div[1]/div[1]/a/div[1]').screenshot_as_png)

soup = bs(driver.page_source)

salepercent = soup.find_all('div',class_='info-price')[0].text.split(' ')[0]
saleprice = soup.find_all('div',class_='info-price')[0].text.split(' ')[1]
originalprice = soup.find_all('div',class_='info-price')[0].text.split(' ')[2]
name = soup.find_all('em',class_='prod-name')[0].text


url = 'https://www.brandi.co.kr'+soup.find_all('div',class_='Mod_link-prod')[0].a['href']

product_data = {
    'name' : name,
    'salepercent' : salepercent,
    'saleprice' : saleprice,
    'originalprice' : originalprice,
    'url' : url
}

print(product_data)

from flask import Flask

# 웹서버 생성
app = Flask(__name__)

from flask_cors import CORS
CORS(app)

#url
@app.route('/codi')
def productItem():
    return product_data
    
if __name__ == '__main__':
     app.run(debug=True, port=8000, host='ec2-54-180-95-157.ap-northeast-2.compute.amazonaws.com')


