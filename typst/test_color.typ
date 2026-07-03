#let c = rgb("#0f172a")
#let comps = c.components()
#let luma = 0.299 * float(comps.at(0)) + 0.587 * float(comps.at(1)) + 0.114 * float(comps.at(2))
#panic("luma: " + str(luma))
