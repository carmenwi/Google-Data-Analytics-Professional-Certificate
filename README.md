# Google-Data-Analytics-Professional-Certificate
Proyecto final del curso Google Data Analytics Professional Certificate.

## 1. Descripción de la tarea empresarial

En este caso práctico planteado en el Curso de Análisis de Datos de Google, analizaremos datos públicos recogidos por relojes inteligentes de la empresa FitBit, con el objetivo de **identificar patrones que ayuden a la empresa Bellabeat a mejorar sus dispositivos inteligentes**.

Bellabeat se trata de una empresa comprometida con mejorar la salud y bienestar de las mujeres. Para ello, cuenta con varios dispositivos de seguimiento que se conectan a su propia aplicación, lo que permite a sus clientes hacer un seguimiento de datos relacionados con su salud, como su actividad física o sueño.

En este análisis, responderemos las siguientes cuestiones:

- 1. ¿Cuáles son algunas tendencias de uso de los dispositivos inteligentes?

- 2. ¿Cómo se podrían aplicar estas tendencias a los clientes de Bellabeat?

- 3. ¿Cómo podrían ayudar estas tendencias a influir en la estrategia de marketing de Bellabeat?

## 2. Fuentes de datos utilizadas

Para extraer los datos de los relojes inteligentes de la empresa Fitbit de distintos usuarios, he extraido en Kaggle varios conjuntos de datos de dominio público. El enlace para acceder a ellos es el siguiente: https://www.kaggle.com/datasets/arashnic/fitbit

Estos *datasets* fueron generados por los participantes de una encuesta distribuida a través de Amazon Mechanical Turk entre el 3 y el 5 de diciembre de 2016. En ellos se encuentra información de seguimiento de 30 usuarios de Fitbit incluidos los datos de salida por minuto de actividad física, frecuencia cardíaca y monitoreo del sueño. Las observaciones abarcan del 12 de abril de 2016 al 12 de mayo de 2016.

Las variables que serán objeto de este análisis son las siguientes:

1 - Conjunto de datos “dailyActivity_merged.csv”:

- Id: Número de identificación único
- Calories: Calorías quemadas
- SedentaryMinutes: Minutos en los que no hay actividad de movimiento
- TotalDistance: Distancia recorrida en kilómetros
- TotalTimeInBed: Tiempo total en minutos pasados en la cama
- WeightKg: Peso en kilogramos
- ActivityHour: Hora de actividad

Todas estas variables corresponden a las distintas observaciones para cada individuo en un día.

2 - Conjunto de datos “hourlyCalories_merged.csv”:

- ActivityHour: Fecha y hora de actividad
- Calories: Calorías quemadas

Miden cada hora las calorías quemadas por el usuario.

3 - Conjunto de datos "weightLogInfo_merged.csv”

- BMI: Índice de Masa Corporal (IMC)

De manera manual o automática se mide el IMC del usuario.

## 3. Herramientas para la preparación y manipulación de datos

Para tratar los datos he usado las siguientes herramientas:

- Jupyter Notebook y Python: He creado un informe en Jupyter Notebook intercalando código en Python con comentarios acerca de los resúmenes numéricos y gráficos, incluyendo información sobre este proyecto. Para ello, he utilizado las librerías Pandas, Matplotlib y Seaborn.
    
    Puedes consultar el informe en: https://github.com/carmenwi/Google-Data-Analytics-Professional-Certificate/blob/main/Notebook_Informe_Python.ipynb
    
- RStudio: He urilizado el software de R para generar ciertos gráficos que he incluido en el informe en Python. Para crear estos gráficos, he hecho uso de la interfaz gráfica de R Commander y de la librería Dplyr para el filtrado de datos.
    
    Puedes consultar el informe en: https://github.com/carmenwi/Google-Data-Analytics-Professional-Certificate/blob/main/R_informe_markdown.pdf
