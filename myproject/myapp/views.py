# -*- coding: utf-8 -*-
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from django.core import serializers
import requests
import json

from .models import *


# Create your views here.
@csrf_exempt
@require_http_methods(['POST'])
def add_patient(request):
    print("add.....................")
    response = {}
    try:
        patient = Patient()
        name = json.loads(request.body).get("name")
        age = json.loads(request.body).get("age")
        sex = json.loads(request.body).get("sex")
        marriage = json.loads(request.body).get("marriage")
        pid = json.loads(request.body).get("id")
        # phone = request.POST.get("phone")
        phone = json.loads(request.body).get("phone")
        # print(sex)
        # print(phone)

        patient.name = name
        patient.age = age
        patient.sex = sex
        patient.marriage = marriage
        patient.pid = pid
        patient.phone = phone

        print(patient.name)
        patient.save()
        # print("save.....................")
        # models.Patient.objects.create(name=name,age=age,sex=sex,marriage=marriage,pid=pid,phone=phone)
        response['msg'] = 'success'
        response['error_num'] = 0

    except  Exception as e:
        print(e)
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response)

@csrf_exempt
@require_http_methods(["GET"])
def show_patient(request):
    response = {}
    try:
        # books = Book.objects.filter()
        print("all..................")
        patient = Patient.objects.all()
        print("response..................")
        response['list'] = json.loads(serializers.serialize("json", patient))
        print("patient: {}".format(patient))
        response['msg'] = 'success'
        response['error_num'] = 0
    except  Exception as e:
        print(e)
        response['msg'] = str(e)
        response['error_num'] = 1

    #return render(request, 'result.html', {'result': json})
    return JsonResponse(response)
