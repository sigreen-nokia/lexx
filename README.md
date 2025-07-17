     _     _______  ____  __
    | |   | ____\ \/ /\ \/ /
    | |   |  _|  \  /  \  / 
    | |___| |___ /  \  /  \ 
    |_____|_____/_/\_\/_/\_\
    
    
## Whats lex:

* A suit of tools to fetch data from psql databases and ingest it into subi
* Lexx includes tools to run a test environment locally in docker
* Lexx includes tools to install configure and deploy in production 

## Production Topology


                    #############            
                    #           #            
            <------ #   lexx    # -webhooks->
             psql   # (adapter) #            
            queries #           #            
                    #           #            
                    #############            

                 ###################
                 #                 #
                 #     tweedle     #
                 # (installation)  #
                 # (configuration) #
                 # (scheduling)    #
                 # (debugging)     #
                 #                 #
                 ###################


## Docker Lab Topology


           ##############         #############             #################
           #            #         #           #             #               #
           #    zev     # <------ #   lexx    # -webhooks-> # giggerota     #
           # (database) #  psql   # (adapter) #             # (rest api)    #
           #   (node)   # queries #           #             # (listener)    #
           #            #         #           #             #               #
           ##############         #############             #################

                               ###################
                               #                 #
                               #  tweedle        #
                               # (installation)  #
                               # (configuration) #
                               # (scheduling)    #
                               # (debugging)     #
                               #                 #
                               ###################

* to build and run the docker based lab 
...
cd docker-lab
docker compose up --force-recreate
cntrl-c to stop the lab 
...
