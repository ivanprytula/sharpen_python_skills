VAT_MIN = 20


def positional_only_args(price, /, vat_tax: float, discount: float) -> float:
    if vat_tax < VAT_MIN:
        return price - (price * (discount / 100))


# print(positional_only_args(5, vat_tax=12.5))
# # TypeError: positional_only_args() missing 1 required positional argument: 'discount'

# print(positional_only_args(5, discount=12.5))
# # TypeError: positional_only_args() missing 1 required positional argument: 'vat_tax'
# print(positional_only_args(5, 12.5))
print(positional_only_args(5, vat_tax=17, discount=1.5))  # OK: 4.925
# # TypeError: positional_only_args() missing 1 required positional argument: 'discount'
# print(positional_only_args(5, 12.5, 3.6))  #  4.82


def keyword_only_args(price, *, vat_tax: float, discount: float) -> float:
    if vat_tax < VAT_MIN:
        return price - (price * (discount / 100))
# print(keyword_only_args(50, vat_tax=12.5, discount=2.5))  # OK: 48.75


# print(keyword_only_args(5, vat_tax=12.5))
# # TypeError: keyword_only_args() missing 1 required keyword-only argument: 'discount'
# print(keyword_only_args(5, 12.5))  # TypeError: keyword_only_args() takes 1 positional argument but 2 were given
