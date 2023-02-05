#!/bin/bash
{
  # enclosing everything in braces to ensure entire file is downloaded
  # and intact, so there are no errors on first download/install

  # utility function for this
  # some text color formatting functions
  format_red() {
    ### Usage: format_dist "string", use \n at the end for linebreak ###
    echo -en "\e[31m$1\e[0m"
  }
  format_green() {
    echo -en "\e[32m$1\e[0m"
  }
  format_yellow() {
    echo -en "\e[33m$1\e[0m"
  }

  get_dist() {
    ### Usage: get_dist ####
    local filename="/etc/os-release"

    if [[ $(grep -i fedora $filename) ]]; then
      echo "fedora"
    elif [[ $(grep -i arch $filename) || $(grep -i manjaro $filename) ]]; then
      echo "arch"
    elif [[ $(grep -i debian $filename) ]]; then
      echo "debian"
    else
      format_red "Unable to use your system's package manager\n"
      format_red "Please check params or get in touch with the dev on GitHub\n"
      format_red "Sorry for the inconvenience. Thanks.\n"
      exit 1
    fi
  }

  yes_no_prompt() {
    ### Usage: yes_no_prompt [question] [if_yes] [if_no] ###
    local question="$1"
    local yes="$2"
    local no="$3"

    while true; do
      read -p "$question"

      case $REPLY in
        ""|[Yy]|[Yy][Ee][Ss]) # blank or y or yes, any case
          echo $yes
          break;;
        [Nn]|[Nn][Oo]) # n or no, any case
          echo $no
          return 1
          break;;
        *)
          echo -e "Invalid input";;
        esac
    done
  }

  ############################################################################

  echo -e "Installing myNas to system\n\n"

  ### check distro and use corresponding package manager
  dist=$(get_dist)
  if [ "$?" == 1 ]; then
    echo $dist
    text_format red "Script Error. Exiting\n"
    exit 1
  fi

  if [ "$dist" == "debian" ]; then
    dependency_list="curl wget git jq python3 python3-pip avahi-daemon polkit"
    update="apt-get update"
    upgrade="apt-get upgrade -y"
    install="apt-get install -y"
    check="dpkg-query -s"
  elif [ "$dist" == "fedora" ]; then
    dependency_list="curl wget git jq python3 python3-pip avahi polkit"
    upgrade="dnf upgrade -y"
    install="dnf install -y"
    check="dnf list installed"
  elif [ "$dist" == "arch" ]; then
    dependency_list="curl wget git jq python3 python-pip avahi polkit"
    upgrade="pacman -Syyu"
    install="pacman -Sy"
    check="pacman -Qi"
  fi

  ### update and upgrade
  echo -e "\nUpdating package lists and upgrading system packages\n"
  if [ "$update" ]; then
    sudo $update
  fi
  sudo $upgrade

  ### check if dependencies are met, else install
  echo -e "\nChecking package dependencies\n"
  not_installed=""

  for pkg in $dependency_list; do
    echo -n "Checking package: "
    format_yellow "$pkg\n"
    $check $pkg &> /dev/null

    if [ "$?" == 1 ]; then
      format_yellow "    $pkg"
      echo -n " is "
      format_red "not installed\n"
      not_installed="$not_installed $pkg"
    else
      format_yellow "    $pkg"
      echo -n " is "
      format_green "installed\n"
    fi
  done

  if [ "$not_installed" == "" ]; then
    echo -e "\nDependencies OK. Proceeding ..."; echo
  else
    echo -e "Need to install missing dependencies: $not_installed"; echo
    question="Would you like to install dependencies to continue? [Y]/n: "
    yes="Installing dependencies"
    no="Installation cancelled.. Bye!!"
    yes_no_prompt "$question" "$yes" "$no"


    if [ "$?" == 1 ]; then
      exit 1
    fi
    echo -e "\nRunning: $install $not_installed\n"
    sudo $install $not_installed

    if [ "$?" == 1 ]; then
      text_format red "Dependency install unsuccessful. Exiting installation\n"
      exit 1
    fi
    text_format green "Dependency install successful\n"
  fi

  ### Install docker
  curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh
	rm get-docker.sh

  echo "Adding $USER to group 'docker' to run containers without sudo"
  sudo usermod -aG docker

  # install docker-compose
  echo "Installing docker-compose using pip"
	pip3 install docker-compose

  # installing ANM for all users
  curl -o- https://raw.githubusercontent.com/anujdatar/anm/main/install.sh | bash -s system

  echo "Cloning anujdatar/myNas git repository to /opt/myNas"
  sudo git clone https://github.com/anujdatar/myNas.git /opt/myNas

  echo "Adding shell scipts to path"
  rc_file="/etc/profile.d/myNas_profile.sh"

  echo 'if [ -d "/opt/myNas/backend/bin" ]; then' | sudo tee -a $rc_file &> /dev/null
  echo '  export PATH="/opt/myNas/backend/bin:$PATH"' | sudo tee -a $rc_file &> /dev/null
  echo 'fi' | sudo tee -a $rc_file &> /dev/null
}
