FROM python:3.11 #parte de imgen que ya tiene python 3.11 instalado
COPY app.py . #copia el archivo app.py al contenedor
CMD ["python3", "app.py"] #comando para ejecutar el archivo app.py usando python3