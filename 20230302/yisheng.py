import pymysql
import tkinter as tk
from tkinter import ttk
import math

name0 = 0
dname0 = ""
project0 = ""
host0 = "sh-cynosdbmysql-grp-ggzzt8mo.sql.tencentcdb.com"
port0 = 20111
database0 = "rhospital"
charset0 = "utf8"
user0 = "sl"
passwd0 = "12345678"


class check:
    def __init__(self, name):
        self.idvar0 = None
        self.results = None
        global name0
        global project0
        global dname0
        name0 = name
        # 创建主窗口
        self.ppage = tk.Tk()
        # 设置窗口标题
        self.ppage.title("Doctor sys")
        # 设置窗口大小
        self.ppage.geometry("900x562")
        self.conn = pymysql.connect(host=host0, port=port0, database=database0, charset=charset0, user=user0,
                                    passwd=passwd0)
        get_project = f"SELECT project,name from doctor where dnum = '{name0}'"
        self.cursor = self.conn.cursor()
        print("rconn open")
        try:
            self.cursor.execute(get_project)
            self.results = self.cursor.fetchall()
            print(self.results[0][0])
            project0 = self.results[0][0]
        except Exception as e:
            print(e)
        finally:
            print("rconn close")
            self.cursor.close()
            self.conn.close()
        dname0 = self.results[0][1]
        # 没用的东西
        namelabel1 = tk.Label(self.ppage, text="你好," + project0 + "医生" + self.results[0][1] + ":", fg='black',
                              font=("仿宋", 10),
                              justify="left", anchor='w', width=300)
        # 显示该组件的位置及大小
        namelabel1.place(x=40, y=10, width=310, height=25)
        # 一个卑微的搜索框
        namelabel2 = tk.Label(self.ppage, text='身份证号:', fg='black', font=("仿宋", 10), justify="left", anchor='w',
                              width=40)
        # 显示该组件的位置及大小
        namelabel2.place(x=40, y=50, width=80, height=25)
        # 创建文本框,同时设置关联的变量
        self.idvar = tk.StringVar(self.ppage, value='')
        self.pid = tk.Entry(self.ppage, show='', width=80, textvariable=self.idvar)
        self.pid.place(x=110, y=50, width=180, height=25)
        # 一个卑微的按钮
        buttonchoose = tk.Button(self.ppage, text='搜索', activeforeground='#ff0000', font=("仿宋", 10),
                                 command=lambda: self.choose_patient0())
        buttonchoose.place(x=300, y=50, width=60, height=25)
        ########################################################
        # 创建表格
        self.table = ttk.Treeview(self.ppage)
        self.table['columns'] = ('name', 'age', 'gender', 'id')
        self.table.column('#0', width=0, stretch=False)
        self.table.column('name', anchor='center', width=100)
        self.table.column('age', anchor='center', width=50)
        self.table.column('gender', anchor='center', width=50)
        self.table.column('id', anchor='center', width=150)
        # 添加表头
        self.table.heading('name', text='Name')
        self.table.heading('age', text='Age')
        self.table.heading('gender', text='Gender')
        self.table.heading('id', text='ID')
        self.table.bind("<Double-1>", self.choose_patient)
        # 添加表格
        self.conn = pymysql.connect(host=host0, port=port0, database=database0, charset=charset0, user=user0,
                                    passwd=passwd0)
        self.cursor = self.conn.cursor()
        query = f"SELECT patient.name,patient.age,patient.sex,patient.id FROM exam inner join patient on exam.id = patient.id \
                                              WHERE checkin = '是' and `{project0}` = '1'"
        try:
            self.cursor.execute(query)
            self.results = self.cursor.fetchall()
        except Exception as e:
            print(e)
        finally:
            self.cursor.close()
            self.conn.close()
        for i in self.table.get_children():  # 删除原节点
            self.table.delete(i)
        if self.results:
            print(self.results)
            for i in range(len(self.results)):
                self.table.insert(parent='', index='end', text='1',
                                  values=(
                                      self.results[i][0], self.results[i][1], self.results[i][2], self.results[i][3]))
        self.table.pack(side='left', fill='x', expand=True)
        button = tk.Button(self.ppage, text='刷新', activeforeground='#ff0000', font=("仿宋", 10),
                           command=lambda: self.refresh())
        button.place(x=780, y=500, width=60, height=25)
        self.ppage.mainloop()

    def choose_patient0(self):
        print("choose succeeded")
        id_num = self.idvar.get()
        get_information = f"SELECT name , age, sex from patient,exam WHERE exam.id = patient.id and patient.id = '{id_num}' and exam.`{project0}` = '1'"
        revise_result = f""
        conn0 = pymysql.connect(host=host0, port=port0, database=database0, charset=charset0, user=user0,
                                passwd=passwd0)
        cursor0 = conn0.cursor()
        print("conn0 open")
        try:
            # 显示基本信息
            cursor0.execute(get_information)
            result0 = cursor0.fetchall()
            if result0:
                page = tk.Tk()
                page.title(f'{id_num}的检测结果')
                page.geometry('600x300+50+50')
                page.resizable(0, 0)  # 设置窗口不可变
                namelabel0 = tk.Label(page, text=f'姓名:{result0[0][0]}', fg='black', font=("仿宋", 10), justify="left",
                                      anchor='w', width=100)
                namelabel0.place(x=40, y=10, width=100, height=25)

                namelabel1 = tk.Label(page, text=f'年龄:{result0[0][1]}', fg='black', font=("仿宋", 10), justify="left",
                                      anchor='w', width=80)
                namelabel1.place(x=140, y=10, width=80, height=25)

                namelabel2 = tk.Label(page, text=f'性别:{result0[0][2]}', fg='black', font=("仿宋", 10), justify="left",
                                      anchor='w', width=80)
                namelabel2.place(x=240, y=10, width=80, height=25)

                namelabel3 = tk.Label(page, text=f'身份证号:{id_num}', fg='black', font=("仿宋", 10), justify="left",
                                      anchor='w', width=200)
                namelabel3.place(x=40, y=40, width=200, height=25)

                namelabel4 = tk.Label(page, text=f'项目:{project0}', fg='black', font=("仿宋", 10), justify="left",
                                      anchor='w', width=150)
                namelabel4.place(x=240, y=40, width=150, height=25)
                #  添加结果
                self.idvar0 = tk.StringVar(page, value='')
                self.pid = tk.Entry(page, show='', width=500, textvariable=self.idvar0)
                self.pid.place(x=40, y=70, width=450, height=190)
                # 提交按钮
                button = tk.Button(page, text='提交', activeforeground='#ff0000', font=("仿宋", 16),
                                   command=lambda: self.submit_result(page, id_num))
                button.place(x=500, y=70, width=80, height=190)
                # 显示个人信息
                page.mainloop()
            else:  # 设置弹窗显示该身份证号未报名该项目
                print("该身份证号未报名该项目")
        except Exception as e:
            print(e)
        finally:
            print("conn0 close")
            cursor0.close()
            conn0.close()

    def submit_result(self, page, id_num):
        rr = dname0+"-"+self.idvar0.get()
        conn1 = pymysql.connect(host=host0, port=port0, database=database0, charset=charset0, user=user0,
                                passwd=passwd0)
        cursor1 = conn1.cursor()
        revise0 = f"select * from result where id ='{id_num}'"
        revise1 = f"insert into result(id) value({id_num})"
        revise2 = f"update result set `{project0}` = '{rr}' where id = '{id_num}'"
        revise3 = f"update exam set `{project0}` = '0' where id = {id_num}"
        try:
            cursor1.execute(revise0)
            result1 = cursor1.fetchall()
            if not result1:  # 未找到该病人，创建该行
                cursor1.execute(revise1)
                conn1.commit()
        except Exception as e:
            print("创建失败")
            conn1.rollback()
            print(e)
        try:
            cursor1.execute(revise2)
            conn1.commit()
            print("提交成功")
        except Exception as e:
            print("提交失败")
            conn1.rollback()
            print(e)
        try:
            cursor1.execute(revise3)
            conn1.commit()
            print("修改成功")
        except Exception as e:
            print("修改失败")
            conn1.rollback()
            print(e)
        finally:
            cursor1.close()
            conn1.close()
        page.destroy()

    def choose_patient(self, event):
        order = math.floor((event.y - 25) / 20)
        print(order)
        if 0 <= order < len(self.results):
            id_num = self.results[order][3]
            page = tk.Tk()
            page.title(f'{id_num}的检测结果')
            page.geometry('600x300+50+50')
            page.resizable(0, 0)  # 设置窗口不可变
            namelabel0 = tk.Label(page, text=f'姓名:{self.results[order][0]}', fg='black', font=("仿宋", 10),
                                  justify="left",
                                  anchor='w', width=100)
            namelabel0.place(x=40, y=10, width=100, height=25)

            namelabel1 = tk.Label(page, text=f'年龄:{self.results[order][1]}', fg='black', font=("仿宋", 10),
                                  justify="left",
                                  anchor='w', width=80)
            namelabel1.place(x=140, y=10, width=80, height=25)

            namelabel2 = tk.Label(page, text=f'性别:{self.results[order][2]}', fg='black', font=("仿宋", 10),
                                  justify="left",
                                  anchor='w', width=80)
            namelabel2.place(x=240, y=10, width=80, height=25)

            namelabel3 = tk.Label(page, text=f'身份证号:{id_num}', fg='black', font=("仿宋", 10), justify="left",
                                  anchor='w', width=200)
            namelabel3.place(x=40, y=40, width=200, height=25)

            namelabel4 = tk.Label(page, text=f'项目:{project0}', fg='black', font=("仿宋", 10), justify="left",
                                  anchor='w', width=150)
            namelabel4.place(x=240, y=40, width=150, height=25)
            #  添加结果
            self.idvar0 = tk.StringVar(page, value='')
            self.pid = tk.Entry(page, show='', width=500, textvariable=self.idvar0)
            self.pid.place(x=40, y=70, width=450, height=190)
            # 提交按钮
            button = tk.Button(page, text='提交', activeforeground='#ff0000', font=("仿宋", 16),
                               command=lambda: self.submit_result(page, id_num))
            button.place(x=500, y=70, width=80, height=190)
            page.mainloop()
            page.destroy()
        else:  # 设置弹窗显示该身份证号未报名该项目
            print("该身份证号未报名该项目")

    def refresh(self):
        self.idvar.set('')
        self.pid = tk.Entry(self.ppage, show='', width=80, textvariable=self.idvar)
        print('刷新')
        # TODO: 下拉刷新逻辑
        # 添加表格
        self.conn = pymysql.connect(host=host0, port=port0, database=database0, charset=charset0, user=user0,
                                    passwd=passwd0)
        self.cursor = self.conn.cursor()
        query = f"SELECT patient.name,patient.age,patient.sex,patient.id FROM exam inner join patient on exam.id = patient.id \
                                                    WHERE checkin = '是' and `{project0}` = '1'"
        try:
            self.cursor.execute(query)
            self.results = self.cursor.fetchall()
        except Exception as e:
            print(e)
        finally:
            self.cursor.close()
            self.conn.close()
        for i in self.table.get_children():  # 删除原节点
            self.table.delete(i)
        if self.results:
            print(self.results)
            for i in range(len(self.results)):
                self.table.insert(parent='', index='end', text='1',
                                  values=(
                                      self.results[i][0], self.results[i][1], self.results[i][2], self.results[i][3]))
        pass

