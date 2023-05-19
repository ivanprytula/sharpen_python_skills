# Programmer's Life

# Variables
days_in_week = 7
hours_in_day = 24
tasks = ["Coding", "Debugging", "Meetings"]
programming_language = "Python"
is_coffee_needed = True


# Functions
def work(day):
    if day == "Monday":
        print("Starting the week with coding!")
    elif day == "Friday":
        print("Wrapping up tasks and preparing for the weekend.")
    else:
        print("Another day of programming challenges.")


def have_coffee():
    print("Having a cup of coffee to fuel the code.")


def take_break(minutes):
    print(f"Taking a {minutes}-minute break to recharge.")


# Loop
for day in range(1, days_in_week + 1):
    print(f"Day {day}:")
    work("Monday")
    if is_coffee_needed:
        have_coffee()
    for task in tasks:
        print(f"Working on {task}...")
    take_break(15)
    work("Tuesday")
    # ... continue for other days of the week

# Data Types
experience_years = 5
salary = 50000.0
programming_languages = ["Python", "Java", "C++"]
work_life_balance = None

# Dictionary
programmer_info = {
    "name": "John",
    "age": 30,
    "experience": experience_years,
    "languages": programming_languages,
    "balance": work_life_balance,
}


# Classes and Objects
class Programmer:
    def __init__(self, name, age, experience, languages):
        self.name = name
        self.age = age
        self.experience = experience
        self.languages = languages

    def introduce(self):
        print(f"Hello, I'm {self.name}, a {self.age}-year-old programmer.")
        print(f"I have {self.experience} years of experience.")
        print(f"I'm proficient in {', '.join(self.languages)}.")


# Object Creation
programmer = Programmer(
    programmer_info["name"], programmer_info["age"], programmer_info["experience"], programmer_info["languages"]
)
programmer.introduce()

# File Operations
file = open("log.txt", "w")
file.write("Today's coding progress: Completed tasks.")
file.close()

# Exceptions
try:
    x = 10 / 0
except ZeroDivisionError:
    print("Error: Division by zero occurred!")
finally:
    print("Program execution completed.")

# Keywords
# Note: Keywords are used implicitly throughout the code example.

# End of code example
