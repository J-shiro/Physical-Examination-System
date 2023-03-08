import tkinter as tk
from tkinter import ttk
import tkinter.messagebox
from tkinter import END
import pymysql
import reception
import rsa
import base64
import yisheng

"""
import tkinter as tk

from tkinter import messagebox
from tkinter import filedialog
from tkinter import END
import pandas as pd
 """
host0 = "sh-cynosdbmysql-grp-ggzzt8mo.sql.tencentcdb.com"
port0 = 20111
database0 = "rhospital"
charset0 = "utf8"
user0 = "sl"
passwd0 = "12345678"


class Pagedetail:
    def __init__(self, page):
        self.conn = pymysql.connect( #创建数据库连接对象
            host=host0, port=port0, database=database0, charset=charset0, user=user0,
            passwd=passwd0
        )
        self.time = {}

        self.var = tk.StringVar() #可变字符串对象
        self.var1 = tk.StringVar()
        self.var2 = tk.StringVar()
        self.var3 = tk.StringVar()
        self.var4 = tk.StringVar()
        self.var5 = tk.StringVar()
        self.var6 = tk.StringVar()
        self.var7 = tk.StringVar()
        self.var8 = tk.StringVar()

        self.columns = ['姓名', '年龄', '性别', '婚姻状况', '身份证号码', '联系电话', '预约日期', "签到状况"]
        self.tree = ttk.Treeview(
            page,  #
            height=15,  # 表格显示的行数
            columns=self.columns,  # 显示的列
            show='headings',  # 隐藏首列
        )
        self.width = [100, 50, 50, 80, 150, 120, 120, 100]

        for x, y in zip(self.columns, self.width):
            self.tree.heading(x, text=x)
            # 各个参数的解释： x列名 width：列宽 anchor=center居中显示
            self.tree.column(x, width=y, anchor="center")
        self.tree.grid(row=1, columnspan=7)  # columnspan=3合并单元格，横跨3列

        self.cursor = self.conn.cursor() #创建游标对象
        query = "SELECT name,age,sex,marriage,patient.id,phone,date,checkin FROM patient,exam where patient.id=exam.id"
        try:
            self.cursor.execute(query) #执行查询语句
            results = self.cursor.fetchall() #获取查询结果
            for row in results:
                name = row[0]
                age = row[1]
                sex = row[2]
                marriage = row[3]
                id = row[4]
                phone = row[5]
                date = row[6]
                state = row[7]
                self.tree.insert('', END, values=[name, age, sex, marriage, id, phone, date, state])  # 添加数据到末尾
        except Exception as e:
            print(e)
        finally:
            self.cursor.close()
            self.conn.close() #关闭

        #     cpt = 0 # Counter representing the ID of your code.
        #     for row in self.cursor:
        self.tree.bind("<ButtonRelease-1>", self.click_bf) #鼠标左键释放时触发self.click_bf函数
        #        # I suppose the first column of your table is ID
        #         self.tree.insert('', 'end', text=str(cpt), values=(row[1], row[2], row[3]))
        #         cpt += 1 
        # 绑定的单击函数

    def click_bf(self, event):  # 单击获取
        print(event) #鼠标的坐标、事件类型、发生时间


