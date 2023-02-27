# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Doctor(models.Model):
    name = models.CharField(max_length=10)
    project = models.CharField(max_length=20)
    croom = models.IntegerField()
    dnum = models.IntegerField(primary_key=True)
    pwd = models.CharField(max_length=8)

    class Meta:
        managed = False
        db_table = 'doctor'


class Exam(models.Model):
    pid = models.CharField(primary_key=True, max_length=20)
    date = models.DateField()
    checkin = models.CharField(max_length=1)
    一般项目 = models.CharField(max_length=1)
    内科 = models.CharField(max_length=1)
    外科 = models.CharField(max_length=1)
    眼科 = models.CharField(max_length=1)
    耳_鼻_喉 = models.CharField(db_column='耳、鼻、喉', max_length=1)  # Field renamed to remove unsuitable characters.
    口腔科 = models.CharField(max_length=1)
    静态心电图_ecg_field = models.CharField(db_column='静态心电图(ECG)', max_length=1)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    妇科 = models.CharField(max_length=1)
    尿常规12项 = models.CharField(max_length=1)
    血常规18项 = models.CharField(max_length=1)
    肝功能 = models.CharField(max_length=1)
    血脂 = models.CharField(max_length=1)
    肾功能 = models.CharField(max_length=1)
    血糖 = models.CharField(max_length=1)
    肿瘤标志物_c12_field = models.CharField(db_column='肿瘤标志物(C12)', max_length=1)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    幽门螺旋杆菌检测 = models.CharField(max_length=1)
    高清彩色多普勒b超 = models.CharField(db_column='高清彩色多普勒B超', max_length=1)  # Field name made lowercase.
    电子计算机断层扫描_ct_field = models.CharField(db_column='电子计算机断层扫描(CT)', max_length=1)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.

    class Meta:
        managed = False
        db_table = 'exam'


class Patient(models.Model):
    name = models.CharField(max_length=10)
    age = models.IntegerField()
    sex = models.CharField(max_length=1)
    marriage = models.CharField(max_length=2)
    pid = models.CharField(primary_key=True, max_length=20)
    phone = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'patient'


class Result(models.Model):
    pid = models.CharField(primary_key=True, max_length=20)
    一般项目 = models.CharField(max_length=100, blank=True, null=True)
    内科 = models.CharField(max_length=100, blank=True, null=True)
    外科 = models.CharField(max_length=100, blank=True, null=True)
    眼科 = models.CharField(max_length=100, blank=True, null=True)
    耳_鼻_喉 = models.CharField(db_column='耳、鼻、喉', max_length=100, blank=True, null=True)  # Field renamed to remove unsuitable characters.
    口腔科 = models.CharField(max_length=100, blank=True, null=True)
    静态心电图_ecg_field = models.CharField(db_column='静态心电图(ECG)', max_length=100, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    妇科 = models.CharField(max_length=100, blank=True, null=True)
    尿常规12项 = models.CharField(max_length=100, blank=True, null=True)
    血常规18项 = models.CharField(max_length=100, blank=True, null=True)
    肝功能 = models.CharField(max_length=100, blank=True, null=True)
    血脂 = models.CharField(max_length=100, blank=True, null=True)
    肾功能 = models.CharField(max_length=100, blank=True, null=True)
    血糖 = models.CharField(max_length=100, blank=True, null=True)
    肿瘤标志物_c12_field = models.CharField(db_column='肿瘤标志物(C12)', max_length=100, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    幽门螺旋杆菌检测 = models.CharField(max_length=100, blank=True, null=True)
    高清彩色多普勒b超 = models.CharField(db_column='高清彩色多普勒B超', max_length=100, blank=True, null=True)  # Field name made lowercase.
    电子计算机断层扫描_ct_field = models.CharField(db_column='电子计算机断层扫描(CT)', max_length=100, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.

    class Meta:
        managed = False
        db_table = 'result'
