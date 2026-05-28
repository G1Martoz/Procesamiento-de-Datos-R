# ==============================================================================
# PROCESAMIENTO DE DATOS - COMPARATIVA EN PYTHON
# Alumno: Martín Ozuna
# ==============================================================================

import pandas as pd
import numpy as np
import statsmodels.api as sm
import statsmodels.formula.api as smf
import seaborn as sns
import matplotlib.pyplot as plt

# 1. Carga del Dataset (Traemos 'mtcars' desde los datasets públicos de R)
url = "https://gist.githubusercontent.com/seankross/a162348b23290289350a/raw/df60262c525359405d323fb2d16fa4942cfdc21d/mtcars.csv"
df_completo = pd.read_csv(url)

# Seleccionamos las mismas 4 variables: mpg, wt, hp, qsec
dataset_propio = df_completo[['mpg', 'wt', 'hp', 'qsec']]

print("--- ESTRUCTURA DEL DATASET EN PYTHON ---")
print(dataset_propio.head())


# ==============================================================================
# 2. Matriz de Correlación y Gráficos
# ==============================================================================

print("\n--- MATRIZ DE CORRELACIÓN ---")
matriz_cor = dataset_propio.corr()
print(round(matriz_cor, 4))

# Gráfico de dispersión múltiple (Equivalente al pairs() de R)
sns.pairplot(dataset_propio)
plt.suptitle("Diagrama de Dispersión Múltiple - Python", y=1.02)
plt.show()


# ==============================================================================
# 3. Modelos de Regresión Lineal Simple
# ==============================================================================

# Modelo A: mpg en función del Peso (wt)
# En Python (statsmodels) usamos la sintaxis OLS.from_formula para replicar el "mpg ~ wt" de R
reg_simple_wt = smf.ols('mpg ~ wt', data=dataset_propio).fit()
print("\n--- RESUMEN MODELO SIMPLE: mpg ~ wt ---")
print(reg_simple_wt.summary())

# Modelo B: mpg en función de los Caballos de fuerza (hp)
reg_simple_hp = smf.ols('mpg ~ hp', data=dataset_propio).fit()
print("\n--- RESUMEN MODELO SIMPLE: mpg ~ hp ---")
print(reg_simple_hp.summary())


# ==============================================================================
# 4. Modelos de Regresión Múltiple
# ==============================================================================

# Modelo Múltiple 1: mpg ~ wt + hp
modelo_mult1 = smf.ols('mpg ~ wt + hp', data=dataset_propio).fit()
print("\n--- RESUMEN MODELO MÚLTIPLE 1: mpg ~ wt + hp ---")
print(modelo_mult1.summary())

# Modelo Múltiple 2: mpg ~ wt + hp + qsec
modelo_mult2 = smf.ols('mpg ~ wt + hp + qsec', data=dataset_propio).fit()
print("\n--- RESUMEN MODELO MÚLTIPLE 2: mpg ~ wt + hp + qsec ---")
print(modelo_mult2.summary())
