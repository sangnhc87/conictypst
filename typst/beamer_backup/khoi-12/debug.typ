#import "../../giao-an/modules/lecture-beamer-premium-v2.typ": *

#show: lecture-theme-premium.with(
  title: "Debug",
)

#slide()[
  #lt-example()[
    #context [ #panic("Text Fill is: " + repr(text.fill)) ]
  ]
]
