#show math.equation: eq => {
  if repr(eq.body.func()) == "sequence" {
    let kids = eq.body.children
    let new-kids = ()
    for k in kids { new-kids.push(k) }
    new-kids.join()
  } else {
    eq
  }
}
$C(6,2)$
