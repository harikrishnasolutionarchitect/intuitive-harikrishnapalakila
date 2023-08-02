### ####################################################################################################################
##                                                                                                                    ##
##            Docker Build & tag push image Command                                                                   ##
##  ####################################################################################################################
##  
##    INFO  - Single command:
##    INFO  - Usage ():
##
##    TASK  -  Docker Build Image , Tag Image, Push into Repo.

##    docker build -t intuitive-tool-avail-kubectl-awscli-sleep-image-release:0.0.1 -f Dockerfile . 
##    docker tag intuitive-tool-avail-kubectl-awscli-sleep-image-release:0.0.1 dockerhub1233/intuitive:intuitive-tool-avail-kubectl-awscli-sleep-image-release-0.0.1 
##    docker push dockerhub1233/intuitive:intuitive-tool-avail-kubectl-awscli-sleep-image-release-0.0.1

##
##
##
##    INFO  -   Combine all docker commands into Single command.
##
##
##    Single Command
## 
##    docker build -t intuitive-tool-avail-kubectl-awscli-sleep-image-release:0.0.1 -f Dockerfile . && docker tag intuitive-tool-avail-kubectl-awscli-sleep-image-release:0.0.1 dockerhub1233/intuitive:intuitive-tool-avail-kubectl-awscli-sleep-image-release-0.0.1 && docker push dockerhub1233/intuitive:intuitive-tool-avail-kubectl-awscli-sleep-image-release-0.0.1

##
##
##
## #####################################################################################################
##                                                                                                   ###
##      Docker Container   -- Create , Start , Check Commands                                        ###
##                                                                                                   ###
## #####################################################################################################
##
##
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ 
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ docker images
REPOSITORY                                                TAG                                                             IMAGE ID       CREATED          SIZE
dockerhub1233/intuitive                                   intuitive-tool-avail-kubectl-awscli-sleep-image-release-0.0.1   dbbda365044f   14 minutes ago   675MB
intuitive-tool-avail-kubectl-awscli-sleep-image-release   0.0.1                                                           dbbda365044f   14 minutes ago   675MB
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ 
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ docker create intuitive-tool-avail-kubectl-awscli-sleep-image-release:0.0.1
149e5e07603c51dd1eeeeee39064f86d271e0676665caee3c13929e61d3332f6
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ 
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ 
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ docker ps -a
CONTAINER ID   IMAGE                                                           COMMAND              CREATED         STATUS    PORTS     NAMES
149e5e07603c   intuitive-tool-avail-kubectl-awscli-sleep-image-release:0.0.1   "/bin/sleep 15 20"   4 seconds ago   Created             priceless_lichterman
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ 
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ docker start 149
149
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ 
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ docker ps 
CONTAINER ID   IMAGE                                                           COMMAND              CREATED          STATUS         PORTS     NAMES
149e5e07603c   intuitive-tool-avail-kubectl-awscli-sleep-image-release:0.0.1   "/bin/sleep 15 20"   20 seconds ago   Up 3 seconds             priceless_lichterman
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ 
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ 
harikrishnapalakila@cloudshell:~/docker-image (plms-340311)$ docker ps -a
CONTAINER ID   IMAGE                                                           COMMAND              CREATED          STATUS         PORTS     NAMES
149e5e07603c   intuitive-tool-avail-kubectl-awscli-sleep-image-release:0.0.1   "/bin/sleep 15 20"   24 seconds ago   Up 7 seconds             priceless_lichterman
##
##
##
##
##
