import numpy as np
import matplotlib.pyplot as plt
print("Successfully imported")
x = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]).reshape(-1, 1)
y = np.array([1, 3, 2, 5, 7, 8, 8, 9, 10, 12]).reshape(-1, 1)
plt.scatter(x, y)
plt.show()
from sklearn.linear_model import LinearRegression
reg = LinearRegression().fit(x, y)

plt.scatter(x, y)

x_vals = x
y_vals = reg.intercept_[0] + reg.coef_[0] * x_vals

print(x_vals)
print(y_vals)
plt.plot(x_vals, y_vals, '--')
plt.show()

