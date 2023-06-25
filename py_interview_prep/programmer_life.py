# Programmer's Life

# Data Types
"""
The principal built-in types are numerics, sequences, mappings, classes, instances and exceptions
"""

days_in_week_total: int = 7
days_in_week_short_names = ["Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"]
hours_in_day = 24
desired_hours_in_day = 36

hours_in_day, desired_hours_in_day = desired_hours_in_day, hours_in_day

experience_years = 5
wage_current = 5_000.0
appraisal_coefficient = experience_years + 3j

# "PEMDAS"
wage_optimistic = (wage_current * 2) * 4 / 2 + 100 - 50**2
# augmented assignment expressions, in-place: += -= *= /= **= //=

# 8 comparison operations: >, >=, <, <=, ==, !=, is, is, not
# NB: 'y' is evaluated only once: x < y <= w

wage_pessimistic = wage_current and 0.0
wage_realistic = wage_optimistic or wage_pessimistic

main_programming_language: str = """Python"""
programming_languages = ["Python", "Rust", """Golang"""]

pl1, pl2, pl3 = programming_languages
pl1, pl2, _ = programming_languages
pl1, *other = programming_languages

tasks: list = [
    "'Coding",
    "\\Debugging",
    "Meetings",
]

mutable_types: list = [list, dict, set, r"<class 'bytearray'>"]
immutable_types: tuple = (int, float, str, bool, bytes, tuple, r"<class 'frozenset'>")

IS_COFFEE_NEEDED: bool = True
IS_SUGAR_NEEDED = False

COFFEE_DEPOSIT = 1_000

final_beverage = IS_COFFEE_NEEDED + IS_SUGAR_NEEDED

coffee_cups_consumed = None
to_be_continued = ...

# Dictionary
programmer_info = {
    "name": f"John {main_programming_language}",
    "age": 30,
    "experience": f"{experience_years * 2:.3f}",
    "languages": programming_languages,
    "wage": wage_realistic,
}


# Functions
def function_name(arg) -> None:
    pass  # a function that does nothing (yet)


def work(day):
    global COFFEE_DEPOSIT
    if day == "Mon":
        COFFEE_DEPOSIT -= 100
        print("\tStarting the week with coding!")
    elif day == "Fri":
        print("Wrapping up tasks and preparing for the weekend.")
    else:
        COFFEE_DEPOSIT -= 50
        print("Another day of programming challenges.")
    print(COFFEE_DEPOSIT)


def have_coffee() -> None:
    print("Having a cup of coffee to fuel the code.")


def take_break(minutes: int = 5) -> None:
    print(f"Taking a {minutes}-minute break to recharge.")


# Loop
for index, day in enumerate(days_in_week_short_names):
    print(f"Day {index + 1}:")
    work(day)
    if IS_COFFEE_NEEDED:
        have_coffee()

    if not IS_COFFEE_NEEDED:
        break

    for _ in tasks:
        if _ == "Meetings":
            continue
        print(f"Working on {_}...")

    take_break(15)
else:
    print("loop finished normally, e.g. iterable 'exhausted'", "\U0001F600")
    print()
    COFFEE_DEPOSIT = 5

while COFFEE_DEPOSIT:
    print("foo spam eggs" * COFFEE_DEPOSIT)
    if COFFEE_DEPOSIT < 10:
        break
else:
    ...
    # will execute when the `condition` is False
    # and the loop runs normally without encountering the break/return statements


# Classes and Objects
class ClassName:
    pass  # a class with no methods (yet)


class B:
    def wow():
        raise NotImplementedError


class C(B):
    pass


class Programmer(ClassName, C):
    """
    Programmer.__mro__  -> tuple
    Programmer.mro()    -> list
    (<class '__main__.Programmer'>, <class '__main__.ClassName'>, <class '__main__.C'>,
    <class '__main__.B'>, <class 'object'>)
    """

    def __init__(self, name, age, experience, languages, wage):
        self._name = name
        self.age = age
        self.experience = experience
        self.languages = languages
        self.__wage = wage

    def introduce(self):
        print(f"Hello, I'm {self._name}, a {self.age}-year-old programmer.")
        print(f"I have {self.experience} years of experience.")
        print(f"I'm proficient in {', '.join(self.languages)}.")
        print(f"I expect to have {self.wage:.02f} monthly profit.")

    @property
    def wage(self):
        return self.__wage

    @wage.setter
    def wage(self, raise_):
        self.__wage += raise_


# Object Creation
programmer = Programmer(
    programmer_info["name"],
    programmer_info["age"],
    programmer_info["experience"],
    programmer_info["languages"],
    programmer_info["wage"],
)
programmer.introduce()
programmer.wage = 450

print(programmer.wage)

# File Operations, simple & error-prone way
file = open("log.txt", "w")
file.write("Today's coding progress: Completed tasks.")
file.close()

# File Operations, best way
with open("log.txt", "w") as f:
    f.write("wow")

# Exceptions
# EAPF idiomatic practice: “it’s easier to ask for forgiveness than permission”
try:
    x = 10 / 0
    # other code...
except ZeroDivisionError as exc:
    print("Error: Division by zero occurred!", f"{7:03}", exc)
except KeyError:
    # do this only if it's really required.
    # otherwise, errors mustn't be silenced
    pass
except Exception:
    # in 99.99% you'll be punished for this =/
    ...
else:
    print("`try` block executed w/o exception")
finally:
    print("Program execution completed.")
