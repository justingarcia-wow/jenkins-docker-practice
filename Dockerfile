# Parte de una imagen que ya tiene Python 3.11 instalado
FROM python:3.11

# Copia el archivo app.py al contenedor
COPY app.py .

# Comando para ejecutar el archivo app.py usando python3
CMD ["python3", "app.py"]
