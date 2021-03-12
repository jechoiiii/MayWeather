from urllib import request
from bs4 import BeautifulSoup as bs
import re

url = 'https://search.shopping.naver.com/search/all?frm=NVSHCHK&npayType=&origQuery=%EC%9E%90%EC%BC%93&pagingIndex=1&pagingSize=40&productSet=checkout&query=%EC%9E%90%EC%BC%93&sort=rel&timestamp=&viewType=list'
target = request.urlopen(url)
soup = bs(target, 'html.parser')

wrap = soup.select('.basicList_title__3P9Q7')

print(wrap)

#items = soup.select('.basicList_title__3P9Q7 > a')

#name = soup.select('.basicList_link__1MaTN')
#prodname = soup.select('.prod-name')
#price = soup.select('.selling-price')

#nameinfo = []

#for alt in items[:10] :
    #print(alt.get('alt'))
    #nameinfo.append(alt.get('alt'))

#print(nameinfo)

#print(soup.title)
