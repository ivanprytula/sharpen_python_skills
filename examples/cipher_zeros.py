def Cipher_Zeroes(N):
    num_int = int(N)

    # NB: edge case
    if num_int == 0:
        return int(bin(2)[2:])

    if 1 <= num_int <= 10**1000:
        count = 0

        while num_int > 0:
            if num_int % 10 == 0 or num_int % 10 == 6 or num_int % 10 == 9:
                count += 1
            elif num_int % 10 == 8:
                count += 2
            num_int //= 10
        if count % 2 == 0 and count > 0:
            count -= 1
        elif count % 2 == 1:
            count += 1
        return int(bin(count)[2:])
    else:
        raise Exception("Number of points violates constraint for allowed range.")


# print(Cipher_Zeroes("565"))  # 10
# print(Cipher_Zeroes("8200"))  # 11
# print(Cipher_Zeroes("4900"))  # 100
# print(Cipher_Zeroes("7481"))  # 1
# print(Cipher_Zeroes("0"))  # 10
# print(Cipher_Zeroes("-1"))  # RuntimeError:
print(Cipher_Zeroes("111"))


def Cipher_Zeroes_variation(N):
    num_int = int(N)

    # NB: edge case
    if num_int == 0:
        return int(bin(2)[2:])

    visible_zeros_mapping = {(0, 6, 9): 1, (8,): 2}

    if 1 <= num_int <= 10**1000:
        count = 0
        for number in N:
            for key, value in visible_zeros_mapping.items():
                if int(number) in key:
                    count += value

        if count % 2 == 0 and count > 0:
            count -= 1
        elif count % 2 == 1:
            count += 1
        return int(bin(count)[2:])
    else:
        raise Exception("Number of points violates constraint for allowed range.")


print("--------------------------------------------------")
print("--------------------------------------------------")
# print(Cipher_Zeroes_variation("555"))  # 10
# print(Cipher_Zeroes_variation("8200"))  # 11
# print(Cipher_Zeroes_variation("4900"))  # 100
# print(Cipher_Zeroes_variation("7481"))  # 1
# print(Cipher_Zeroes_variation("0"))  # 10
# print(Cipher_Zeroes_variation("-1"))  # RuntimeError:
