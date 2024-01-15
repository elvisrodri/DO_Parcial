import json
import zipfile
import os

api_token = {"username": "elvisrodriguezca", "key": "33371404d3bd146a1b7c2c73cdd265ca"}

## Conexion a Kaggle
with open("C:/Users/sami/.kaggle/kaggle.json", "w") as file:
    json.dump(api_token, file)

location = "C:/Users/sami/Desktop/devops/proyecto_parcial/dataset"

## Validar que la carpeta exista
if not os.path.exists(location):
    ## Crear carpeta
    os.mkdir(location)
else:
    ## Eliminar contenido de la carpeta antes de ejectuar
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            ## Eliminar archivos
            os.remove(os.path.join(root, name))
        for name in dirs:
            ## Eliminar carpetas
            os.rmdir(os.path.join(root, name))

## Descargar dataset
os.system(
    "kaggle datasets download -d henryshan/starbucks -p C:/Users/sami/Desktop/devops/proyecto_parcial/dataset"
)

## Descomprimir

os.chdir(location)
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file, "r")  ## Leer
    zip_ref.extractall()  ## Extraer
    zip_ref.close()  ## Cierra el archivo
