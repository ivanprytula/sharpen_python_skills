def return_values():
    yield 1
    yield 2


# value = return_values()

# print(value.__next__())

gen_exp = (x**2 for x in range(10))
# print( gen_exp.__next__())
# print( gen_exp.__next__())
# print( gen_exp.__next__())
# print( gen_exp.__next__())
# print( gen_exp.__next__())

print(sum(x * x for x in range(10_000_000)))
