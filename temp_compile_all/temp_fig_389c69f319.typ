#set page(width: auto, height: auto, margin: 0.2cm, fill: none)
#import "@preview/cetz:0.3.2"
#import cetz: canvas, draw
#let circ = sym.degree
#let c-book = rgb("#0057b8")
#let accent = rgb("#0057b8")
#let pm = sym.plus.minus

#canvas(length: 1cm, {
    import draw: *
    // Vertices of pyramid
    let S = (0, 3.0)
    let A = (-1.5, 0.2)
    let B = (0.5, -0.4)
    let C = (1.5, 0.4)
    let D = (-0.5, 1.0)
    
    // Calculate points exactly
    let M = ( (S.at(0) + D.at(0)) / 2, (S.at(1) + D.at(1)) / 2 )
    let N = ( (B.at(0) + 2 * C.at(0)) / 3, (B.at(1) + 2 * C.at(1)) / 3 )
    let P = ( 0.25 * S.at(0) + 0.75 * C.at(0), 0.25 * S.at(1) + 0.75 * C.at(1) )

    // Draw hidden edges first
    line(S, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(C, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(A, D, stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))

    // Draw section AMNP (hidden parts)
    line(A, N, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))
    line(M, P, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))
    line(M, A, stroke: (thickness: 1.2pt, dash: "dashed", paint: blue))

    // Draw visible edges
    line(S, A, stroke: 1.2pt)
    line(S, B, stroke: 1.2pt)
    line(S, C, stroke: 1.2pt)
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)

    // Draw section AMNP (visible parts)
    line(N, P, stroke: 1.2pt + blue)

    // Draw points
    circle(M, radius: 0.04, fill: black)
    content((M.at(0) - 0.2, M.at(1) + 0.1), $M$)
    
    circle(N, radius: 0.04, fill: black)
    content((N.at(0) + 0.25, N.at(1) - 0.1), $N$)
    
    circle(P, radius: 0.04, fill: black)
    content((P.at(0) + 0.25, P.at(1) + 0.1), $P$)

    // Labels
    content((S.at(0), S.at(1) + 0.3), $S$)
    content((A.at(0) - 0.2, A.at(1)), $A$)
    content((B.at(0) + 0.1, B.at(1) - 0.2), $B$)
    content((C.at(0) + 0.2, C.at(1)), $C$)
    content((D.at(0) - 0.2, D.at(1) + 0.15), $D$)
  })