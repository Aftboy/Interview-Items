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


# 2. 获取知乎登陆页面的窗口句柄
zhihuHandle = browser.current_window_handle
#    2.1 点击QQ图标登陆
bt_opt_QQ = browser.find_element_by_xpath('//*[@id="root"]/div/main/div/div/div/div[3]/span[2]/button[2]')
bt_opt_QQ.click()
time.sleep(1)                                # 等待下加载完毕


# 3.获得当前所有打开的窗口的句柄
all_handles = browser.window_handles
#   3.1 切换到QQ登陆窗口
login_handle = all_handles[1]
browser.switch_to.window(login_handle)
#   3.2 先聚焦到登陆界面，然后点击账号密码登陆
browser.switch_to.frame("ptlogin_iframe")
bt_opt_inputAP = browser.find_element_by_xpath('//*[@id="switcher_plogin"]')
bt_opt_inputAP.click()
time.sleep(1)
#   3.3 回到主框架，然后聚焦到账号、密码输入界面
browser.switch_to.default_content()
browser.switch_to.frame("ptlogin_iframe")
#   3.4 开始模拟输入账号密码登陆
text_qq_account = browser.find_element_by_id("u").send_keys("2902132836")   # 输入QQ账号
text_qq_password = browser.find_element_by_id("p").send_keys("wuxin,1314")  # 输入QQ密码
bt_qq_login = browser.find_element_by_id("login_button")
bt_qq_login.click()
time.sleep(3)


# 切回知乎窗口，表单不用
browser.switch_to.window(zhihuHandle)
time.sleep(2)

zhihu_cookies = browser.get_cookies()

# 4.保存cookie
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
