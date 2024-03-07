import tkinter as tk
from tkinter import ttk
from tkinter import END
import pymysql
import configparser

config = configparser.ConfigParser()
config.read('config.ini')

db_host = config['database']['host']
db_user = config['database']['user']
db_password = config['database']['password']
db_database = config['database']['database']
db_charset = config['database']['charset']
db_port = int(config['database']['port'])

temp = 0

# 打印预览
class Preview(tk.Frame):
    def __init__(self, page=None, id=None):
        super().__init__(page)
        self.page = page
        self.id = id
        self.cal()
        self.print_preview()

    def cal(self):
        self.conn = pymysql.connect(  # 连接数据库
            host=db_host, port=db_port, database=db_database, charset=db_charset, user=db_user,
            passwd=db_password
        )
        self.cursor = self.conn.cursor()
        
        self.events = ['一般项目', '内科', '外科', '耳鼻喉',
                       "口腔科", "静态心电图ECG", '妇科', '尿常规12项', '血常规18项', '肝功能', '血脂', '肾功能',
                       '血糖', '肿瘤标志物C12', '幽门螺旋杆菌检测', '高清彩色多普勒B超', '电子计算机断层扫描CT']
        time = {'一般项目': 5, '内科': 2, '外科': 5, '眼科': 3, '耳鼻喉': 4,
                "口腔科": 1, "静态心电图ECG": 3, '妇科': 5, '尿常规12项': 2, '血常规18项': 2, '肝功能': 3, '血脂': 2, '肾功能': 4,
                '血糖': 3, '肿瘤标志物C12': 6, '幽门螺旋杆菌检测': 3, '高清彩色多普勒B超': 5, '电子计算机断层扫描CT': 3}
        
        results = []
        appoint = []
        try:
            for event in self.events:
                print(event)
                query = f"SELECT count(`{event}`) from exam where checkin='是' and `{event}`='1';"
                self.cursor.execute(query)
                num = self.cursor.fetchall()[0][0]  # 该项目已预约的次数

                query = f"SELECT `{event}` from exam where `id`={self.id};"
                self.cursor.execute(query)
                e = self.cursor.fetchall()[0][0] # 查询当前用户是否预约了该项目
                print(type(e))

                if e == '1':
                    appoint.append(event)
                    results.append(num * time[event])

            print(results)
            print(appoint)
            appoint_res = zip(appoint, results)
            self.sorted_appoint_res = sorted(appoint_res, key=lambda x: x[1]) # 排序
            print(self.sorted_appoint_res)

        except Exception as e:
            print(e)
        finally:
            self.cursor.close()
            self.conn.close()

    def print_preview(self):

        self.preview_window = tk.Toplevel(self.page)
        height = 562
        width = 600
        self.preview_window.geometry('%dx%d+%d+%d' % (
            width, 
            height, 
            (self.page.winfo_screenwidth() - width) / 2, 
            (self.page.winfo_screenheight() - height) / 2))
        self.preview_window.title("导检图预览")

        preview_label = tk.Label(self.preview_window, text=" ")
        preview_label.pack()
        label = tk.Label(self.preview_window, text='推荐体检顺序\n', fg='black', font=("楷体", 12))
        label.pack()
        # 显示该组件的位置及大小
        # self.namelabel.place(x=120, y=60, width=125, height=25)

        for event, _ in self.sorted_appoint_res:
            preview_label = tk.Label(self.preview_window, text="⬇")
            preview_label.pack()
            label = tk.Label(self.preview_window, text=event, fg='black', font=("楷体", 12))
            label.pack()

        print_button = tk.Button(self.preview_window, text="打印", command=self.print_table)
        print_button.pack(side="right", padx=10, pady=10)

    def print_table(self):
        self.print_success_window = tk.Toplevel(self.page)
        height = 100
        width = 200
        self.print_success_window.geometry('%dx%d+%d+%d' % (
        width, height, (self.page.winfo_screenwidth() - width) / 2, (self.page.winfo_screenheight() - height) / 2))

        self.print_success_window.title("打印成功")

        success_label = tk.Label(self.print_success_window, text="打印成功!")
        success_label.pack(padx=20, pady=20)

        confirm_button = tk.Button(self.print_success_window, text="确认", command=self.close_windows)
        confirm_button.pack(side="bottom", pady=10)

    def close_windows(self):

        # self.preview_window.destroy()
        # self.preview_table.destroy()
        self.print_success_window.destroy()

