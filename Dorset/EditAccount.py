from django.db import connection
from django.db.utils import OperationalError
from tkinter import *
import ctypes  # An included library with Python install.
import config # import global variables for form
from config import database

def editrecord(passedidnumber):
    global id
    global fn
    global ln
    global ad
    global si

    try:
        mydb = database.connect_db()
        mycursor = connection.cursor()
        passedid = (passedidnumber, )
        database.connect_selectstudent(mycursor,passedid)
        record = mycursor.fetchone()
        id = record[0]
        fn = record[1]
        ln = record[2]
        ad = record[3]
        si = record[4]

    except OperationalError:
        connected = False

    finally:
        connected = True

    ## Use of global variables makes them available in all functions
    global root
    root=Tk()
    root.title("Student Database")
    root.geometry("450x400")
    root.config(bg="pink")
    root.resizable(0,0)

    Label(root, text='Please Edit your Student Details', bd=5,font=('arial', 12, 'bold'), relief="groove", fg="white",
    bg="blue",width=300).pack()

    # added root to StringVar to get form working properly
    config.id = StringVar(root,id)
    config.firstname = StringVar(root,fn)
    config.lastname = StringVar(root,ln)
    config.address = StringVar(root,ad)
    config.balance = StringVar(root,si)

    Label(root, text="").pack()
    Label(root, text="ID :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.id,state=DISABLED).pack()
    Label(root, text="").pack()
    Label(root, text="Firstname :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.firstname).pack()
    Label(root, text="Lastname :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.lastname).pack()
    Label(root, text="Address :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.address).pack()
    Label(root, text="").pack()
    Label(root, text="Balance :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.balance,state=DISABLED).pack()
    Label(root, text="").pack()

    Button(root, text="Store to Dbase", bg="blue", fg='white', relief="groove", font=('arial', 12, 'bold'), command=writerecordtodatabase).pack()
    Button(root, text="Exit", bg="blue", fg='white', relief="groove", font=('arial', 12, 'bold'), command=Exit).pack()

    Label(root, text="")

    root.mainloop()

def writerecordtodatabase():
    try:
        mydb = database.connect_db()
        mycursor = connection.cursor()
        database.connect_updateeditstudent(mycursor,config.firstname.get(),config.lastname.get(),config.address.get(), config.balance.get(),config.id.get())
        
    except OperationalError:
        connected = False

    finally:
        connected = True
    root.destroy()
def Exit():
    wayOut = Mbox('Student Database', 'Do you want to exit?', 1)
    if wayOut == 1 :
        root.destroy()
    return

def Mbox(title, text, style):
    return ctypes.windll.user32.MessageBoxW(0, text, title, style)
