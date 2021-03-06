#!/usr/bin/env bash

get_current_branch() {
  echo $(git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
}

git_checkout() {
  local branch=""
  if [ "$1" = "-b" ]
  then
    branch="$2"
    print_command "git checkout -b ${branch}"
    git checkout -b "${branch}"
  else
    local branch="$1"
    print_command "git checkout ${branch}"
    git checkout "${branch}"
  fi
}

git_commit() {
  local commit_message="$1"
  print_command "git commit -am \"${commit_message}\""
  git commit -am "${commit_message}"
}

git_pull() {
  local current_branch="$(get_current_branch)"
  print_command "git pull --rebase origin ${current_branch}"
  git pull --rebase origin "${current_branch}"
}

git_push() {
  local current_branch="$(get_current_branch)"
  print_command "git push origin ${current_branch}"
  git push origin "${current_branch}"
}

git_clone_and_cd() {
  local clone_link="$1"
  if [ "$#" -gt 1 ]
  then
    directory_name="$2"
  else
    directory_name="$(echo ${clone_link} | grep -oE '[a-zA-Z0-9\_\-]*\.git' | grep -oE '.*[^.git]')"
  fi
  print_command "git clone ${clone_link} ${directory_name} && cd ${directory_name}"
  git clone "${clone_link}" "${directory_name}" && cd "${directory_name}"
}

git_flow_start_branch() {
  local branch_name="$2"
  local branch_type="$1"
  print_command "git flow ${branch_type} start ${branch_name}"
  git flow "${branch_type}" start "${branch_name}"
}

git_flow_finish_branch() {
  local current_branch="$(get_current_branch)"
  local branch_type="$(echo ${current_branch} | grep -oE '\w+/' | grep -oE '\w+')"
  print_command "git flow ${branch_type} finish ${current_branch}"
  git flow "${branch_type}" finish "${branch_name}"
}

alias gits="print_command 'git status' && git status"

alias gitl="git log --graph --pretty=format:'%h -%C(auto)%d%Creset %s %C(magenta)(<%an> %cr)%Creset' --all"

alias gitck="git_checkout"

alias gitb="git branch"

alias gitd="git diff"

alias gitc="git_commit"

alias gitca="print_command 'git commit --amend' && git commit --amend"

alias gitp="git_push"

alias gitpl="git_pull"

alias gitcl="git_clone_and_cd"

alias gitf="git flow"

alias gitffeat="git_flow_start_branch feature"

alias gitfreal="git_flow_start_branch release"

alias gitfhot="git_flow_start_branch hotfix"

alias gitffin="git_flow_finish_branch"

alias gitlatestmsg="git log | head -n 5 | sed -n '5,5p' | sed -e 's/    //g'"
