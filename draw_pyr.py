import matplotlib.pyplot as plt

a = 1.0
dx = 0.4
dy = 0.4
h = 1.5

B = (-a/2 - dx/2, -dy/2)
C = (a/2 - dx/2, -dy/2)
D = (a/2 + dx/2, dy/2)
A = (-a/2 + dx/2, dy/2)
S = (0, h)

plt.figure(figsize=(6,6))
plt.plot([B[0], C[0]], [B[1], C[1]], 'k-') # BC
plt.plot([C[0], D[0]], [C[1], D[1]], 'k-') # CD
plt.plot([D[0], A[0]], [D[1], A[1]], 'k--') # DA
plt.plot([A[0], B[0]], [A[1], B[1]], 'k--') # AB

plt.plot([S[0], B[0]], [S[1], B[1]], 'b-') # SB
plt.plot([S[0], C[0]], [S[1], C[1]], 'b-') # SC
plt.plot([S[0], D[0]], [S[1], D[1]], 'b-') # SD
plt.plot([S[0], A[0]], [S[1], A[1]], 'b--') # SA

plt.plot([A[0], C[0]], [A[1], C[1]], 'g--') # AC
plt.plot([B[0], D[0]], [B[1], D[1]], 'g--') # BD
plt.plot([S[0], 0], [S[1], 0], 'r--') # SO

plt.text(A[0]-0.05, A[1], 'A')
plt.text(B[0]-0.05, B[1], 'B')
plt.text(C[0]+0.05, C[1], 'C')
plt.text(D[0]+0.05, D[1], 'D')
plt.text(S[0], S[1]+0.05, 'S')
plt.text(0, -0.1, 'O')

plt.xlim(-1.5, 1.5)
plt.ylim(-0.5, 2)
plt.axis('equal')
plt.axis('off')
plt.savefig('pyr4.png')
