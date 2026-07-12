import re

with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

# We need to ensure that the template selection JS works cleanly for the 2 remaining cards.
# Wait, did I just delete the cards with empty spaces in my last regex?
# Yes, `html = html[:card1_start] + html[card1_end:]` removes the cards exactly.
# Are there any issues? Let's check `selectTemplate` function.
