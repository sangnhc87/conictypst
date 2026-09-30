#import "../src/core/normalize.typ": legacy-mcq-to-question, legacy-tf-to-question
#import "../src/core/validate.typ": validate-question

#let mc = legacy-mcq-to-question([Stem], ([$A$], (body: [$B$]), (body: [$C$], correct: true)), correct: (1, 2))
#assert(mc.choices.at(0).correct)
#assert(not mc.choices.at(1).correct)
#assert(mc.choices.at(2).correct)
#assert(validate-question(mc, mode: "legacy-compatible") == mc)

#let tf = legacy-tf-to-question([Stem], ([Plain], (body: [True], correct: true)))
#assert(not tf.choices.at(0).correct)
#assert(tf.choices.at(1).correct)
