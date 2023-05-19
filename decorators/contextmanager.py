from contextlib import contextmanager


# with open("test.txt", "w") as f:
#     f.write("Yang is writing!")


@contextmanager
def file_manager(filename, mode):
    print("The file is opening...")
    file = open(filename, mode)
    yield file
    print("The file is closing...")
    file.close()


with file_manager("test.txt", "w") as f:
    f.write("Yang is writing!")
# The file is opening...
# The file is closing...
