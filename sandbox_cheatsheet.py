# import keyword

# print("keyword.kwlist:", keyword.kwlist)

# a = 1  # a variable


# def increment():
#     # a += 1  # UnboundLocalError: local variable 'a' referenced before assignment
#     b = a + 1  # works as usual
#     return b


# def increment2():
#     global a  # can make changes to global variable "a"
#     a += 1
#     return a


# print(increment())
# increment2()  # returns 2


# set_1 = set([1, 2, 4])

# print(set_1)

# set2 = set_1

# set2.add(5)


# print(set_1)
# print(id(set_1))
# print(set2)
# print(id(set2))

import copy

a = [[0, 1], [2, 3]]
aa = ['aaa', 'bbb']
b = copy.copy(a)
bb = copy.copy(aa)

print(id(a) == id(b))
print(id(aa) == id(bb))
# False

# b[1] = 100
bb[1] = 'ccc'
# print(a, b)
print(aa, bb)


# [[0, 1], [2, 3]] [[0, 1], 100]

# b[0][0] = -999
# print(a, b)
# [[-999, 1], [2, 3]] [[-999, 1], 100]
# print(id(a[0]) == id(b[0]))
# True
