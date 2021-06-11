import pandas as pd
import datetime as dt
from required_functions import *
import os
import json

COMMODITY_FILE_NAME = "Commodities"
WRITE_RT_PATH = r"F:\develpoment\projetcs\raita_vahini\assets"
READ_RT_PATH = r"F:\MinorProject06\CSVFILES"
week_input = {
    1: 7,
    2: 14,
    3: 21,
    4: 28,
    5: 30

}
_commodities =[]
files = os.scandir(READ_RT_PATH)
for file in files:
    # print("{}".format(_commodities+file.name))
    _commodities.append(file.name[:len(file.name)-4])

print(_commodities)

if not os.path.isdir(os.path.join(WRITE_RT_PATH, COMMODITY_FILE_NAME)):
    os.mkdir(os.path.join(WRITE_RT_PATH, COMMODITY_FILE_NAME))

with open(os.path.join(WRITE_RT_PATH, COMMODITY_FILE_NAME, "Commodities.txt"), "w") as CommodityFile:
    CommodityFile.write("\n".join(_commodities))

# commodity = input("ENTER COMMODITY: ").upper()  # user input
# week = int(input("ENTER WEEK LENGTH: "))

for commodity in _commodities:
    for week in range(1, 6):

        days = week_input[week]  # user input

        data = pd.read_csv(os.path.join(READ_RT_PATH, commodity+".csv"),)
        # remove_nr(data)
        data.Date = pd.to_datetime(data["Date"], format="%d-%m-%Y")
        data.set_index("Date", inplace=True)
        cols = data.columns
        data[cols] = data.apply(pd.to_numeric, errors='coerce')
        start_date = dt.datetime.now() # system input
        print(days)
        forecast = predict(start_date, days, data)
        # print(forecast[2])
        forecast_data = {
            "predicted": forecast[0],
            "price2018": forecast[1],
            "price2019": forecast[2],
            "price2020": forecast[3],
            # "price2020": forecast[4]
        }
        print(commodity)
        print("PREDICTED", forecast_data["predicted"], sep="\n")
        print("2020", forecast_data["price2020"], sep="\n")
        print("2019", forecast_data["price2019"], sep="\n")
        print("2018", forecast_data["price2018"], sep="\n")
        # print("2017", forecast_data["price2017"], sep="\n")

        for x in forecast_data.keys():
            path = os.path.join(WRITE_RT_PATH, "Data")
            if not os.path.isdir(path):
                os.mkdir(path)

            with open(path + "\{}_week{}_{}.txt".format(commodity, week, x), "w") as file:
                lineNo = 1
                for date in forecast_data[x].keys():
                    if lineNo == 1:
                        file.write("{}:{}".format(date, forecast_data[x][date]))
                        lineNo += 1
                    else:
                        file.write("\n{}:{}".format(date, forecast_data[x][date]))


