# -*- coding: utf-8 -*-
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from django.core import serializers
from django.db import models
import requests
import json
from django.db.models import Model
from django.db import models
from .models import *



@csrf_exempt                    # 关闭csrf保护便于开发
@require_http_methods(['POST']) # 只接受 HTTP POST 请求
def register(request):
    response = {}
    try:
        # 提取 JSON 数据，获取用户名， 密码
        name = json.loads(request.body).get("name")
        password = json.loads(request.body).get("password")
        print("name: {}, pwd: {}".format(name, password))

        reg = Login()   # 创建 Login 模型的实例
        reg.name = name
        reg.password = password
        reg.save()  # 保存到数据库

        response['msg'] = 'success'
        response['error_num'] = 0

    except Exception as e:
        print(e)
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response)


@csrf_exempt
@require_http_methods(['POST'])
def login(request):
    response = {}
    try:
        # print(request.body)
        name = json.loads(request.body).get("name")
        pwd = json.loads(request.body).get("password")

        all_login = Login.objects.all() # 查询所有的 Login 模型实例
        login_succ = 0
        print("name: {} pwd: {}".format(name, pwd))

        for cur in all_login:
            if cur.name == name and cur.password == pwd:
                login_succ = 1
        if login_succ == 1:
            response['msg'] = 'success'
            response['error_num'] = 0
            response['username'] = name
        else:
            response['msg'] = 'failed'
            response['error_num'] = 2

    except Exception as e:
        print(e)
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response)


@csrf_exempt
@require_http_methods(['POST'])
def add_patient(request):

    response = {}
    try:
        patient = Patient()

        pname = json.loads(request.body).get("name")
        curP = Login.objects.filter(name=pname)
        age = json.loads(request.body).get("age")
        sex = json.loads(request.body).get("sex")
        marriage = json.loads(request.body).get("marriage")
        id = json.loads(request.body).get("id")
        phone = json.loads(request.body).get("phone")
        # print(sex, phone)

        patient.name = pname
        patient.age = age
        patient.sex = sex
        patient.marriage = marriage
        patient.id = id
        patient.phone = phone

        # print(patient.name)
        patient.save()

        if not curP.exists():
            response['msg'] = 'fail'
            response['error_num'] = 1 #名字不存在
        else:
            response['msg'] = 'success'
            response['error_num'] = 0 #成功
    except  Exception as e:
        print(e)
        response['msg'] = str(e)
        response['error_num'] = 10

    return JsonResponse(response)


@csrf_exempt
@require_http_methods(['POST'])
def choose_project(request):
    response = {}
    try:
        exam = Exam()

        exam.id = json.loads(request.body).get("id")
        exam.date = json.loads(request.body).get("date")
        exam.checkin = '否'
        exam.一般项目 = json.loads(request.body).get("normal")
        exam.内科 = json.loads(request.body).get("internal")
        exam.外科 = json.loads(request.body).get("external")
        exam.眼科 = json.loads(request.body).get("eye")
        exam.耳鼻喉 = json.loads(request.body).get("ent")
        exam.口腔科 = json.loads(request.body).get("mouth")
        exam.静态心电图ecg = json.loads(request.body).get("ECG")
        exam.妇科 = json.loads(request.body).get("gynecologial")
        exam.尿常规12项 = json.loads(request.body).get("urine")
        exam.血常规18项 = json.loads(request.body).get("blood")
        exam.肝功能 = json.loads(request.body).get("liver")
        exam.血脂 = json.loads(request.body).get("bloodfat")
        exam.肾功能 = json.loads(request.body).get("kidney")
        exam.血糖 = json.loads(request.body).get("bloodsugar")
        exam.肿瘤标志物c12 = json.loads(request.body).get("C12")
        exam.幽门螺旋杆菌检测 = json.loads(request.body).get("germ")
        exam.高清彩色多普勒b超 = json.loads(request.body).get("Bmode")
        exam.电子计算机断层扫描ct = json.loads(request.body).get("CT")

        exam.save()

        response['msg'] = 'success'
        response['error_num'] = 0

    except Exception as e:
        print(e)
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response)


