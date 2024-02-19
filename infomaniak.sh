#!/usr/bin/bash

# 1. SSH Host (will be used as key name as well)
# 2. FTP prefix (xxxxx.ftp.infomaniak.com)
# 3. User (without prefix)
# 4. User FTP password 

arguments() {
  printf "Please supply the arguments in order:";
  printf "\n\t- host: SSH Host (will be used as key name as well)";
  printf "\n\t- prefix: Infomaniak FTP prefix (xxxxx.ftp.infomaniak.com)";
  printf "\n\t- user: FTP Infomaniak user (without prefix)";
  printf "\n";
}

if [ $# -le 2 ]; then 
  arguments; 
  printf "\n\nExiting...\n";
  exit;
fi;

host=$1
prefix="$2.ftp.infomaniak.com"
user="$2_$3"

printf "The script will now create a key, edit the ~/.ssh/config file and upload the key to the server.\n\n";
read -p "Press any key to continue..." key

## Creating key
if [[ ! -f "$HOME/.ssh/$host" ]]; then
  printf "\nCreating a new key...\n";
  read -p "Please give your email used as a Key Comment: " email
  
  ssh-keygen -C "$email" -t ed25519 -P "" -f "$HOME/.ssh/$host";
  
  printf " Done.\n";
else
  printf "\nKey already exists with name $host\n";
fi

if ! grep -qc "$host" "$HOME/.ssh/config"; then
  printf "Adding this to ~/ssh/config:\n"
  printf "\nHost $host\n\tHostname $prefix\n\tUser $user\n\tIdentityFile $HOME/.ssh/$host";

  printf "\nHost $host\n\tHostname $prefix\n\tUser $user\n\tIdentityFile $HOME/.ssh/$host" \
  >> "$HOME/.ssh/config"

  if grep -qc "$host" "$HOME/.ssh/config"; then
    printf "\nConfig properly edited.\n";
  fi;
else
  printf "Hostname $prefix is already configured";
fi

printf "\nYou will have to provide a password to complete the setup.\n";

ssh-copy-id -i "$HOME/.ssh/$host" "$host"

## if this script is run in the gists repository, or the base .bash_profile exists
## we shall upload it to the server
if [ -f ./.bash_profile ]; then
  ssh "$host" "[ -f ~/.bash_profile ]";

  if [ $? -ne 0 ]; then
   printf "\nUploading base .bash_profile to server... \n";
   scp "./.bash_profile" "$host:~/.bash_profile";
   printf "Uploaded.\n"; 
  else
    printf "\nBash profile on server is already present.\n";
  fi

  ssh "$host" "[ -f ~/.vimrc ]"; 

  if [ $? -ne 0 ]; then
    printf "\nUploading base .vimrc to server... \n";
    scp "./.vimrc" "$host:~/.vimrc";
    printf "\nUploaded.\n";
  else
    printf "\nVimrc on server is already present.\n";
  fi
fi

exit;
