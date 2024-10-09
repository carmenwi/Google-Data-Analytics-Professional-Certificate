# 1. Tratamiento de datos
```{r}
# Abrimos R Commander
library(Rcmdr)
#Cargamos la librería Readr
library(readr)
# Establecemos directorio de trabajo
setwd("C://Users/witsm/Desktop/G_Analyrtics/Proyecto Final/CSV")
# Cargamos nuestros datasets
datos_bellabeat <- read_csv("datos_bellabeat.csv")
dailyActivity_merged <- read_csv("dailyActivity_merged.csv")
hourlyCalories_merged <- read_csv("hourlyCalories_merged.csv")

# Cargamos librería Dplyr
library(dplyr)
# Generamos un dataset donde ver la media de variables para cada uno de los Ids
df_mean <- datos_bellabeat %>%
  group_by(Id) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

# Vemos con qué usuarios tratamos en el dataset
unique(datos_bellabeat$Id)

#Creamos un dataframe para cada usuario con sus datos
df_id1 <- dailyActivity_merged %>% filter(Id==1503960366) 
df_id2 <- dailyActivity_merged %>% filter(Id==1927972279) # más peso y sedentario
df_id3 <- dailyActivity_merged %>% filter(Id==4319703577) # más tiempo cama
df_id4 <- dailyActivity_merged %>% filter(Id==4558609924) # menos tiempo cama
df_id5 <- dailyActivity_merged %>% filter(Id==5577150313) # más calorías
df_id6 <- dailyActivity_merged %>% filter(Id==6962181067) # menos sedentario

# Dataset calorías/hora
# Cambiamos el formato a hora y numérico
hourlyCalories_merged$ActivityHour <- strptime(hourlyCalories_merged$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p")
hourlyCalories_merged$ActivityHour <- as.numeric(format(hourlyCalories_merged$ActivityHour, "%H"))

# Hora preferida para salir a andar
horas_andar <- hourlyCalories_merged %>% filter(Calories>=200)


# Analizamos personas con sobrepeso

# Filtramos por Id (previamente los IMCs fueron calculados en Python)
usuarios_sobrepeso <- hourlyCalories_merged %>% filter(Id==c("1927972279", "4319703577", "4558609924", "5577150313"))
# Filtramos para las horas de actividad moderada
horas_andar_sobrepeso <- usuarios_sobrepeso %>% filter(Calories>=200)
# Filtramos para las horas de actividad intensa
horas_correr_sobrepeso <- usuarios_sobrepeso %>% filter(Calories>=450)

# Hacemos lo mismo para usuarios sin sobrepeso

usuarios_NO_sobrepeso <- hourlyCalories_merged %>% filter(Id==c("1503960366", "6962181067"))
horas_andar_NOsobrepeso <- usuarios_NO_sobrepeso %>% filter(Calories>=100)
horas_correr_NOsobrepeso <- usuarios_NO_sobrepeso %>% filter(Calories>=250)

# Cambiamos el formato de Fecha-hora a Fecha en días
df_id4$ActivityDate <- as.Date(df_id4$ActivityDate, format = "%m/%d/%Y")
df_id4 <- df_id4[order(df_id4$ActivityDate), ]
# Creamos la nueva variable "Día"
df_id4$Dia <- as.numeric(as.factor(df_id4$ActivityDate))

```

#  2. Gráficos

### Diagrama de dispersión: Calories~WeightKg (Figura 4)
```{r}
scatterplot(Calories~WeightKg, regLine=FALSE, smooth=FALSE, boxplots=FALSE, xlab="Peso en kilogramos", ylab="Calorías quemadas", 
  main="Diagrama de dispersión de las variables WeightKg y Calories", cex=1.9, data=df_mean)
```


### Histograma: ActivityHour (Figura 5)
```{r}
with(datos_bellabeat, Hist(ActivityHour, scale="frequency", breaks="Sturges", col="lightgreen", xlab="Hora de actividad", 
  ylab="Frecuencia", main="Histograma de variable ActivityHour"))
```


### Diagrama de caja: ~ ActivityHour (Figura 6)
```{r}
Boxplot( ~ ActivityHour, data=datos_bellabeat, id=list(method="y"), ylab="Hora de actividad", col="lightgreen",
  main="Boxplot de variable ActivityHour")
```


### Histograma: ActivityHour con filtrado ≥200 de la variable Calories (Figura 7)
```{r}
with(horas_andar, Hist(ActivityHour, scale="frequency", breaks="Sturges", col="lightgreen", xlab="Horas de actividad", 
  ylab="Frecuencia", main="Histograma de variable ActivityHour con filtrado ≥200 de la variable Calories"))
```


### Histograma: ActivityHour con filtrado ≥200 de la variable Calories y personas con sobrepeso (Figura 10)
```{r}
with(horas_andar_sobrepeso, Hist(ActivityHour, scale="frequency",
breaks="Sturges", col="lightpink", xlab="Horas de actividad",
ylab="Frecuencia",
main="Horas actividad moderada en personas con sobrepeso"))
```


### Histograma: ActivityHour con filtrado ≥200 de la variable Calories y personas sin sobrepeso (Figura 11)
```{r}
with(horas_andar_NOsobrepeso, Hist(ActivityHour, scale="frequency",
breaks="Sturges", col="lightblue", xlab="Hora de actividad",
ylab="Frecuencia", main="Horas actividad moderada en personas saludables"))
```


### Histograma: ActivityHour con filtrado ≥450 de la variable Calories y personas con sobrepeso (Figura 12)
```{r}
with(horas_correr_sobrepeso, Hist(ActivityHour, scale="frequency",
breaks="Sturges", col="purple", xlab="Hora de actividad",
ylab="Frecuencia",
main="Horas de actividad intensa en personas con sobrepeso"))
```


### Histograma: ActivityHour con filtrado ≥450 de la variable Calories y personas sin sobrepeso (Figura 13)
```{r}
with(horas_correr_NOsobrepeso, Hist(ActivityHour, scale="frequency",
breaks="Sturges", col="blue", xlab="Hora de actividad",
ylab="Frecuencia",
main="Horas de actividad intensa en personas saludables"))
```


### Gráfica lineal: Calories by Dia de usuario con Id 4558609924 (Figura 14)
```{r}
with(df_id4, lineplot(Dia, Calories))
```

```{r echo=FALSE}
# incluya este fragmento de código literalmente para especificar las opciones
knitr::opts_chunk$set(comment=NA, prompt=TRUE, out.width=750, fig.height=8, fig.width=8)
library(Rcmdr)
library(car)
library(RcmdrMisc)
```

