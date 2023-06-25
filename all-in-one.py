# #!/usr/bin/env python3
"""A one line summary of the module or program, terminated by a period.
Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.
PEP = Python Enhancement Proposal

  Typical usage example:

  foo = ClassFoo()


  
  bar = foo.get_bar()
  


"""

# ####### 1). STL imports
import datetime  # noqa
import importlib  # noqa
import math  # noqa
import os  # noqa
import platform  # noqa
import random  # noqa
import sys  # noqa
from copy import copy, deepcopy  # noqa
from pprint import pprint  # noqa
from threading import local  # noqa
import keyword  # noqa

# ####### 2). 3rd-party packages
# from rich import print

# fyi: Such import style will cause issues with built-in func - if names match
# they will be overridden.
# from os import *

# ####### 3). Your own packages
# import < model_name > from < models_package >
from examples.example import bare_print_example

# Recommended
TOTAL = 100_000_000  # PEP 515
DEFAULT_NAME = "FULLY_UPPERCASE_UNDERSCORE"
# Don’t use magic numbers, give meaningful name to constants
DICE_SIDES = 4
GRAVITATIONAL_CONSTANT = 9.81  # meters per second squared, or "Big G"


module_level_str = "global variables should be all lowercase"
total_active_users = 105
countries = ["UK", "USA"]
capitals = (
    "Kyiv",
    "London",
)
first_name = "John"
last_name = "Doe"
creation_timestamp = 1621535852
# Always use the same vocabulary, prefixes/suffixes
client_first_name = "John"
client_last_name = "Doe"

# Write a full sentence in one-line comment with a period in the end.
multiline_comment = """
    Not a Module docstring \t but comment assigned to variable.\n
    This will be a second line if printed.
"""


class UpperCaseCamelCase:
    """Python's built-in classes, however are typically lowercase words"""

    # yes, we can skip pass keyword


# custom exception
class InputError(Exception):
    """Exception classes should end with `Error`"""

    pass


# Recommended
class PersonGood:
    """Do not add redundant context.

    Since we are already inside the Person class,
    there's no need to add the person_ prefix to every class variable.
    """

    def __init__(self, username, email, phone, address):
        # self.person_username = person_username
        self.username = username
        self.email = email
        self.phone = phone
        self.address = address


class Airplane:
    pyramid_giza = "pyramid of giza"  # Public
    _pyramid_giza = "pyramid of giza"  # Protected
    __pyramid_giza = "pyramid of giza"  # Private

    # Public
    def instance_method(self):
        print(f"Hello from {self.__class__.__name__}")

    # Protected
    def _draw_draft_protected(self):
        # vars() == locals() -> dict[str, Any]
        # vars(__object) == object.__dict__
        pass

    # Private
    def __draw_draft_private(self):
        """If a method name needs to be `mangled`, __ may begin its name."""
        # Airplane()._Airplane__draw_draft_private()
        pass

    @classmethod
    def class_method(cls):
        print(f"Hello from {cls.__name__}")

    @staticmethod
    def some_static_method():
        print(f"Hello from {Airplane.some_static_method.__name__}")

    def use_all_keywords(self):
        # is_hungry = True or "True"
        is_hungry = False
        fruit_bucket = ["apple", "strawberry", "lemon", "orange"]
        is_sleepy = True
        value_to_be_set = None

        if is_hungry:
            return bool(1)
        elif ("apple" in fruit_bucket) and not is_sleepy:
            return "Go shopping"
        elif value_to_be_set := len(fruit_bucket) > 1:
            print(locals())
            # return value_to_be_set
            return value_to_be_set
        else:
            return f"blah blah blah {value_to_be_set}"


if __name__ == "__main__":
    bare_print_example(name=first_name)

    # Airplane.some_static_method()
    airplane_obj = Airplane()
    print(airplane_obj.use_all_keywords())

    # print("keyword.kwlist:", keyword.kwlist)

    kwlist_l = [
        "as",
        "assert",
        "async",
        "await",
        "break",
        "class",
        "continue",
        "def",
        "del",
        "elif",
        "else",
        "except",
        "finally",
        "for",
        "from",
        "global",
        "if",
        "import",
        "in",
        "is",
        "lambda",
        "nonlocal",
        "not",
        "or",
        "pass",
        "raise",
        "return",
        "try",
        "while",
        "with",
        "yield",
    ]

    pass
