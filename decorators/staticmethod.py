class Student:
    """static methods are not bound to an instance or a class.
    They are included in a class simply because they logically belong there.

    Static methods are commonly used in utility classes that perform a group of related tasks,
    such as mathematical calculations.
    By organizing related functions into static methods within a class,
    our code will become more organized and easier to understand.
    """

    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name
        self.nickname = None

    def set_nickname(self, name):
        self.nickname = name

    @staticmethod
    def suitable_age(age):
        return 6 <= age <= 70


print(Student.suitable_age(99))  # False  !! can be called on instance/class but not bound to an instance or a class ->
# Both the class and the instance are ignored, and neither is passed implicitly as the first argument to the method
print(Student.suitable_age(27))  # True
print(Student("joe", "doe").suitable_age(27))  # True
