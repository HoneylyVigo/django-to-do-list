from django.shortcuts import render

# Create your views here.

from django.shortcuts import render, redirect
from django.contrib import messages
from todo_list.models import Users,PersonalInformation,Categories,TaskCategory,Tasks,Comments
from django.http import HttpResponse



def signup(request):
    return render(request, 'signup.html')

def signup_process(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']

        user = Users(username=username, email=email, password=password)
        user.save()

        request.session['user_id'] = user.user_id
        request.session['username'] = username
        request.session['email'] = email
        request.session['logged_in'] = True

        return redirect('personal_info') 
    else:
        messages.error(request, 'Invalid request')
        return redirect('signup')

def signin(request):
    return render(request, 'signin.html')

def signin_process(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']

        try:
            user = Users.objects.get(email=email, password=password)
        except Users.DoesNotExist:
            messages.error(request, 'Invalid email or password')
            return redirect('signin')

        request.session['user_id'] = user.user_id
        request.session['email'] = email

        return redirect('index')  
    else:
        messages.error(request, 'Invalid request')
        return redirect('signin')

def personal_info(request):
    return render(request, 'personal-info.html')

def process_personal_info(request):
    if request.method == 'POST':
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        address = request.POST['address']
        phone_number = request.POST['phone_number']
        date_of_birth = request.POST['date_of_birth']
        quotes = request.POST['quotes']
        social_media_links = request.POST['social_media_links']
        profile_picture = request.FILES['profile_picture']
        user_id = request.session.get('user_id')

        personal_info = PersonalInformation(
            first_name=first_name,
            last_name=last_name,
            address=address,
            phone_number=phone_number,
            date_of_birth=date_of_birth,
            quotes=quotes,
            social_media_links=social_media_links,
            profile_picture=profile_picture,
            user_id=user_id
        )
        personal_info.save()

        return redirect('index')  
    else:
        return redirect('personal_info')

def index(request):
    user_id = request.session.get('user_id')
    tasks = Tasks.objects.filter(user_id=user_id)

    for task in tasks:
        task.comments = Comments.objects.filter(task_id=task.task_id)

    return render(request, 'index.html', {'tasks': tasks})

def add_task(request):
    if request.method == 'POST':
        user_id = request.session.get('user_id')
        title = request.POST['title']
        description = request.POST['description']
        status = request.POST['status']
        categories = request.POST.getlist('categories')

        task = Tasks.objects.create(title=title, description=description, status=status, user_id=user_id)
        task_id = task.task_id

        for category_id in categories:
            TaskCategory.objects.create(task_id=task_id, category_id=category_id)

        return redirect('index')  

    else:
        user_id = request.session.get('user_id')
        categories = Categories.objects.all()

        return render(request, 'add-tasks.html', {'user_id': user_id, 'categories': categories})

def add_comment(request):
    if request.method == 'POST':
        task_id = request.POST['task_id']
        comment_text = request.POST['comment_text']
        user_id = request.session.get('user_id')

        comment = Comments(user_id=user_id, task_id=task_id, comment_text=comment_text)
        comment.save()
    return redirect('index') 
    
def edit_task(request, task_id):
    task = Tasks.objects.get(task_id=task_id)

    if request.method == 'POST':
        task.title = request.POST['title']
        task.description = request.POST['description']
        task.status = request.POST['status']
        task.save()
        return redirect('index')  

    return render(request, 'edit-task.html', {'task': task})    

def delete_task(request, task_id):
    Tasks.objects.filter(task_id=task_id).delete()
    return redirect('index') 


def categories(request):
    categories = Categories.objects.all()
    return render(request, 'categories.html', {'categories': categories})

def category_tasks(request):
    category_id = request.GET.get('category_id')

    tasks = Tasks.objects.filter(taskcategory__category_id=category_id)

    response = ''
    if tasks:
        for task in tasks:
            response += f'<div class="task">'
            response += f'<h4>{task.title}</h4>'
            response += f'<p>{task.description}</p>'
            response += f'<p>Status: {task.status}</p>'
            response += f'<p>Created by: {task.user.username}</p>'
            response += f'</div>'
    else:
        response = '<p>No tasks found for this category.</p>'

    return HttpResponse(response)


def profile(request):
    user_id = request.session.get('user_id')
    personal_info = PersonalInformation.objects.filter(user_id=user_id).first()

    if personal_info:
        context = {
            'personal_info': personal_info
        }
        return render(request, 'profile.html', context)
    else:
        return redirect('index') 


def edit_profile(request):
    user_id = request.session.get('user_id')
    personal_info = PersonalInformation.objects.filter(user_id=user_id).first()

    if request.method == 'POST':
        # Update the personal information based on the form inputs
        personal_info.first_name = request.POST['first_name']
        personal_info.last_name = request.POST['last_name']
        personal_info.quotes = request.POST['quotes']
        personal_info.address = request.POST['address']
        personal_info.phone_number = request.POST['phone_number']
        personal_info.date_of_birth = request.POST['date_of_birth']
        personal_info.profile_picture = request.FILES['profile_picture']
        personal_info.social_media_links = request.POST['social_media_links']
        personal_info.save()

        return redirect('profile')  
    else:
        context = {
            'personal_info': personal_info
        }
        return render(request, 'edit-profile.html', context)
    
def logout(request):
    request.session.flush()
    return redirect('signin')    
