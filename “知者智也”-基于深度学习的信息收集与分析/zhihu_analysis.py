import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from sklearn.model_selection import train_test_split
import graphviz
import pydotplus
from sklearn import tree
from IPython.display import Image
import os

names = [
    "pm", "total", "redu", "lianjie", "huidashu",
    "guanzhushu", "liulanshu", "time",
]
data_file = 'D:\\Pycharm\\XXQ_Study\\知乎热度榜.csv'
data = pd.read_csv(data_file, encoding='gb18030', names=names)
data.drop_duplicates()
print('数据规模 : ', data.shape)
font = {'family': 'MicroSoft YaHei'}  # win可以显示中文
plt.rc("font", **font)


def build_bar():
    order = data[:50]
    order = order.sort_values(by="huidashu")
    order.index.name = ""
    plt.figure(figsize=(51, 15))
    x = data['pm']
    y = order
    plt.xlabel('排名')
    plt.ylabel('回答数')
    plt.bar(x, y, align='edge')
    plt.title('排名——回答数 条形图')
    plt.show()


def build_scatter():
    plt.figure(figsize=(51, 15))
    x = data['pm']
    y = data['guanzhushu']
    plt.xlabel('排名')
    plt.ylabel('关注数')
    plt.scatter(x, y, color='green', label=u"关注数分布数据", linewidths=2)
    plt.title('排名——关注数 散点图')
    plt.legend()
    plt.show()


if __name__ == '__main__':
    # build_bar()
    # build_scatter()
    order = data[:50]
    order = order.sort_values(by="huidashu")
    order.index.name = ""
    print(order["pm"])
