##!/usr/bin/env bash
# Launch this script from the LausanneTourism/gists folder.

pause() {
  echo "\n***\n"
  read -p "Press any key to continue... (or Ctrl + C to stop execution) " pause
}

cd ~ 

echo "\n\t***\tUpdating system...\t***\n"
pause
echo "\n"

sudo apt update && sudo apt upgrade -y

pause
echo "\n\t***\tCreating code folders in ~/Code/projects\t***\n"
echo "\tDone.\n"

mkdir -p ~/Code/projects/{laravel,wordpress}

pause
echo "\n\t***\tTime to set up Github\t***\n"

if [ -f ~/.ssh/ed_25519 ]; then
  # Generate key for Github:
  echo "Generating SSH Key for github.\n"

  read -p "\tWhat's your email? " email
  ssh-keygen -C "$email" -t ed25519 -P "" -f "$HOME/.ssh/id_ed25519";

  read -p "\tKey Filename (default id_ed25519)? " filename
  filename=${filename:-id_ed25519}

fi;

echo "\n\nCopy this to https://github.com/settings/keys: \n"
echo "$(cat ~/.ssh/$filename.pub)"
echo "\n"

pause

echo "\n\t***\tYou may now install Zsh, by running the ./install-zsh.sh script.\t***\n"
cd -;
