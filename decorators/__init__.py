"""
https://medium.com/techtofreedom/9-python-built-in-decorators-that-optimize-your-code-significantly-bc3f661e9017
"""

# print([num**2 for num in range(5) if (num**2) % 2 == 0])

from functools import wraps
import time


"""
If you need to print the current time, use time.time() 									- non-monotonic, resolution 0.015625
If you need to calculate the execution time of a program, use
    time.monotonic() (low resolution) or 												- monotonic, resolution 0.015625
    time.perf_counter() (high resolution)												- monotonic, resolution 1e-07
If you need to precisely calculate the CPU time of a process, use time.process_time()	- monotonic, resolution 1e-07
If you need to precisely calculate the CPU time of a thread, use time.thread_time()		- monotonic, resolution 1e-07

"""

# Decorators are a good way to extend the functionality of existing code without having to change it.
# e.g.functools.lru_cache, which lets you transparently add memoization


def enumerator(f):
    def wrapper(*args, **kwargs):
        return enumerate(f(*args, **kwargs))

    return wrapper


def my_decorator(func):
    @wraps(func)
    def wrapper(*args, **kwds):
        print("Calling decorated function")
        # start_time = time.time()
        # start_time = time.monotonic()
        start_time = time.perf_counter()
        # start_time = time.process_time()
        # start_time = time.thread_time()

        result = func(*args, *kwds)

        # # end_time = time.time()
        # end_time = time.monotonic()
        end_time = time.perf_counter()
        # end_time = time.process_time()
        # end_time = time.thread_time()

        total_time = end_time - start_time

        # print(f"Function '{func.__name__}' took {time.gmtime(total_time)} seconds")
        print(f"Function '{func.__name__}' took {total_time} seconds")
        # print(f"Function '{func.__name__}' took {total_time:.4f} seconds")

        return result

    return wrapper


@my_decorator
def calculate_something(num):
    """Simple function that returns sum of all numbers up to the square of num."""
    return sum((x for x in range(0, num**2)))


def decor(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        f(*args, **kwargs)

    return wrapper


# =========================================
# Decorator that accepts parameters

def repeat(times):
    """call a function a number of times"""

    def outer_wrapper(fn):
        @wraps(fn)
        def inner_wrapper(*args, **kwargs):
            for _ in range(times):
                result = fn(*args, **kwargs)
            return result

        return inner_wrapper

    return outer_wrapper


@repeat(10)
def say(message):
    """print the message
    Arguments
        message: the message to show
    """
    print(message)


if __name__ == "__main__":
    # calculate_something(10)
    say("Hello")
