#import "@preview/sang-math:1.0.4": tn as old-tn, mcq as old-mcq, ds as old-ds, tln as old-tln, tl as old-tl, tf as old-tf, short as old-short, True, False
#let tn = old-tn
#let mcq = old-mcq
#let ds = old-ds
#let tln = old-tln
#let tl = old-tl
#let tf = old-tf
#let short = old-short

#let exam-mode(
  mode: "dethi",
  accent: rgb(0, 87, 184),
  opt-style: "plain",
  opt-label-color: auto,
  q-label-style: "plain",
  show-tags: true,
  draft: false,
  draft-width: 30%,
  draft-lines: 5,
  boxed: false,
  box-fill: white,
  box-stroke: 0.6pt + black,
  ..args
) = {
  let params = (
    mode: mode,
    accent: accent,
    opt-style: opt-style,
    opt-label-color: opt-label-color,
    q-label-style: q-label-style,
    show-tags: show-tags,
    draft: draft,
    draft-width: draft-width,
    draft-lines: draft-lines,
    boxed: boxed,
    box-fill: box-fill,
    box-stroke: box-stroke,
    ..args.named()
  )
  
  (
    tn: tn.with(..params),
    ds: ds.with(..params),
    tln: tln.with(..params),
    tl: tl.with(..params),
    mcq: mcq.with(..params),
    tf: tf.with(..params),
    short: short.with(..params),
  )
}

#let (tn, ds, tln, tl, mcq, tf, short) = exam-mode(mode: "solcolor", opt-style: "circle", prefix: "Bài")

#tn([Test], (True([A]), [B]))
#ds([Test 2], (True([A]), False([B])))
