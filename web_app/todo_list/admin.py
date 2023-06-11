

# Register your models here.


from django.contrib import admin
from .models import Categories,Users,PersonalInformation,TaskCategory,Tasks,Comments
# Register your models here.

admin.site.register(Categories)
admin.site.register(PersonalInformation)
admin.site.register(TaskCategory)
admin.site.register(Tasks)
admin.site.register(Users)
admin.site.register(Comments)