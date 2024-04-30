from django.urls import path
from . import views
from .views import customer_add

urlpatterns = [
    # path('wbsite/', views.homepage, name='homepage'),
    path('website/', views.index, name='index'),
    
    path('website/menu/',views.menu,name='menu'),
    path('website/manager/',views.manager,name='manager'),
    path('website/chef/',views.chef,name='chef'),
    path('website/server/',views.server,name='server'),
    path('website/customer/',views.customer,name='customer'),
    path('website/dining_supervisor/',views.dining_supervisor,name='dining_supervisor'),

    # path("/", views.insertcust, name="insertcust"),
    # path("<int:members><int:cust_id>/", views.allocatingtable, name="allocatingtable"),
    # path("<int:oid><int:foodid><int:quan>/", views.insertingintoorderitems, name="insertingintoorderitems"),
    # path("<int:sno>/", views.chefdone, name="chefdone"),
    # path("<int:cust_id><string:pm>/", views.billing, name="billing"),
    # path("<int:billno>/", views.displaybill, name="displaybill"),
    path('website/manager/view_all_employees/', views.view_all_employees, name='view_all_employees'),
    path('website/manager/menu/', views.menu, name='menu'),
    path('website/customer_add/', customer_add, name='customer_add'),
    path('website/allocating_table/',views.allocating_table,name="allocating_table"),
    path('website/customer/menu/', views.menu, name='menu'),
]


