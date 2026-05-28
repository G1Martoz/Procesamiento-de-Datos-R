# ==============================================================================
# PROCESAMIENTO DE DATOS - ACTIVIDAD SEMANA 8
# Alumno: Martín Ozuna
# ==============================================================================

# 1. Preparación del Dataset Propio (Al menos 4 variables)
# Usaremos el dataset nativo 'mtcars' seleccionando 4 variables continuas de interés:
# mpg (Millas por galón - Variable de estudio / dependiente)
# wt  (Peso del vehículo en miles de libras)
# hp  (Caballos de fuerza)
# qsec (Tiempo en recorrer 1/4 de milla)

dataset_propio <- mtcars[, c("mpg", "wt", "hp", "qsec")]

print("--- ESTRUCTURA DEL DATASET SELECCIONADO ---")
print(head(dataset_propio))


# ==============================================================================
# 2. Estudio de Correlación y Aplicación de Modelos Lineales Simples
# ==============================================================================

# Analizamos visual y analíticamente las relaciones (Réplica del método en la teoría)
print("--- MATRIZ DE CORRELACIÓN ---")
matriz_cor <- cor(dataset_propio)
print(round(matriz_cor, 4))

# Gráfico de dispersión múltiple para el informe visual
pairs(dataset_propio, main = "Diagrama de Dispersión Múltiple - mtcars")

# Aplicamos regresión lineal simple analizando los predictores por separado
# Modelo A: mpg en función del Peso (wt)
reg_simple_wt <- lm(mpg ~ wt, data = dataset_propio)
print("--- RESUMEN MODELO SIMPLE: mpg ~ wt ---")
print(summary(reg_simple_wt))

# Modelo B: mpg en función de los Caballos de fuerza (hp)
reg_simple_hp <- lm(mpg ~ hp, data = dataset_propio)
print("--- RESUMEN MODELO SIMPLE: mpg ~ hp ---")
print(summary(reg_simple_hp))


# ==============================================================================
# 3. Modelos de Regresión Múltiple (Comparación de Combinaciones)
# ==============================================================================

# Modelo Múltiple 1: Explicar mpg usando wt (Peso) y hp (Caballos de fuerza)
modelo_mult1 <- lm(mpg ~ wt + hp, data = dataset_propio)
print("--- RESUMEN MODELO MÚLTIPLE 1: mpg ~ wt + hp ---")
print(summary(modelo_mult1))

# Modelo Múltiple 2: Explicar mpg usando todas las variables (wt, hp, qsec)
modelo_mult2 <- lm(mpg ~ wt + hp + qsec, data = dataset_propio)
print("--- RESUMEN MODELO MÚLTIPLE 2: mpg ~ wt + hp + qsec ---")
print(summary(modelo_mult2))


# ==============================================================================
# 4. Selección Automatizada de Variables (Investigación Aplicada)
# ==============================================================================
print("--- SELECCIÓN AUTOMÁTICA USANDO STEPWISE BACKWARD (CRITERIO AIC) ---")
# Iniciamos con el modelo completo y removemos variables bajo el enfoque Backward
modelo_completo <- lm(mpg ~ wt + hp + qsec, data = dataset_propio)
modelo_optimo <- step(modelo_completo, direction = "backward")

print("--- RESUMEN DEL MODELO OPTIMIZADO FINAL ---")
print(summary(modelo_optimo))

