#!/bin/bash

#************************ Spring Boot Application Script ******************
echo -e "\n\033[34m                _____ _____  _____  _____ _   _  _____ \n               / ____|  __ \|  __ \|_   _| \ | |/ ____|\n              | (___ | |__) | |__) | | | |  \| | |  __ \n               \___ \|  ___/|  _  /  | | | . \` | | |_ |\n               ____) | |    | | \ \ _| |_| |\  | |__| |\n              |_____/|_|    |_|  \_\_____|_| \_|\_____|\n                                                        \033[m"

#-----------------------Settings---------------------------------
PROJECT_DIRECTORY="/home/ubuntu/jenkins-test/"
GITHUB_TOKEN="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"

GITHUB_ORGANIZATION="Ishmam-Ruhan"
GITHUB_REPOSITORY="jenkins-test"
GITHUB_BRANCH_NAME="main"

SERVICE_TO_RESTART=""
#----------------------------------------------------------------


REPO_URL="https://${GITHUB_TOKEN}:${GITHUB_TOKEN}@github.com/${GITHUB_ORGANIZATION}/${GITHUB_REPOSITORY}.git"

handle_error() {
    local error_message="$1"
    echo "\033[34mAn error occurred: $error_message. Exiting...\033[m"
    exit 1
}

printf "\n\033[34m******* Informations: *******\nProject Directory: ${PROJECT_DIRECTORY}\nGithub Repo: ${GITHUB_ORGANIZATION}/${GITHUB_REPOSITORY}\nFrom Branch: ${GITHUB_BRANCH_NAME}\nService To Restart: ${SERVICE_TO_RESTART}\n-------------------------------------------------------------------------\n\n\033[m"

cd $PROJECT_DIRECTORY || exit ;

printf "\033[34mPulling latest changes...\n\033[m"

if ! git pull $REPO_URL $GITHUB_BRANCH_NAME ; then
    handle_error "Error occurred while pulling from github."
fi

if ! mvn package ; then
    handle_error "Error occurred while mvn package"
fi

#sudo systemctl restart $SERVICE_TO_RESTART.service

printf "\033[34m\n\n******* Deployment success! Restarted ${SERVICE_TO_RESTART} service. *******\033[m\n\n"
