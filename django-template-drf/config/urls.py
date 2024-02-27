# config/urls.py

from django.contrib import admin
from django.urls import path, re_path, include
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
]

urlpatterns += [
    re_path(r'', 
        ensure_csrf_cookie(TemplateView.as_view(template_name='index.html')), 
        name='index',
    )
]
