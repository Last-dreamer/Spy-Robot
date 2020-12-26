from django.shortcuts import render
import RPi.GPIO as GPIO
from time import sleep
from django.http import HttpResponse

GPIO.setmode(GPIO.BOARD)

# For left motor

lm_ena = 33 
lm_pos = 35
lm_neg = 37

# For right motor

rm_ena = 32
rm_pos = 38
rm_neg = 40



# Now setting up pins for the output mode for both the motors

GPIO.setup(lm_ena, GPIO.OUT)
GPIO.setup(lm_pos, GPIO.OUT)
GPIO.setup(lm_neg, GPIO.OUT)

GPIO.setup(rm_ena, GPIO.OUT)
GPIO.setup(rm_pos, GPIO.OUT)
GPIO.setup(rm_neg, GPIO.OUT)



def home(request):
    
    return render(request, 'test.html')


def forward(request):
   
# Left motor forward

    GPIO.output(lm_ena, GPIO.HIGH)
    GPIO.output(lm_pos, GPIO.HIGH)
    GPIO.output(lm_neg, GPIO.LOW)

# Right Motor Forward

    GPIO.output(rm_ena, GPIO.HIGH)
    GPIO.output(rm_pos, GPIO.HIGH)
    GPIO.output(rm_neg, GPIO.LOW) 
    return render(request, 'test.html')



def backward(request):
    

# Left Motor backward

    GPIO.output(lm_ena, GPIO.HIGH)
    GPIO.output(lm_pos, GPIO.LOW)
    GPIO.output(lm_neg, GPIO.HIGH)

# Right Motor backward

    GPIO.output(rm_ena, GPIO.HIGH)
    GPIO.output(rm_pos, GPIO.LOW)
    GPIO.output(rm_neg, GPIO.HIGH)

      
    print("backward")
    return render(request,'test.html')




def stoper(request):
    
    
    # left motor stop
    GPIO.output(lm_ena, GPIO.HIGH)
    GPIO.output(lm_pos, GPIO.LOW)
    GPIO.output(lm_neg, GPIO.LOW)

# right motor stop
    GPIO.output(rm_ena, GPIO.HIGH)
    GPIO.output(rm_pos, GPIO.LOW)
    GPIO.output(rm_neg, GPIO.LOW)
    
    print('stop')

    return render(request,'test.html')


def right(request):
    
    
# left motor forward

    GPIO.output(lm_ena, GPIO.HIGH)
    GPIO.output(lm_pos, GPIO.HIGH)
    GPIO.output(lm_neg, GPIO.LOW)

# right motor backward

    GPIO.output(rm_ena, GPIO.HIGH)
    GPIO.output(rm_pos, GPIO.LOW)
    GPIO.output(rm_neg, GPIO.HIGH)

    print('right')
    
    return render(request, 'test.html')



def left(request):
    
    # Left motor backward

    GPIO.output(lm_ena, GPIO.HIGH)
    GPIO.output(lm_pos, GPIO.LOW)
    GPIO.output(lm_neg, GPIO.HIGH)

# Right motor forward

    GPIO.output(rm_ena, GPIO.HIGH)
    GPIO.output(rm_pos, GPIO.HIGH)
    GPIO.output(rm_neg, GPIO.LOW)
      
    print('left')
    return render(request, 'test.html')

