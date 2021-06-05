from numpy import equal
import pandas

df = pandas.read_csv("/users/gabriel/test_folder/test_database.csv", low_memory=False)

print(df.head())

df.drop(columns=["car_model", "number_plate", "car_model"], inplace=True)

print(df.head())

df.to_csv("test_database_test.csv", index=None)