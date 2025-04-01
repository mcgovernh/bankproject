Create the virtual environment

creates a virtual environment in the project folder. Need to be clicked on the project. Create environment - .venv

Install Django in this environment

installs Django: 
python -m pip install Django ## must be in command prompt for this

pip install django==5.0a1

pip install mysqlclient

should be in the virtual environment. (.venv) before prompt

change the prompt location to mysite
(if you lose the (.venv) the development server won't run) to get it back go .venv/scripts/activate.bat

python manage.py runserver
