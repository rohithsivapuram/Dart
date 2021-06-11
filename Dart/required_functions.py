import datetime

MIN_YEAR = 2017


def remove_nr(data):  # removes nr and na values
    remove = []
    commodity_name = data.columns[1]
    for i, j in enumerate(data[commodity_name], 0):
        if j == "NR" or j == commodity_name:
            remove.append(i)
    data.drop(labels=remove, axis=0, inplace=True)
    data.dropna(axis=0, inplace=True)


def get_next_days(start_date, days):
    nextdays = []
    start_date = start_date.replace(hour=0, minute=0, second=0, microsecond=0)
    for i in range(days):
        start_date = start_date + datetime.timedelta(days=1)
        nextdays.append(start_date)
    return nextdays


def predict(now, days, data):
    this_day_that_year = {}  # stores dates
    that_day_data = {}
    commodity = data.columns[0]
    prediction = {}
    price2020 = {}
    price2019 = {}
    price2018 = {}
    # price2017 = {}

    next_days = get_next_days(now, days)

    for days in next_days:

        #  store dates  and year wise prices
        # this_day_that_year[2017] = days.replace(year=2017)  # data type may be changed further
        this_day_that_year[2018] = days.replace(year=2018)  # changeable
        this_day_that_year[2019] = days.replace(year=2019)  # only for 3 years
        this_day_that_year[2020] = days.replace(year=2020)

        for year in sorted(this_day_that_year.keys()):
            temp_date = this_day_that_year[year]
            while temp_date not in data.index and temp_date.year >= MIN_YEAR:
                temp_date = temp_date - datetime.timedelta(days=1)
            that_day_data[year] = data.loc[temp_date, "Arrivals":].tolist()

        # price2017[this_day_that_year[2017]] = that_day_data[2017]
        price2018[this_day_that_year[2018].date()] = that_day_data[2018]
        price2019[this_day_that_year[2019].date()] = that_day_data[2019]
        price2020[this_day_that_year[2020].date()] = that_day_data[2020]

        price_list = []

        for key in sorted(that_day_data.keys()):
            price_list.append(that_day_data[key][3])

        average = sum(price_list) / len(price_list)
        percentage_change = []
        for i in range(0, len(price_list) - 1):
            percentage_change.insert(i, ((price_list[i + 1] / price_list[i]) - 1))

        average_change = sum(percentage_change) / len(percentage_change)

        if average_change > 0.05:
            price_predicted = round(average + (price_list[-1] * average_change), 2)
        else:
            price_predicted = round(average + (price_list[-1] * 0.05), 2)
        # prediction.append((days, price_predicted))
        prediction[days] = price_predicted
    return prediction, price2018, price2019, price2020
