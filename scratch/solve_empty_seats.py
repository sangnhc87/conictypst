def solve_c12():
    # m = 5, n_A = 2, n_B = 2, n_C = 1, n_D = 1, n_E = 4
    # t_AB, t_AC, t_AD, t_BC, t_BD, t_CD, t_AE, t_BE, t_CE, t_DE, t_EE >= 0
    # Equations:
    # t_AB + t_AC + t_AD + t_BC + t_BD + t_CD + t_AE + t_BE + t_CE + t_DE + t_EE = 5
    # t_AB + t_AC + t_AD + t_AE = 2
    # t_AB + t_BC + t_BD + t_BE = 2
    # t_AC + t_BC + t_CD + t_CE = 1
    # t_AD + t_BD + t_CD + t_DE = 1
    # t_AE + t_BE + t_CE + t_DE + 2*t_EE = 4
    
    import itertools
    import math

    results = []
    # variables list
    vars_names = ["t_AB", "t_AC", "t_AD", "t_BC", "t_BD", "t_CD", "t_AE", "t_BE", "t_CE", "t_DE", "t_EE"]
    
    # We can iterate over the variables within reasonable bounds
    for t_EE in range(3): # 2*t_EE <= 4
        for t_CD in range(2): # t_CD <= 1 (since n_C = n_D = 1)
            for t_CE in range(2 - t_CD):
                for t_DE in range(2 - t_CD):
                    for t_AC in range(2 - t_CD - t_CE):
                        for t_BC in range(2 - t_CD - t_CE - t_AC):
                            for t_AD in range(2 - t_CD - t_DE):
                                for t_BD in range(2 - t_CD - t_DE - t_AD):
                                    for t_AE in range(3):
                                        for t_BE in range(3):
                                            for t_AB in range(3):
                                                # check constraints
                                                if t_AB + t_AC + t_AD + t_AE != 2: continue
                                                if t_AB + t_BC + t_BD + t_BE != 2: continue
                                                if t_AC + t_BC + t_CD + t_CE != 1: continue
                                                if t_AD + t_BD + t_CD + t_DE != 1: continue
                                                if t_AE + t_BE + t_CE + t_DE + 2*t_EE != 4: continue
                                                if t_AB + t_AC + t_AD + t_BC + t_BD + t_CD + t_AE + t_BE + t_CE + t_DE + t_EE != 5: continue
                                                
                                                # Valid solution
                                                sol = {
                                                    "t_AB": t_AB, "t_AC": t_AC, "t_AD": t_AD, 
                                                    "t_BC": t_BC, "t_BD": t_BD, "t_CD": t_CD, 
                                                    "t_AE": t_AE, "t_BE": t_BE, "t_CE": t_CE, 
                                                    "t_DE": t_DE, "t_EE": t_EE
                                                }
                                                results.append(sol)
                                                
    print(f"--- BÀI C12: Found {len(results)} valid configurations ---")
    total_permutations = 0
    for idx, sol in enumerate(results):
        non_zero = {k: v for k, v in sol.items() if v > 0}
        # calculate M
        # M = 5! / product(t_ij!)
        num = 120
        den = 1
        for val in non_zero.values():
            den *= math.factorial(val)
        M_val = num // den
        total_permutations += M_val
        print(f"Sol {idx+1}: {non_zero} -> M = {M_val}")
    print(f"Total M for C12: {total_permutations}")

def solve_c13():
    # m = 5, n_A = 2, n_B = 2, n_C = 2, n_E = 4
    # t_AB, t_AC, t_BC, t_AE, t_BE, t_CE, t_EE >= 0
    # Equations:
    # t_AB + t_AC + t_BC + t_AE + t_BE + t_CE + t_EE = 5
    # t_AB + t_AC + t_AE = 2
    # t_AB + t_BC + t_BE = 2
    # t_AC + t_BC + t_CE = 2
    # t_AE + t_BE + t_CE + 2*t_EE = 4
    import math
    results = []
    for t_EE in range(3): # 2*t_EE <= 4
        for t_AE in range(3):
            for t_BE in range(3):
                for t_CE in range(3):
                    for t_AB in range(3):
                        for t_AC in range(3):
                            for t_BC in range(3):
                                if t_AB + t_AC + t_AE != 2: continue
                                if t_AB + t_BC + t_BE != 2: continue
                                if t_AC + t_BC + t_CE != 2: continue
                                if t_AE + t_BE + t_CE + 2*t_EE != 4: continue
                                if t_AB + t_AC + t_BC + t_AE + t_BE + t_CE + t_EE != 5: continue
                                sol = {
                                    "t_AB": t_AB, "t_AC": t_AC, "t_BC": t_BC,
                                    "t_AE": t_AE, "t_BE": t_BE, "t_CE": t_CE,
                                    "t_EE": t_EE
                                }
                                results.append(sol)
                                
    print(f"\n--- BÀI C13: Found {len(results)} valid configurations ---")
    total_permutations = 0
    for idx, sol in enumerate(results):
        non_zero = {k: v for k, v in sol.items() if v > 0}
        num = 120
        den = 1
        for val in non_zero.values():
            den *= math.factorial(val)
        M_val = num // den
        total_permutations += M_val
        print(f"Sol {idx+1}: {non_zero} -> M = {M_val}")
    print(f"Total M for C13: {total_permutations}")

solve_c12()
solve_c13()