class Pagelogin:
    def __init__(self, page):
        # 在窗口上创建标签组件（User Name）
        # 各个参数的解释：       text设置文本内容    fg='设置字体颜色'    bg='设置字体背景'    font=("设置字体",设置字体大小)    justify=文本标签对齐的方式    anchor='文本对其方式', width=设置的宽度
        self.namelabel = tk.Label(page, text='用户名:', fg='black', font=("楷体", 16), justify="left", anchor='e', width=80)
        # 显示该组件的位置及大小
        self.namelabel.place(x=120, y=60, width=125, height=25)

        # 创建字符串变量和文本框组件，同时设置关联的变量
        self.namevar = tk.StringVar(page, value='')
        self.username = tk.Entry(page, width=80, textvariable=self.namevar)
        self.username.place(x=250, y=60, width=180, height=25)

        # 在窗口上创建标签组件（User Pwd）
        self.namelabel = tk.Label(page, text='密  码:', fg='black', font=("楷体", 16), justify="left", anchor='e', width=80)
        # 显示该组件的位置及大小
        self.namelabel.place(x=120, y=100, width=125, height=25)

        # 创建密码文本框,同时设置关联的变量
        self.pwdvar = tk.StringVar(page, value='')
        self.userpwd = tk.Entry(page, show='*', width=80, textvariable=self.pwdvar)
        self.userpwd.place(x=250, y=100, width=180, height=25)

        # 创建按钮组件，同时设置按钮事件处理函数
        # 参数解释：  text='Login'文本内容      activeforeground='#ff0000'按下按钮时文字颜色     command=login关联的函数
        # 登录按钮事件处理函数
        self.buttonlogin = tk.Button(page, text='登录', activeforeground='#ff0000', font=("楷体", 16),
                                     command=lambda: self.login(page))
        self.buttonlogin.place(x=160, y=175, width=80, height=25)
        # 取消按钮的事件处理函数
        self.buttoncancel = tk.Button(page, text='取消', font=("楷体", 16), command=self.cancel)
        self.buttoncancel.place(x=350, y=175, width=80, height=25)
        # 启动消息循环
        page.mainloop()

    # def reception(self, page):

    # 登录按钮处理函数
    def login(self, page):
        self.conn = pymysql.connect(
            host=host0, port=port0, database=database0, charset=charset0, user=user0,
            passwd=passwd0
        )
        try:
            with self.conn.cursor() as cursor:
                # 准备SQL语句
                # 预约工号9999，密码999999

                name = self.username.get()
                pwd = self.userpwd.get()
                print(pwd)
                #name=9999
                #pwd=999999
                self.priv_key = rsa.PrivateKey(104638182774347449427580026912479675206958950920406724200019235131901055878957921903363818446976423474662870942828860129198842223571708607216402756849204096939640381734137275476491408032933306440189860065379652687416639082359453735757058574909472664883871182120750119254593288379133981477550203026303736246429, 65537, 104540788490977212852590595268650063534352263156149208442871346559902856931666827815503446551325637478478205255850320365891380341342771148604623098672437088503148161020753789729390986910563399162656817246277091086274220364771174221559950218286117131536469853110129756550906407133303278709344324140698165601905, 44134690237369250907971948527506624537505764495992662102211366445724693966000227893513847908975378203442563957866141655675016565051906536715741022848422672469636923, 2370882908922046339200307158988626178162687198676920950618236263548954563835956566148682158646126345744637002620914296560489195523532568042236423)
                if int(name) == 9999 and int(pwd) == 999999:  # 前台预约系统
                    tk.messagebox.showinfo(title='恭喜', message='登录成功！')
                    page.destroy()
                    print("destroy")
                    root = tk.Tk()
                    root.title('体检信息页面')
                    # root.iconbitmap('fa.ico') #设置左上角小图标
                    height=562
                    width=900
                    root.geometry('%dx%d+%d+%d'%(width, height, (root.winfo_screenwidth()-width)/2, (root.winfo_screenheight()-height)/2))
                    # root.geometry('900x562+50+100')
                    root.resizable(0, 0)  # 设置窗口不可变
                    reception.showdetail(root)
                    root.mainloop()
                    return
                else:  # 医生系统
                    sql = f"select pwd from doctor where dnum = '{name}'"
                    # 执行SQL语句
                    cursor.execute(sql)
                    # 执行完SQL语句后的返回结果都是保存在cursor中
                    # 所以要从cursor中获取全部数据
                    datas = cursor.fetchall()[0][0]
                    plaintext=self.rsa_decrypt(datas,self.priv_key)
                    flag = 0
                    if datas:
                        if plaintext == pwd:
                            tk.messagebox.showinfo(title='恭喜', message='登录成功！!!!!!!')
                            page.destroy()
                            print("destoory")
                            flag = 1
                        else:
                            tk.messagebox.showerror('提示', message='用户名或密码错误')
                    else:
                        tk.messagebox.showerror('提示', message='用户名或密码错误')
        except Exception as e:
            #print("asasasa")
            print("数据库操作异常：\n", e)
        finally:
            print("close")
        if flag:
            yisheng.check(name)
            root.mainloop()

        return

    # 解密算法
    def rsa_decrypt(self,msg, priv_key):
        '''
        传参私钥和加密的明文
        :param ciphertext:
        :param priv_key:
        :return:解密结果
        '''
        ciphertext = base64.b64decode(msg) 
        plaintext = rsa.decrypt(ciphertext, priv_key)
        plaintext = plaintext.decode()
        return plaintext

    # 取消按钮处理函数
    def cancel(self):
        # 清空用户输入的用户名和密码
        self.namevar.set('')
        self.pwdvar.set('')


if __name__ == '__main__':
    loginpage = tk.Tk()
    # 设置窗口的标题
    loginpage.title('医院体检系统登录界面')
    # 设置窗口大小
    height=300
    width=600
    loginpage.geometry('%dx%d+%d+%d'%(width, height, (loginpage.winfo_screenwidth()-width)/2, (loginpage.winfo_screenheight()-height)/2))
                    #设置窗口的大小和位置
    Pagelogin(loginpage)

"""
    root = tk.Tk()
    root.title('体检信息页面')
    # root.iconbitmap('fa.ico') #设置左上角小图标
    root.geometry('900x562+50+100')
    root.resizable(0, 0) #设置窗口不可变
    Pagedetail(root)
    root.mainloop()    
"""
