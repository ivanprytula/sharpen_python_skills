from dataclasses import dataclass


@dataclass
class Point:
    """The @dataclass decorator (introduced in Python 3.7) can automatically generate several special methods
    for a class, such as __init__, __repr__, __eq__, __lt__, and so on.

    Therefore, it can save us lots of time from writing these basic methods.
    If a class is primarily used to store data, the @dataclass decorator is our best friend.
    """

    x: float
    y: float


point = Point(1.0, 2.0)
print(point)
# Point(x=1.0, y=2.0)
