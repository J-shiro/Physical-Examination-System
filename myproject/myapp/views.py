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


@csrf_exempt
@require_http_methods(['POST'])
def register(request):
    response = {}
    try:
        name = json.loads(request.body).get("name")
        password = json.loads(request.body).get("password")
        # Login.objects.create(name=name,password=password)
        print("name: {}, pwd: {}".format(name, password))
        reg = Login()
        reg.name = name
        reg.password = password
        reg.save()
        # print("name: {}, pwd: {}".format(login.name, login.password))

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
        print(request.body)
        name = json.loads(request.body).get("name")
        pwd = json.loads(request.body).get("password")
        all_login = Login.objects.all()
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


# Create your views here.
@csrf_exempt
@require_http_methods(['POST'])
def add_patient(request):
    # print("add.....................")
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
        # print(sex)
        # print(phone)

        patient.name = pname
        patient.age = age
        patient.sex = sex
        patient.marriage = marriage
        patient.id = id
        patient.phone = phone

        # print(patient.name)
        patient.save()
        # print("save.....................")
        # models.Patient.objects.create(name=name,age=age,sex=sex,marriage=marriage,pid=pid,phone=phone)
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
        curP = Patient.objects.filter(name=pname)
        if curP.exists():
            pid = curP.first().id
            all_exam = Exam.objects.all()
            all_pid = []
            for each_exam in all_exam:
                all_pid.append(each_exam.id)
            if pid in all_pid:
                Exam.objects.filter(id=pid).update(checkin="是")

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
        # print("result..............")
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
        # report_list = list(report.values_list(*proj_list))[0]
        report_list = [val if val is not None else "NONE" for val in report.values_list(*proj_list)[0]]
        print(report_list)

        report_list_list = list(report_list)
        print(report_list_list)

        print(proj_list)
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
        print(proj_list)

        # 把医生姓名和检查结果再分离开
        doctor_list = []
        result_list = []
        for report in report_list_list:
            form = report.split('-')[0]
            late = report.split('-')[1]
            doctor_list.append(form)
            result_list.append(late)

        print(result_list)

        # report_list = tuple(report_list_list)
        result_list = tuple(result_list)

        print(".....{}.\n".format(report_list))
        response['result'] = result_list
        response['doctor'] = doctor_list
        response['project'] = proj_list
        # print(response['report'])
        response['msg'] = 'success'
        response['error_num'] = 0

    except Exception as e:
        print(e)
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response, safe=False)
