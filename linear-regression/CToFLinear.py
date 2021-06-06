import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
print("--- Imported packages --- ") 

df = pd.read_csv('E:\\DeepLearning\\training.csv')
print(df.describe())
print("--- Imported CSV ---")
x = np.array(df['Celsius'])
y = np.array(df['Fahrenheit'])

print("--- Plotting data ---")

plt.scatter(x, y, color ='r')
plt.show()


regr = LinearRegression()
  
regr.fit(x.reshape(-1,1), y.reshape(-1,1))

print(regr.intercept_)
print(regr.coef_)

yPredict = regr.coef_[0]*x + regr.intercept_
plt.scatter(x, y, color ='r')
plt.scatter(x, yPredict, color ='g')
plt.show()






