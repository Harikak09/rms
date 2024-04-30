
from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.template import loader
from django.db import connection
from datetime import date


# def login():
#     template = loader.get_template('welcome.html')
#     return HttpResponse(template.render())

def homepage(request):
    return render(request,'homepage.html')


def customer_add(request):
    if request.method == 'POST' and 'customer_add' in request.POST:
        f1 = request.POST.get('id')
        f2 = request.POST.get('fname')
        f3 = request.POST.get('lname')
        f4 = request.POST.get('cno')
        f5 = request.POST.get('mail')
        
        # Perform basic form validation
        if not all([f1, f2, f3, f4, f5]):
            return render(request, 'customers.html', {'error_message': 'All fields are required.'})
        
        try:
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO customer (id, fname, lname, cno, mail) VALUES (%s, %s, %s, %s, %s)", [f1, f2, f3, f4, f5])
        except Exception as e:
            return render(request, 'customers.html', {'error_message': 'An error occurred while adding the customer.'})
        
        # Redirect to a valid URL name
        return redirect(request,'homepage.html')  # Assuming you have a URL pattern named 'homepage'
    
    return render(request, 'customers.html')

def allocating_table(request):
    with connection.cursor() as cursor:
        cursor.execute("call Table_allocation(7,2)")
    return HttpResponse('Done table allocation')


def menu(request):
    with connection.cursor() as cursor:
        cursor.execute("set role manager")
        display_query = "SELECT food_id,food_name , price FROM food"
        cursor.execute(display_query)
        rows = cursor.fetchall()
        
        # Constructing a list of dictionaries for each row
        items = [{'id':row[0],'name': row[1], 'price': row[2]} for row in rows]

    return render(request, 'menu1.html', {'items': items})

def manager(req):
    with connection.cursor() as cursor:
        cursor.execute("set role manager")
    return render(req,'manager_view.html')

def server(req):
    return render(req,'server_view.html')

def dining_supervisor(req):
    return render(req,'dining_supervisor_view.html')

def customer(req):
    return render(req,'customer_view.html')

def chef(req):
    return render(req,'chef_view.html')

def index(req):
    return render(req,'index.html')

def allocatingtable(request):
    with connection.cursor() as cursor:
        cursor.execute("call insert_oi()")
    return HttpResponse(request,'Done table allocation')
# def insertingintoorderitems(request,oid,foodid,quan):
#     func_call="call insert_oi(oid,foodid,quan)"

# def chefdone(request,sno):
#     func_call="call chef_serve(sno)"
    
# def billing(request,cust_id,pm):
#     fun_call="bill(cust_id,pm)"

def view_all_employees(request):
    with connection.cursor() as cursor:
        cursor.execute("set role manager")
        display_query = "SELECT emp_fname || ' ' || emp_lname, designation, emp_salary FROM employee"
        cursor.execute(display_query)
        rows = cursor.fetchall()
        
        # Constructing a list of dictionaries for each row
        employees = [{'name': row[0], 'designation': row[1], 'salary': row[2]} for row in rows]

    return render(request, 'employees.html', {'employees': employees})


def my_view(request):
    with connection.cursor() as cursor:
        display="select * from employee "
        cursor.execute(display)
        rows = cursor.fetchall()

    # Pass the data to the template context
    return HttpResponse( f"'data_from_postgres':{ rows}")

