#!/usr/bin/env sh

export NORMAL=$(tput sgr0)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)

# rename a git branch
rename() {
  old_name=$(git branch --show-current) # Git 2.22 and above:
  #old_name=$(git rev-parse --abbrev-ref HEAD) # Git 2.22 lower

  echo "Correct branch to rename: ${YELLOW} $old_name ${NORMAL} ? y|N"
  read -r is_correct_branch
  if [ "$is_correct_branch" != "y" ]; then
    echo "Old branch name? "
    read -r old_name
  fi

  echo "New branch name? "
  read -r new_name

  echo "Renaming ${GREEN} $old_name ---> $new_name ${NORMAL}"
  git checkout "$old_name"
  git branch -m "$new_name"

  echo "Push to remote? y|N"
  read -r confirm_push
  if [ "$confirm_push" = "y" ]; then
    git push origin -u $new_name
  fi

  echo "Delete old branch from remote? y|N"
  read -r confirm_delete
  if [ "$confirm_delete" = "y" ]; then
    git push origin --delete $old_name
  fi
}
rename
