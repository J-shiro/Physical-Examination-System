import tkinter as tk
from tkinter import messagebox
from tkinter import ttk
from tkinter import END
import pymysql
import reception
import rsa
import base64
import yisheng
import configparser

config = configparser.ConfigParser()
config.read('config.ini')

db_host = config['database']['host']
db_user = config['database']['user']
db_password = config['database']['password']
db_database = config['database']['database']
db_charset = config['database']['charset']
db_port = int(config['database']['port'])

root_usr = config['root']['usr']
root_ps = config['root']['passwd']

class Pagelogin:
    def __init__(self, page):
        # 窗口上创建标签组件: 用户名
        '''
            text='文本内容'    fg='字体颜色'    bg='字体背景'   font=("字体",字体大小)
            justify="文本标签对齐方式"    anchor='文本对齐方式'   width=宽度
        '''
        self.namelabel = tk.Label(page, text='用户名:', fg='black', font=("楷体", 16), justify="left", anchor='e', width=80)
        self.namelabel.place(x=120, y=60, width=125, height=25)# 显示该组件的位置及大小

        # 创建字符串变量和文本框组件，同时设置关联的变量
        self.namevar = tk.StringVar(page, value='')
        self.username = tk.Entry(page, width=80, textvariable=self.namevar) # 用户在文本框中输入内容时，tk.StringVar的值也会随之更新
        self.username.place(x=250, y=60, width=180, height=25)

        # 窗口上创建标签组件: 密码
        self.namelabel = tk.Label(page, text='密  码:', fg='black', font=("楷体", 16), justify="left", anchor='e', width=80)
        self.namelabel.place(x=120, y=100, width=125, height=25)

        # 创建密码文本框,同时设置关联的变量
        self.pwdvar = tk.StringVar(page, value='')
        self.userpwd = tk.Entry(page, show='*', width=80, textvariable=self.pwdvar)
        self.userpwd.place(x=250, y=100, width=180, height=25)


        '''
            创建按钮组件 及 设置按钮事件处理函数
            text='文本内容'      activeforeground='按下按钮时文字颜色'     command='关联的函数'
        '''

        # 登录按钮事件处理函数
        self.buttonlogin = tk.Button(page, text='登录', activeforeground='#ff0000',
                                      font=("楷体", 16), command=lambda: self.login(page))
        self.buttonlogin.place(x=160, y=175, width=80, height=25)

        # 取消按钮的事件处理函数
        self.buttoncancel = tk.Button(page, text='取消', font=("楷体", 16), command=self.cancel)
        self.buttoncancel.place(x=350, y=175, width=80, height=25)
        
        # 启动消息循环
        page.mainloop()
    
    # 登录按钮
    def login(self, page):
        self.conn = pymysql.connect(
            host='127.0.0.1', port=db_port, database=db_database, charset=db_charset, user=db_user,
            passwd=db_password
        )

        try:
            with self.conn.cursor() as cursor:
                # 准备SQL语句

                name = self.username.get()
                pwd = self.userpwd.get()

                # 私钥 rsa.PrivateKey(n, e, d, p, q)
                self.priv_key = rsa.PrivateKey(104638182774347449427580026912479675206958950920406724200019235131901055878957921903363818446976423474662870942828860129198842223571708607216402756849204096939640381734137275476491408032933306440189860065379652687416639082359453735757058574909472664883871182120750119254593288379133981477550203026303736246429,
                                               65537,
                                               104540788490977212852590595268650063534352263156149208442871346559902856931666827815503446551325637478478205255850320365891380341342771148604623098672437088503148161020753789729390986910563399162656817246277091086274220364771174221559950218286117131536469853110129756550906407133303278709344324140698165601905, 
                                               44134690237369250907971948527506624537505764495992662102211366445724693966000227893513847908975378203442563957866141655675016565051906536715741022848422672469636923, 
                                               2370882908922046339200307158988626178162687198676920950618236263548954563835956566148682158646126345744637002620914296560489195523532568042236423
                                               )

                if int(name) == int(root_usr) and int(pwd) == int(root_ps):  # 前台预约系统
                    tk.messagebox.showinfo(title='恭喜', message='登录成功！')
                    page.destroy()
                    # print("destroy")

                    root = tk.Tk()
                    root.title('体检信息页面')
                    height=562
                    width=900
                    root.geometry('%dx%d+%d+%d'%(width,
                                                 height,
                                                 (root.winfo_screenwidth()-width)/2,
                                                 (root.winfo_screenheight()-height)/2))

                    root.resizable(0, 0)  # 设置窗口不可变
                    reception.showdetail(root) # 调用reception.py的showdetail类

                    root.mainloop()
                    return
                else:  # 各医生系统
                    sql = f"select pwd from doctor where dnum = %s"   # 执行SQL语句
                    cursor.execute(sql, (name,)) # 结果保存在cursor中
                    datas = cursor.fetchall()[0][0] # cursor中获取全部数据

                    plaintext=self.rsa_decrypt(datas,self.priv_key)
                    flag = 0  # 是否登录成功
                    if datas:
                        if plaintext == pwd:
                            tk.messagebox.showinfo(title='恭喜', message='医生登录成功！')
                            page.destroy()
                            # print("destoory")
                            flag = 1
                        else:
                            tk.messagebox.showerror('提示', message='用户名或密码错误')
                    else:
                        tk.messagebox.showerror('提示', message='用户名或密码错误')
        except Exception as e:
            print("数据库操作异常：\n", e)
        finally:
            print("close")  # 无论是否发生异常，都会执行的代码块
        if flag:
            # 登录成功
            yisheng.check(name)
            # root.mainloop()

        return

    # 解密算法
    def rsa_decrypt(self,msg, priv_key):
        # 传参: 私钥、加密的明文
        ciphertext = base64.b64decode(msg) 
        plaintext = rsa.decrypt(ciphertext, priv_key)
        plaintext = plaintext.decode()
        return plaintext

    # 取消按钮
    def cancel(self): # 清空用户输入的用户名和密码
        self.namevar.set('')
        self.pwdvar.set('')


if __name__ == '__main__':

    loginpage = tk.Tk()
    
    # 窗口标题
    loginpage.title('医院体检系统登录界面')
    height=300 # 窗口高度
    width=600  # 窗口宽度

    # 设置窗口的大小和位置
    loginpage.geometry('%dx%d+%d+%d'% (
        width,
        height, 
        (loginpage.winfo_screenwidth()-width)/2, 
        (loginpage.winfo_screenheight()-height)/2
    ))
    
    # 设置登录界面
    Pagelogin(loginpage)
