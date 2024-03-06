# Physical-Examination-System
上海大学2022-2023年冬季学期数据库课程期末项目：基于vue、Django、mysql和tkinter的智慧体检系统。

## 初始化

将sql文件导入本地的数据库，更改`Django: Patient_back`和`Python: Docter`两个文件夹下的数据库设置

![image-20240306215704862](README.assets/image-20240306215704862.png)

## 运行

从终端进入`test`文件夹启动vue前端界面

```shell
npm run serve
```

进入`Patient_back`文件夹启动Django后端

```shell
python manage.py runserver
```

进入`Docter`文件夹，直接运行`Run.py`文件启动医生前台及医生登录端

```shell
python test.py
```

## 用户端展示

### 登录界面

![image-20230302132304489](README.assets/image-20230302132304489.png)

### 注册界面

![image-20230302132338655](README.assets/image-20230302132338655.png)

### 首页界面

![image-20230302132510390](README.assets/image-20230302132510390.png)

### 预约填写

![image-20230302132702931](README.assets/image-20230302132702931.png)

### 体检项目

![image-20230302132913794](README.assets/image-20230302132913794.png)

### 签到界面

![image-20230302133001494](README.assets/image-20230302133001494.png)

### 体检结果

![image-20230302133031585](README.assets/image-20230302133031585.png)

![image-20230302133114425](README.assets/image-20230302133114425.png)

## 医生端

### 医生前台登录界面

![image-20230302133337475](README.assets/image-20230302133337475.png)

### 医生前台管理界面

![image-20230302133411907](README.assets/image-20230302133411907.png)

![image-20230302133430338](README.assets/image-20230302133430338.png)

### 各科室医生界面

![image-20230302133611681](README.assets/image-20230302133611681.png)

![image-20230302133628733](README.assets/image-20230302133628733.png)

## 数据库展示

### docter

![image-20230302134435273](README.assets/image-20230302134435273.png)

### exam

![image-20230302133828682](README.assets/image-20230302133828682.png)

### login

![image-20230302133848923](README.assets/image-20230302133848923.png)

### patient

![image-20230302133909973](README.assets/image-20230302133909973.png)

### result

![image-20230302133934127](README.assets/image-20230302133934127.png)
