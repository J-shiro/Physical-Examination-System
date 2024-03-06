"""Patient_back URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""

from django.urls import path, include
from django.contrib import admin
from django.views.generic import TemplateView

urlpatterns = [
    path('admin/', admin.site.urls),    # 配置后台管理页面的 URL

    path('api/', include('myapp.urls')), # 配置 myapp 应用程序 URL
                                         # 使用 include 函数，引入 myapp.urls 模块中的 URL 配置

    path('index/', TemplateView.as_view(template_name="index.html")),   # index/ 映射到一个使用 TemplateView 渲染的静态 HTML 页面
]