@csrf_exempt
@require_http_methods(["POST"])
def sign(request):
    response = {}
    try:
        pname = json.loads(request.body).get("name")
        print("sign pname: {}".format(pname))

        curP = Patient.objects.filter(name=pname) # 查询患者记录,包含了满足条件 name=pname 的 Patient 模型的所有记录
        
        if curP.exists():
            pid = curP.first().id   # 获取查询集中的第一条记录

            all_exam = Exam.objects.all()   # 查询所有的体检项目
            all_pid = []

            for each_exam in all_exam:
                all_pid.append(each_exam.id)
            
            if pid in all_pid:  # 判断患者的ID是否在体检项目ID列表中
                Exam.objects.filter(id=pid).update(checkin="是")
                # 更新体检项目的checkin属性为 "是"

                response['msg'] = 'success'
                response['error_num'] = 0

            else:
                # errornum=3 还没有选择体检项目，请先去选择
                response['msg'] = 'failed'
                response['error_num'] = 3
                return JsonResponse(response)

        else:
            # errornum=2 还没有预约，请先去预约体检
            response['msg'] = 'failed'
            response['error_num'] = 2
            return JsonResponse(response)

    except Exception as e:
        pass

    return JsonResponse(response)


@csrf_exempt
@require_http_methods(["POST"])
def show_report(request):
    response = {}
    try:
        pname = json.loads(request.body).get("name")
        # print("pname: {}".format(pname))

        curP = Patient.objects.filter(name=pname)
        if curP.exists():
            pid = curP.first().id
            all_result = Result.objects.all()
            all_pid = []
            for curR in all_result:
                all_pid.append(curR.id)

            # errornum=2 还没有进行体检项目预约
            if pid not in all_pid:
                response['msg'] = 'failed'
                response['error_num'] = 2
                return JsonResponse(response)
        else:
            # errornum=3 体检仍未完成请等待
            response['msg'] = 'failed'
            response['error_num'] = 3
            return JsonResponse(response)

        # 提取体检结果
        report = Result.objects.filter(id=pid)

        proj_list = ['一般项目', '内科', '外科', '眼科', '耳鼻喉', '口腔科', '静态心电图ecg', '妇科', '尿常规12项', '血常规18项', '肝功能', '血脂', '肾功能',
                     '血糖', '肿瘤标志物c12', '幽门螺旋杆菌检测', '高清彩色多普勒b超', '电子计算机断层扫描ct']

        report_list = [val if val is not None else "NONE" for val in report.values_list(*proj_list)[0]]
        '''
            仅包含在proj_list 中
            values_list方法用于 获取模型所有报告的对应字段的值
            如果 val 不为 None, 则保持原值;
            如果 val 为 None, 则替换为字符串 "NONE"
        '''
        print(report_list)
        '''
           ['NONE', '滕江-各项均正常', 'NONE', '别丹-不正常', 'NONE', 'NONE', 'NONE', 'NONE', 
           'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE']
        '''

        report_list_list = list(report_list)
        print(report_list_list)
        '''
            ['NONE', '滕江-各项均正常', 'NONE', '别丹-不正常', 'NONE', 'NONE', 'NONE', 'NONE', 
            'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE']
        '''

        # print(proj_list)
        # 把没有体检的项目去除
        while True:
            for index in range(len(report_list_list)):
                if report_list_list[index] == "NONE":
                    del report_list_list[index]
                    del proj_list[index]
                    break

            if "NONE" not in report_list_list:
                break
        print(report_list_list)
        '''
            ['滕江-各项均正常', '别丹-不正常']
        '''

        print(proj_list)
        '''
            ['内科', '眼科']
        '''
        # 把医生姓名和检查结果再分离开
        doctor_list = []
        result_list = []
        for report in report_list_list:
            form = report.split('-')[0]
            late = report.split('-')[1]
            doctor_list.append(form)
            result_list.append(late)

        print(result_list)
        '''
            ['各项均正常', '不正常']
        '''

        result_list = tuple(result_list)

        response['result'] = result_list
        response['doctor'] = doctor_list
        response['project'] = proj_list
        response['msg'] = 'success'
        response['error_num'] = 0

    except Exception as e:
        print(e)
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response, safe=False)
