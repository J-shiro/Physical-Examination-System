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
            response['error_num'] = 1 #???????????????
        else:
            response['msg'] = 'success'
            response['error_num'] = 0 #??????
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
        exam.checkin = '???'
        exam.???????????? = json.loads(request.body).get("normal")
        exam.?????? = json.loads(request.body).get("internal")
        exam.?????? = json.loads(request.body).get("external")
        exam.?????? = json.loads(request.body).get("eye")
        exam.????????? = json.loads(request.body).get("ent")
        exam.????????? = json.loads(request.body).get("mouth")
        exam.???????????????ecg = json.loads(request.body).get("ECG")
        exam.?????? = json.loads(request.body).get("gynecologial")
        exam.?????????12??? = json.loads(request.body).get("urine")
        exam.?????????18??? = json.loads(request.body).get("blood")
        exam.????????? = json.loads(request.body).get("liver")
        exam.?????? = json.loads(request.body).get("bloodfat")
        exam.????????? = json.loads(request.body).get("kidney")
        exam.?????? = json.loads(request.body).get("bloodsugar")
        exam.???????????????c12 = json.loads(request.body).get("C12")
        exam.???????????????????????? = json.loads(request.body).get("germ")
        exam.?????????????????????b??? = json.loads(request.body).get("Bmode")
        exam.???????????????????????????ct = json.loads(request.body).get("CT")

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
                Exam.objects.filter(id=pid).update(checkin="???")

                response['msg'] = 'success'
                response['error_num'] = 0

            else:
                # errornum=3 ?????????????????????????????????????????????
                response['msg'] = 'failed'
                response['error_num'] = 3
                return JsonResponse(response)

        else:
            # errornum=2 ???????????????????????????????????????
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
            # errornum=2 ?????????????????????????????????
            if pid not in all_pid:
                response['msg'] = 'failed'
                response['error_num'] = 2
                return JsonResponse(response)
        else:
            # errornum=3 ???????????????????????????
            response['msg'] = 'failed'
            response['error_num'] = 3
            return JsonResponse(response)

        # ??????????????????
        report = Result.objects.filter(id=pid)

        proj_list = ['????????????', '??????', '??????', '??????', '?????????', '?????????', '???????????????ecg', '??????', '?????????12???', '?????????18???', '?????????', '??????', '?????????',
                     '??????', '???????????????c12', '????????????????????????', '?????????????????????b???', '???????????????????????????ct']
        # report_list = list(report.values_list(*proj_list))[0]
        report_list = [val if val is not None else "NONE" for val in report.values_list(*proj_list)[0]]
        print(report_list)

        report_list_list = list(report_list)
        print(report_list_list)

        print(proj_list)
        # ??????????????????????????????
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

        # ??????????????????????????????????????????
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
