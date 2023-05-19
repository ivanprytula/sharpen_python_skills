class Student:
    def __init__(self):
        self._score = 0

    @property
    def score(self):
        return self._score

    @score.setter
    def score(self, s):
        if 0 <= s <= 100:
            self._score = s
        else:
            raise ValueError("The score must be between 0 ~ 100!")


simple_student = Student()
print(simple_student.score)

simple_student.score = 99
print(simple_student.score)
# 99

simple_student.score = 999
# ValueError: The score must be between 0 ~ 100!
