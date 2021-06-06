import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression




df = pd.read_csv("E:\DeepLearning\Admission_Predict.csv")
print(df.describe())
#print("-----------------------------------------------")
#print(df.describe())

cols_as_np = df[df.columns[1:]].to_numpy()
#print(cols_as_np)

y = cols_as_np[:, -1]
x = cols_as_np[:, :-1]

X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.33)

#print(X_train.shape)
#print(y_train.shape)
#print(X_test.shape)
#print(y_test.shape)
#print(y_train.shape)
plt.xlabel("GRE score")
plt.ylabel("Acceptance probability")
plt.scatter(X_train[:,0], y_train)
plt.show()

plt.xlabel("CGPA score")
plt.ylabel("Acceptance probability")
plt.scatter(X_train[:,-2], y_train)
plt.show()


plt.xlabel("TOEFEL score")
plt.ylabel("Acceptance probability")
plt.scatter(X_train[:,1], y_train)
plt.show()

plt.xlabel("University rating")
plt.ylabel("Acceptance probability")
plt.bar(X_train[:,2], y_train, color ='maroon', width = 0.3)
plt.show()

plt.xlabel("SOP")
plt.ylabel("Acceptance probability")
plt.bar(X_train[:,3], y_train, color ='maroon', width = 0.3)
plt.show()

plt.xlabel("LOR")
plt.ylabel("Acceptance probability")
plt.bar(X_train[:,3], y_train, color ='maroon', width = 0.3)
plt.show()

plt.xlabel("Research")
plt.ylabel("Acceptance probability")
plt.bar(X_train[:,-1], y_train, color ='maroon', width = 0.05)
plt.show()


model = LinearRegression().fit(X_train, y_train)
print("Coefficients :")
print(model.coef_)


print(model.score(X_test, y_test))

#print("Contributions")
#print("GRE score " + str( np.mean(X_train[:,0]) * model.coef_[0] )  ) ;
#print("TOEFEL score " + str( np.mean(X_train[:,1]) * model.coef_[1] )  ) ;