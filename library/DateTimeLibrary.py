import datetime
import random


class DateTimeLibrary:
    @staticmethod
    def get_next_time(minutes):
        next_hour = (datetime.datetime.now() + datetime.timedelta(minutes=int(minutes))).strftime("%I:%M %p")
        return next_hour

    @staticmethod
    def get_next_day():
        next_day = datetime.date.today() + datetime.timedelta(days=1)
        return next_day.strftime("%d/%m/%Y")

    @staticmethod
    def get_today():
        chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
        random_string = ''.join(random.choice(chars) for _ in range(6))
        today = datetime.date.today()
        return today.strftime("%d-%m-%Y") + "-" + random_string

    @staticmethod
    def get_schedule(value):
        switch_dict = {
            "today": 0,
            "next_day": 1,
            "next_week": 7
        }
        return switch_dict.get(value, 0)

    @staticmethod
    def get_event_date_time():
        list_time_event = []
        month = datetime.date.today().month
        year = datetime.date.today().year
        today = datetime.date.today().day
        next_day = today + 1
        if today == 28 and month == 2:
            next_day = 1
            month = month + 1
        else:
            if today == 30 and month in [4, 6, 9, 11]:
                next_day = 1
                month = month + 1
            else:
                if today == 31 and month in [1, 3, 5, 7, 8, 10, 12]:
                    next_day = 1
                    month = month + 1
        str_next_day: str
        str_month: str
        if next_day < 10:
            str_next_day = "0" + str(next_day)
        else:
            str_next_day = str(next_day)
        if month < 10:
            str_month = "0" + str(month)
        else:
            str_month = str(month)
        str_next_date = str_next_day + "/" + str_month + "/" + str(year)
        random_integer = random.randint(1, 5)
        time_start = "0" + str(random_integer) + ":00 pm"
        time_end = "0" + str(random_integer + 1) + ":00 pm"
        list_time_event.append(str_next_date)
        list_time_event.append(time_start)
        list_time_event.append(time_end)
        return list_time_event
