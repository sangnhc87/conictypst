#import "@preview/cetz:0.5.2"
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let a = 3.5
  let b = 1.75
  let h = 3.5
  
  let A = (0, 0)
  let D = (4, 1.2)
  let B = (1.5, -1)
  let C = (1.5 + b, -1 + 0.5) // BC // AD, do dai = 1/2 AD
  
  let S = (2, 3.5)
  
  let M = (S.at(0)/2 + A.at(0)/2, S.at(1)/2 + A.at(1)/2)
  let N = (S.at(0)*1/3 + B.at(0)*2/3, S.at(1)*1/3 + B.at(1)*2/3)
  let K = (S.at(0)/2 + D.at(0)/2, S.at(1)/2 + D.at(1)/2)
  let P = (S.at(0)*1/3 + C.at(0)*2/3, S.at(1)*1/3 + C.at(1)*2/3)
  
  line(A, B, C, stroke: 1pt)
  line(C, D, stroke: (dash: "dashed", paint: gray))
  line(A, D, stroke: (dash: "dashed", paint: gray))
  line(S, A, stroke: 1pt)
  line(S, B, stroke: 1pt)
  line(S, C, stroke: 1pt)
  line(S, D, stroke: (dash: "dashed", paint: gray))
  
  // Mat phang P (M, N, K, P)
  line(M, K, stroke: (dash: "dashed", paint: rgb("2196F3")))
  line(M, N, stroke: (paint: rgb("2196F3")))
  line(N, P, stroke: (paint: rgb("2196F3")))
  line(P, K, stroke: (dash: "dashed", paint: rgb("2196F3")))
  
  // Noi dai MN
  content(S, [ $S$ ], anchor: "south", padding: 0.1)
  content(A, [ $A$ ], anchor: "east", padding: 0.1)
  content(B, [ $B$ ], anchor: "north", padding: 0.1)
  content(C, [ $C$ ], anchor: "west", padding: 0.1)
  content(D, [ $D$ ], anchor: "west", padding: 0.1)
  content(M, [ $M$ ], anchor: "east", padding: 0.1)
  content(N, [ $N$ ], anchor: "east", padding: 0.1)
  content(K, [ $K$ ], anchor: "west", padding: 0.1)
  
  circle(M, radius: 0.05, fill: blue)
  circle(N, radius: 0.05, fill: blue)
  circle(K, radius: 0.05, fill: blue)
})
