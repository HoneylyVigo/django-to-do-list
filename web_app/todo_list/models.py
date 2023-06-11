from django.db import models

# Create your models here.


class Comments(models.Model):
    comment_id = models.AutoField(primary_key=True)
    task = models.ForeignKey('Tasks', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    comment_text = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'comments'


class PersonalInformation(models.Model):
    personal_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    first_name = models.CharField(max_length=255, blank=True, null=True)
    last_name = models.CharField(max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    phone_number = models.CharField(max_length=255, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    profile_picture = models.ImageField(blank=True, upload_to="images/")
    social_media_links = models.TextField(blank=True, null=True)
    quotes = models.CharField(max_length=2255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'personal_information'

class Tasks(models.Model):
    task_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True)
    updated_at = models.DateTimeField(blank=True)

    class Meta:
        managed = True
        db_table = 'tasks'

class Categories(models.Model):
    category_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'categories'

class TaskCategory(models.Model):
    task = models.ForeignKey(Tasks, models.DO_NOTHING)
    category = models.ForeignKey(Categories, models.DO_NOTHING)

    class Meta:
        managed = True
        db_table = 'task_category'

class Users(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    email = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'users'
        
class TaskCategorys(models.Model):
    task = models.OneToOneField('Tasks', models.DO_NOTHING, primary_key=True)  # The composite primary key (task_id, category_id) found, that is not supported. The first column is selected.
    category = models.ForeignKey(Categories, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'task_category'
        unique_together = (('task', 'category'),)