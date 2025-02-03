from tkinter import *
import tkinter as tk
from django.db import connection
from django.db.utils import OperationalError
import ctypes  # An included library with Python install.
import config # import global variables for form
from config import database

def transferrecord(passedidnumber):
    global id
    global fn
    global ln
    global ad
    global si
    global wbalance
    global destid

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

    root=tk.Tk()
    root.title("Transfer Screen")
    root.geometry("550x450")
    root.config(bg="pink")
    root.resizable(0,0)

    # added root to StringVar to get form working properly
    config.id = StringVar(root,id)
    config.firstname = StringVar(root,fn)
    config.lastname = StringVar(root,ln)
    config.address = StringVar(root,ad)
    config.balance = StringVar(root,si)
    config.destid = StringVar(root,"")
    config.tbalance = StringVar(root,"")

    Label(root, text="").pack()
    Label(root, text="Source ID :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.id,state=DISABLED).pack()

    Label(root, text="Firstname :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.firstname,state=DISABLED).pack()
    Label(root, text="Lastname :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.lastname,state=DISABLED).pack()
    Label(root, text="Address :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.address,state=DISABLED).pack()
    Label(root, text="Balance Amount :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.balance,state=DISABLED).pack()

    Label(root, text="").pack()
    Label(root, text="Destination ID :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.destid).pack()
    Label(root, text="Transfer Amount :", fg="black", font=('arial', 12, 'bold')).pack()
    Entry(root, textvariable=config.tbalance).pack()

    Label(root, text="").pack()

    Button(root, text="Store to Dbase", bg="blue", fg='white', relief="groove", font=('arial', 12, 'bold'), command=writebalancetodatabase).pack()
    Button(root, text="Exit", bg="blue", fg='white', relief="groove", font=('arial', 12, 'bold'), command=Exit).pack()

    Label(root, text="")
    root.mainloop()

def writebalancetodatabase():
    try:
        # Update source balance
        sourcebalance = int(config.balance.get())
        transferamount = int('0' + config.tbalance.get()) ## crashes with empty text box
        transferbalance = str(sourcebalance - transferamount)

        mydb = database.connect_db()
        mycursor = connection.cursor()
        database.updatebalance(mycursor, transferbalance, config.id.get())

        # Get destination balance
        passedid = (config.destid.get(), )
        database.connect_selectstudent(mycursor,passedid)
        record = mycursor.fetchone()
        destinationbalance = str(int(record[4]) + transferamount)
        database.updatebalance(mycursor,destinationbalance,int(config.destid.get()))

        # Write to transaction table
        reference = 'Transfer from ' + str(config.id.get())
        database.updatetransactions(mycursor,config.id.get(),reference,transferamount,'',transferbalance)
        reference = 'Transfer to ' + str(config.destid.get())
        database.updatetransactions(mycursor,config.destid.get(), reference,'',transferamount,destinationbalance)

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
