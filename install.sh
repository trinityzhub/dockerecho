#!/bin/bash

##
## TESTING
##


## run 
## source /home/ubbe/CodeBase/DevGit/Github/testing/dockerhello/install.sh /home/ubbe/CodeBase/DevGit/Github/testing/dockerhello/Dockerfile

echo -e "\n"
read -p 'Enter  DOMAIN_NO (eg: 1 ): ' DOMAIN_NO

if [ "$DOMAIN_NO" = "" ]; then
   DOMAIN_NO="110"
fi

<<commentedcode1

echo -e "\n"
read -p 'Enter  container name (eg: echo1 ): ' CONTAINER_NAME

if [ "$CONTAINER_NAME" = "" ]; then
   CONTAINER_NAME="echo110"
fi

commentedcode1


CONTAINER_NAME=echo$DOMAIN_NO




choices=( 'latest' 'v0.01' 'v0.02'  ) # sample choices
select dummy in "${choices[@]}"; do  # present numbered choices to user
  # Parse ,-separated numbers entered into an array.
  # Variable $REPLY contains whatever the user entered.
  IFS=', ' read -ra selChoices <<<"$REPLY"
  # Loop over all numbers entered.
  for choice in "${selChoices[@]}"; do
    # Validate the number entered.
    (( choice >= 1 && choice <= ${#choices[@]} )) || { echo "Invalid choice: $choice. Try again." >&2; continue 2; }
    # If valid, echo the choice and its number.
    echo "Choice #$(( ++choiceIncrementor )): ${choices[choice-1]} ($choice)"
    mychoice==${choices[choice-1]}
  done
  # All choices are valid, exit the prompt.
  break
done




VERSION_TAG=$mychoice


echo $1

docker build  . -t test$DOMAIN_NO/hello:$VERSION_TAG -f $1


docker run -d --name $CONTAINER_NAME--rm test-$DOMAIN_NO/hello:$VERSION_TAG



unset choices
unset selChoices
unset choiceIncrementor
unset dummy
unset mychoice
