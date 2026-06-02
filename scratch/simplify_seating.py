import fractions
import math

num = 1106520912 * math.factorial(5) * math.factorial(3) * math.factorial(2) * math.factorial(14)
den = math.factorial(24)

f = fractions.Fraction(num, den)
print("Fraction:", f)
print("Decimal:", float(f))
