# from django.conf.urls import url, include
from django.urls import path, include
from . import views

urlpatterns = [
    path('addp', views.add_patient, ),
    path('exam', views.choose_project, ),
    path('register', views.register, ),
    path('login', views.login, ),
    path('report', views.show_report, ),
    path('sign', views.sign,),
    ]
