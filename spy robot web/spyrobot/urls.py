from . import views
from django.urls import path


urlpatterns = [

 path('home', views.home, name='home'),
 path('backward/', views.backward, name="backward"),
 path('forward/', views.forward, name='forward'),
 path('stoper/',views.stoper, name="stoper"),
 path('right/', views.right, name='right'),
 path('left', views.left, name="left"),
]
