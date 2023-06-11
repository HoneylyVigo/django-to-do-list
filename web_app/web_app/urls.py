"""
URL configuration for web_app project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from todo_list import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.signin, name='root'), 
    path('signup/', views.signup, name='signup'),
    path('signup-process/', views.signup_process, name='signup_process'),
    path('signin/', views.signin, name='signin'),
    path('signin-process/', views.signin_process, name='signin_process'),
    path('personal-info/', views.personal_info, name='personal_info'),
    path('process-personal-info/', views.process_personal_info, name='process_personal_info'),
    path('profile/', views.profile, name='profile'),
    path('add-task/', views.add_task, name='add_task'),
    path('index/', views.index, name='index'),
    path('add-comment/', views.add_comment, name='add_comment'),
    path('edit-task/<int:task_id>/', views.edit_task, name='edit_task'),
    path('delete-task/<int:task_id>/', views.delete_task, name='delete_task'),
    path('categories/', views.categories, name='categories'),
    path('category_tasks/', views.category_tasks, name='category_tasks'),
    path('edit-profile/', views.edit_profile, name='edit_profile'),
    path('logout/', views.logout, name='logout'),
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