# 前台可查看各个病人情况
class showdetail():

    def __init__(self, page):
        self.conn = pymysql.connect(
            host=db_host, port=db_port, database=db_database, charset=db_charset, user=db_user,
            passwd=db_password
        )
        self.show(page)

    def show(self,page):
        self.conn = pymysql.connect(
            host=db_host, port=db_port, database=db_database, charset=db_charset, user=db_user,
            passwd=db_password
        )

        # 检查是否已经创建了 HScroll1 和 tree 这两个组件，如果存在，先销毁再重新创建
        if hasattr(self, 'HScroll1'):
            self.HScroll1.pack_forget()
            self.HScroll1.destroy()

        if hasattr(self, 'tree'):
            self.tree.pack_forget()
            self.tree.destroy()

        self.var = tk.StringVar()
        self.var1 = tk.StringVar()
        self.var2 = tk.StringVar()
        self.var3 = tk.StringVar()
        self.var4 = tk.StringVar()
        self.var5 = tk.StringVar()
        self.var6 = tk.StringVar()
        self.var7 = tk.StringVar()
        self.var8 = tk.StringVar()
        self.var9 = tk.StringVar()

        # 垂直滚动条
        self.VScroll1 = tk.Scrollbar(page, orient="vertical")
        self.VScroll1.pack(side="right", fill="y")

        self.columns = ['姓名', '年龄', '性别', '婚姻状况', '身份证号码', '联系电话', '预约日期', "签到状况", "详情"]
        self.tree = ttk.Treeview(
            page,  
            height=15,  # 表格显示的行数
            columns=self.columns,  # 显示的列
            show='headings',  # 隐藏首列
        )

        # 配置滚动条与表格的关联，实现滚动效果
        self.tree.configure(xscrollcommand=self.VScroll1.set)
        self.VScroll1.config(command=self.tree.yview)
        

        self.width = [100, 50, 50, 80, 150, 120, 120, 100, 100] # 列宽
        for x, y in zip(self.columns, self.width): 
            self.tree.heading(x, text=x)# 为每列设置列名
            self.tree.column(x, width=y, anchor="center")   # 列宽和对齐方式
            '''
                x列名 width=列宽 anchor=center居中显示
            '''

        self.tree.pack(fill='both', expand=True)

        self.cursor = self.conn.cursor()
        query = "SELECT name,age,sex,marriage,patient.id,phone,date,checkin FROM patient,exam where patient.id=exam.id"
        try:
            self.cursor.execute(query)
            results = self.cursor.fetchall()
            count = 0
            for row in results:
                count = count + 1
            self.buttonlist = [None] * count
            count = 0
            
            for row in results:
                name = row[0]
                age = row[1]
                sex = row[2]
                marriage = row[3]
                id = row[4]
                phone = row[5]
                date = row[6]
                state = row[7]

                self.buttonlist[count] = tk.Button(page, text='...', activeforeground='#ff0000', font=("黑体", 8),
                                                   command=lambda temp=id: self.detail(page, temp), anchor='center')
                # 显示详情页
                self.buttonlist[count].place(x=810, y=25 + 20 * count, width=20, height=15)

                # ttk.Treeview 中插入一行数据
                self.tree.insert('', END, values=[name, age, sex, marriage, id, phone, date, state])  # 添加数据到末尾
                count = count + 1

        except Exception as e:
            print(e)
        finally:
            self.cursor.close()
            self.conn.close()

        self.tree.bind("<ButtonRelease-1>", self.click_bf) # 鼠标左键释放事件

        # 启动消息循环
        page.mainloop()

    def detail(self, page, id):
        global temp
        temp = id
        print(f'temp:{temp}')
        self.conn = pymysql.connect(
            host=db_host, port=db_port, database=db_database, charset=db_charset, user=db_user,
            passwd=db_password
        )

        if hasattr(self, 'HScroll1'):
            self.HScroll1.pack_forget()
            self.HScroll1.destroy()

        if hasattr(self, 'tree'):
            self.tree.pack_forget()
            self.tree.destroy()

        if hasattr(self, 'VScroll1'):
            self.VScroll1.pack_forget()
            self.VScroll1.destroy()

        if hasattr(self, 'label'):
            self.label.destroy()

        if hasattr(self, 'combobox'):
            self.combobox.destroy()


        self.HScroll1 = tk.Scrollbar(page, orient="horizontal")
        self.HScroll1.pack(side="bottom", fill="x")

        v1 = tk.StringVar()
        self.columns = ['姓名', '身份证号码', '签到日期', '签到状况', '一般项目', '内科', '外科','眼科', '耳鼻喉科',
                        "口腔科", "静态心电图", '妇科', '尿常规12项', '血常规18项', '肝功能', '血脂', '肾功能',
                        '血糖', '肿瘤标志物C12', '幽门螺旋杆菌检测', '高清彩色多普勒B超', '电子计算机断层扫描CT']
        self.tree = ttk.Treeview(
            page, 
            height=15,  # 表格显示的行数
            columns=self.columns,  # 显示的列
            show='headings',  # 隐藏首列
        )

        self.tree.configure(xscrollcommand=self.HScroll1.set)
        self.HScroll1.config(command=self.tree.xview)
        self.width = [40, 140, 80, 60, 60, 40, 40, 40, 60, 50, 80, 40, 80, 80, 60, 40, 60, 40, 120, 120, 120, 150]
        for x, y in zip(self.columns, self.width):
            self.tree.heading(x, text=x)
            # x=列名 width=列宽 anchor=center居中显示
            self.tree.column(x, width=y, anchor="center")

        # columnspan=3合并单元格，横跨3列

        self.tree.pack(fill='y', expand=True)

        self.buttonedit = tk.Button(page, text='编辑', activeforeground='#ff0000', font=("楷体", 14),
                                     command=lambda: self.sign(page))
        self.buttonedit.place(x=160, y=125, width=80, height=25)

        self.buttonback = tk.Button(page, text='刷新&撤销编辑', activeforeground='#ff0000', font=("楷体", 14),
                                     command=lambda : self.detail(page, temp))
        self.buttonback.place(x=280, y=125, width=150, height=25)

        self.buttoncheckin = tk.Button(page, text='签到&保存编辑', activeforeground='#ff0000', font=("楷体", 14),
                                     command=lambda: self.checkin())
        self.buttoncheckin.place(x=470, y=125, width=150, height=25)

        self.buttonquit = tk.Button(page, text='返回', activeforeground='#ff0000', font=("楷体", 14),
                                     command=lambda: self.show(page))
        self.buttonquit.place(x=660, y=125, width=80, height=25)

        self.buttonprint = tk.Button(page, text='打印预览', activeforeground='#ff0000', font=("楷体", 14),
                                     command=lambda: Preview(page,temp))

        self.buttonprint.place(x=660, y=500, width=80, height=25)

        # 添加下拉刷新功能
        page.bind('<Right>', lambda event: self.refresh())

        try:
            self.cursor = self.conn.cursor()
            with self.conn.cursor() as cursor:
                query = "SELECT name,exam.id,date,checkin,`一般项目`,`内科`,`外科`,`眼科`,`耳鼻喉`,\
                        口腔科,静态心电图ECG,妇科,尿常规12项,血常规18项,肝功能,血脂,肾功能,\
                        血糖,肿瘤标志物C12,幽门螺旋杆菌检测,高清彩色多普勒B超,电子计算机断层扫描CT\
                        from rhospital.patient,rhospital.exam where patient.id = (%s) and patient.id=exam.id"
                self.cursor.execute(query, id)
                self.results = self.cursor.fetchall()
                self.changelist = [None]*21

                for row in self.results:
                    a1 = row[0]
                    a2 = row[1]
                    a3 = row[2]
                    a4 = row[3]
                    a5 = row[4]
                    a6 = row[5]
                    a7 = row[6]
                    a8 = row[7]
                    a9 = row[8]
                    a10 = row[9]
                    a11 = row[10]
                    a12 = row[11]
                    a13 = row[12]
                    a14 = row[13]
                    a15 = row[14]
                    a16 = row[15]
                    a17 = row[16]
                    a18 = row[17]
                    a19 = row[18]
                    a20 = row[19]
                    a21 = row[20]
                    a22 = row[21]
                    self.changelist=[a1, a2, a3, a4, a5, a6, a7, a8, a9,
                                     a10, a11, a12, a13, a14, a15, a16, a17,
                                     a18, a19, a20, a21, a22]
                    self.tree.insert('', END, values=self.changelist)  # 添加
        except Exception as e:
            print("数据库操作异常：\n", e)
        finally:
            self.conn.close()
            print("close")

    # 更新病患的签到状态和各个检查项目的值
    def checkin(self):
        global temp
        print(f'now the temp is:{temp}')
        self.conn = pymysql.connect(
            host=db_host, port=db_port, database=db_database, charset=db_charset, user=db_user,
            passwd=db_password
        )
        try:
            self.cursor = self.conn.cursor()
            query = f"UPDATE exam SET checkin = '是' WHERE id = '{temp}'"
            self.cursor.execute(query)
            self.conn.commit()
            index = 4
            column = [ '一般项目', '内科', '外科', '眼科', '耳鼻喉',
                       '口腔科', '静态心电图ECG', '妇科', '尿常规12项', '血常规18项', '肝功能', '血脂', '肾功能',
                       '血糖', '肿瘤标志物C12', '幽门螺旋杆菌检测', '高清彩色多普勒B超', '电子计算机断层扫描CT']
            for value in column:
                query = f"UPDATE exam SET `{value}` = '{self.changelist[index]}' WHERE id = '{temp}'"
                index = index + 1
                self.cursor.execute(query)
                self.conn.commit()
            print('提交修改')

        except Exception as e:
            print("数据库操作异常：\n", e)
        finally:
            self.conn.close()
            print("checkin_close")

    # 编辑按钮，生成下拉框
    def sign(self, page):

        values = ['一般项目', '内科', '外科', '眼科','耳鼻喉科',
                        '口腔科', '静态心电图', '妇科', '尿常规12项', '血常规18项', '肝功能', '血脂', '肾功能',
                        '血糖', '肿瘤标志物(C12)', '幽门螺旋杆菌检测', '高清彩色多普勒B超', '电子计算机断层扫描(CT)']
        self.combobox = ttk.Combobox(page, values=values)
        self.combobox.place(x=250, y=200)
        self.label = tk.Label(page, text="选择要编辑的项目...")
        self.label.place(x=450, y=200)
        self.combobox.bind("<<ComboboxSelected>>", self.on_select)  # 选择下拉框中的选项时触发

    # 添加删除选项
    def on_select(self,event):
        selected = event.widget.get() # 获取用户在下拉框选择的项目

        values = ['一般项目', '内科', '外科', '眼科','耳鼻喉科',
                        '口腔科', '静态心电图', '妇科', '尿常规12项', '血常规18项', '肝功能', '血脂', '肾功能',
                        '血糖', '肿瘤标志物(C12)', '幽门螺旋杆菌检测', '高清彩色多普勒B超', '电子计算机断层扫描(CT)']
        index = 4   # 前面有四个非编辑项目
        for getvalue in values:
            if getvalue == selected:
                break
            index = index+1
        print(index)
        print(self.results[0][index])

        if self.results[0][index] == '0':

            new_text=f"\n你选择增加 {selected};"
            self.label.configure(text=self.label["text"] + new_text)
            self.changelist[index] = '1'
        else:
            new_text = f"\n你选择取消 {selected};"
            self.label.configure(text=self.label["text"] + new_text)
            self.changelist[index] = '0'


    def click_bf(self, event):  # 单击
        print(event)

    def refresh(self):
        # TODO: 下拉刷新逻辑
        pass
