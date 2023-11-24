# Usa la imagen oficial de Python como base
FROM python:3.10-slim-buster

# Establece el directorio de trabajo en /app
COPY requirements.txt .
COPY app.py .
RUN apt-get update && apt-get install -y libgl1-mesa-glx
RUN apt-get update && apt-get install -y libglib2.0-0
RUN pip install opencv-python
RUN pip install -r requirements.txt
#RUN pip install --upgrade diffusers accelerate transformers
# Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["gunicorn", "app:app"]