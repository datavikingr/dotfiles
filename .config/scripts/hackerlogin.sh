#!/usr/bin/env bash

# Define colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
RESET='\e[0m'
KEY_COLOR=$CYAN
USR_COLOR=$MAGENTA
VAL_COLOR=$RESET

# Edgy hackerisms, Hávamál quotes, political quips, and guillotine jokes
HACKERISMS=(
  # Classic & Dangerous Hackerisms
  "Root or be rooted"
  "There is no place like 127.0.0.1"
  "Hack the planet!"
  "All your base are belong to us"
  "Keep calm and rm -rf /"
  "Talk is cheap, show me the PR"
  "0xDEADBEEF"
  "To shell or not to shell"
  "In code we trust"
  "Nullius in verba"
  "Awenan de ende"
  "sudo rm -rf fear"
  "Think outside the {box}"
  "Segfault is just another way to say 'hello'"
  "Permission denied? Challenge accepted."
  "If you can't hack it, you don't own it."
  "Give me root, or give me death!"
  "Chmod 777 everything and let the Aesir sort it out."
  "The quieter you become, the more you are able to hear."
  "I void warranties for fun."
  "Security through obscurity is not security."
  "Complacence against Evil is not Good."
  "It’s not a bug, it’s a zero-day."
  "I only trust two people: me and the person who holds my private key."
  "Tor users do it onion-layered."
  "cd /mnt/revolution"
  # Hávamál Quotes (translated, paraphrased for snappiness)
  "Wake early if you want another man's life or land. No lamb for the lazy wolf."
  "A foolish man thinks he will live forever if he avoids battle, but old age gives him no peace."
  "Cattle die, kinsmen die, the self must also die; but glory never dies, for the man who can achieve it."
  "Better to fight and fall than to live without hope."
  "A guest must depart, not always stay, the loved one becomes loathed if he sits too long."
  "The unwise man is awake all night, worries over and again; when morning comes, he is weary still."
  "There are no Nazis in Valhalla"
  "Where you know of evil, declare it to be such and give them no peace"
  # Political Quips & Guillotine Jokes
  "Eat the rich — garnish with parsley."
  "When they say 'work harder,' sharpen your guillotine."
  "If voting changed anything, they'd make it illegal."
  "Guillotines solve supply chain issues at the top."
  "Redistribution: it's not theft if it's the means of production."
  "It's not piracy if I can't own it."
  "My favorite IDE: Insurrection, Dissent, and Equality."
  "Wage theft is the only wage CEOs know."
  "They say 'reform', I hear 'reboot with extreme prejudice.'"
  "This machine kills fascists (after a sudo password)."
  "The cloud is just someone else’s computer — seize it."
  "Be gay, do crime."
  "When in doubt: chown -R nobody:rich /assets"
  "Systemd and capitalism: both good at eating your processes."
  "Remember: the rich fear the guillotine more than you fear poverty."
  "Free Luigi"
  "No Justice, No Peace"
)

# Select one at random
HACKERISM="${HACKERISMS[RANDOM % ${#HACKERISMS[@]}]}"

# Get username and IP info
USERNAME=$(whoami)
#IPINFO=$(curl -s ipinfo.io)
IPINFO=$(curl -s ipinfo.io | \
jq -r --arg k "$KEY_COLOR" --arg v "$VAL_COLOR" --arg r "$RESET" \
    'to_entries[] | "\($k)" + .key + "\($r): \($v)" + (.value|tostring) + "\($r)"')

# Print colorized message
echo -e "${KEY_COLOR}Greetings, ${USR_COLOR}${USERNAME}${KEY_COLOR}. Welcome back to cloudrunner.${RESET}

${USR_COLOR}New login detected from:${RESET} 
${IPINFO}

${RED}${HACKERISM}${RESET}"