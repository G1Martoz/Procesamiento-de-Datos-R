# --- ACTIVIDAD CLASE 6: PROCESAMIENTO DE DATOS ---
# Alumno: Martín Osuna

# 1. CREACIÓN DEL DATAFRAME (Datos ficticios de ventas)
meses <- c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio")
ventas_unidades <- c(120, 150, 110, 180, 200, 190)
precio_unitario <- c(8500, 8500, 9000, 9000, 9500, 9500)
costo_insumos <- c(4000, 4200, 4500, 4500, 4800, 5000)

pizzeria_df <- data.frame(
  Mes = meses,
  Unidades = ventas_unidades,
  Precio = precio_unitario,
  Costo = costo_insumos
)

# 2. MANIPULACIÓN DE DATOS (Añadir columnas)
# Calculamos el Ingreso Total y la Ganancia Neta por unidad
pizzeria_df$Ingreso_Total <- pizzeria_df$Unidades * pizzeria_df$Precio
pizzeria_df$Ganancia_Unidad <- pizzeria_df$Precio - pizzeria_df$Costo

# 3. FILTRADO Y ORDENAMIENTO
# Filtramos meses con ventas superiores a 140 unidades
meses_top <- subset(pizzeria_df, Unidades > 140)

# Ordenamos el dataframe por Ganancia de mayor a menor
pizzeria_df_ordenado <- pizzeria_df[order(-pizzeria_df$Ingreso_Total), ]

# 4. ESTADÍSTICA DESCRIPTIVA
summary_datos <- summary(pizzeria_df)
print(summary_datos)

# 5. GENERACIÓN DE GRÁFICOS (Para el informe)
barplot(pizzeria_df$Unidades, names.arg = pizzeria_df$Mes, 
        main = "Ventas por Mes", col = "orange", ylab = "Unidades")

hist(pizzeria_df$Ingreso_Total, main = "Distribución de Ingresos", 
     col = "lightblue", xlab = "Rango de Ingresos")