# from django.conf.urls import url, include
from django.urls import path, include
from . import views

urlpatterns = [
    path('addp', views.add_patient, ),
    path('showp', views.show_patient, ),
    ]
