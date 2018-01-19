#!/usr/bin/env bash

clear_web_session() {

  firefox_cookies_db="~/.mozilla/firefox/jyn166e2.default/cookies.sqlite"
  clear_google_cookies="sqlite3 ${firefox_cookies_db} \"delete from moz_cookies where baseDomain like '%google%'\""
  eval "${clear_google_cookies}"

}

alias work="htop"

alias gwork="gnome-system-monitor"

alias arch="print_command 'lscpu' && lscpu"

alias sctl="systemctl"                                                                                                                                                  

alias sctl:s="print_command 'sudo systemctl start' && sudo systemctl start"

alias sctl:rs="print_command 'sudo systemctl restart' && sudo systemctl restart"

alias lock="gnome-screensaver-command --lock" 

alias down="print_command 'sudo shutdown now' && sudo shutdown now"

alias reboot="print_command 'sudo shutdown now' && sudo shutdown now"

alias update="print_command 'sudo apt-get update && sudo apt-get upgrade -y' && sudo apt-get update && sudo apt-get upgrade -y"
