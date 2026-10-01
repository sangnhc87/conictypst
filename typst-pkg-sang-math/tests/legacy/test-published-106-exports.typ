// Verify the public names shipped in the actual Typst Universe 1.0.6 package.
#import "../../lib.typ": book, beamer, sang-omr-qr, draw-helix, draw-spring, draw-cylinder, draw-cone, draw-sphere
#import "../../omr-qr.typ": sang-omr-qr as legacy-qr

#assert(book != none and beamer != none)
#assert(sang-omr-qr != none and legacy-qr != none)
#assert(draw-helix != none and draw-spring != none)
#assert(draw-cylinder != none and draw-cone != none and draw-sphere != none)

= Baseline 1.0.6 exports preserved
