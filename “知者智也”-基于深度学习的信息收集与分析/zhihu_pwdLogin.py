import webbrowser
from base64 import b64decode  # 解码验证码b64编码，QQ登陆不用
import time  # 用于暂停，防止被检测
import json  # 保存json格式cookies，便于读取
import os  # 主要用于创建文件夹等操作
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

# 1.打开浏览器
option = webdriver.ChromeOptions()
chrom_driver = r"C:\Users\zhangyongning\AppData\Local\Programs\Python\Python39\chromedriver.exe"
option.binary_location = r"F:\CentBrowser\Application\chrome.exe"
browser = webdriver.Chrome(executable_path=chrom_driver, chrome_options=option)
browser.get("https://www.zhihu.com/hot")


# 2.点击密码登录
bt_opt_pwd = browser.find_element_by_xpath('//*[@id="root"]/div/main/div/div/div/div[1]/div/div[1]/form/div[1]/div[2]')
bt_opt_pwd.click()
time.sleep(1)  # 等待下加载完毕


# 开始模拟输入账号密码登陆
text_pwd_account = browser.find_element_by_name("username")
text_pwd_password = browser.find_element_by_name("password")
text_pwd_account.send_keys("18893044109")  # 输入你的手机账号
text_pwd_password.send_keys("wuxin,1314")  # 输入你的用户密码

bt_pwd_login = browser.find_element_by_xpath('//*[@id="root"]/div/main/div/div/div/div[1]/div/div[1]/form/button')
bt_pwd_login.click()
time.sleep(3)


# 4.selenium保存cookie保存
zhihu_cookies = browser.get_cookies()
json_cookies = json.dumps(zhihu_cookies)
with open("./json_cookies.txt", "w") as f:
    f.write(json_cookies)

# 5.读取cookies
cookies_dic = {}
with open("./json_cookies.txt", "r") as f:
    cookies = json.load(f)
    # 在保存的cookies文档中，一个列表，每一项都是字典，字典又自然有多个键值对。只有每一个字典键值name，value对应的数据需要记住
    for cookie in cookies:
        cookies_dic[cookie['name']] = cookie['value']
