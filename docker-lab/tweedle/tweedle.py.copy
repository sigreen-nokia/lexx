#!/usr/bin/python3

# importing the modules
#To add missing modues: 
#                       pip install [module name]: 
#                       or 
#                       pip3 install [module name]: 
import os
import sys 
import re
import subprocess
import socket
import json 
import csv 
import time
from subprocess import check_output as run
from datetime import date
from pathlib import Path

#date 
today = str(date.today())
#statics
logDir = '/pipedream/log/'
uiLogName = 'ui.log'
#data_view_size_logging
disk_space_filename=Path("data_view_disk_space.csv")
disk_space_filename_sorted=Path("data_view_disk_space_sorted.csv")
# path to place the dino working files directory
# WorkingDir = '/tmp'
WorkingDir = '/pipedream/log/'
# log of all queries
queriesFile = './queries_from_logs.txt'
# results files with query-counts and sorted query-counts 
querySummaryfile = 'querysummary.csv'
querySummaryfileSorted = 'querysummary_sorted_on_count.csv'
# Define Regex paterns to extract query-fields
# type (cube or count) query
type_regex = re.compile(r"/(cube|count)/")
# pattern to ID cube and the dimensions
cube_regex = re.compile(r"cube/(\w*)\.")
# pattern to ID cube and the dimensions
dim_regex = re.compile(r"dimensions=([\w,.-]*)&")
# pattern to ID the timestamp slice
timestamp_regex = re.compile(r"slice=timestamp([\w\-:()]*)&?")
# pattern to ID the dimensions in slice
slice_regex = re.compile(r"slice=([\w.\-]*)&?")
# pattern to ID the APIkey
apikey_regex = re.compile(r"api_key=([\w,.-]*)&?")
# pattern to ID the boundary slice
boundaryslice_regex = re.compile(r"bs=\(([\w,-.()]*)\)&?")
# pattern to extract each boundary from the boundary slice
boundary_regex = re.compile(r"\((boundary\.[\w.-]*),.*\)")
# api_key
api_key = 'None' 

def topmenu():
    os.system("clear")
    # sets the text color to magenta
    os.system("tput setaf 6")
    print("\n-------------------------------------------------")
    # sets the text colour to green
    os.system("tput setaf 2")
    print("\tLexx")
    # sets the text color to magenta
    os.system("tput setaf 6")
    print("-------------------------------------------------")

    while True:
        print("""
            1.What is Lexx
            2.Pre-Production - Lexx Labs Docker submenu
            3.Production - Lexx Installation submenu
            4.Production - Lexx subi ingest scheduling submenu
            5.Exit""")
        print("\n")
        ch=int(input("Enter your choice: "))
        if(ch == 1):
            whatislexx()    
        elif ch == 2:
            submenu22()    
        elif ch == 3:
            submenu23()    
        elif ch == 4:
            submenu24()    
        elif ch == 5:
            print("Exiting application")
            exit()
        else:
            print("Invalid entry")
        input("Press enter to continue")
        os.system("clear")
        topmenu()

def submenu22():
    os.system("clear")
    # sets the text color to magenta
    os.system("tput setaf 6")
    print("\n-------------------------------------------------")
    # sets the text colour to green
    os.system("tput setaf 2")
    print("\tPre-Production - Lexx Labs Docker submenu")
    # sets the text color to magenta
    os.system("tput setaf 6")
    print("-------------------------------------------------")
    while True:
        print("""
            1.Using Lexx Docker Labs to test the code: 
            2.Return""")
        print("\n")
        ch=int(input("Enter your choice: "))
        if(ch == 1):
            os.system("cat docker-lab/notes.txt")
        elif ch == 2:
            topmenu()
        else:
            print("Invalid entry")
        input("Press enter to continue")
        os.system("clear")
        submenu22

def submenu23():
    os.system("clear")
    # sets the text color to magenta
    os.system("tput setaf 6")
    print("\n-------------------------------------------------")
    # sets the text colour to green
    os.system("tput setaf 2")
    print("\tDeepfield Cluster Health (must be ran on the master)")
    # sets the text color to magenta
    os.system("tput setaf 6")
    print("-------------------------------------------------")
    while True:
        print("""
            1.salt-ping all nodes                      			#tests basic connectivity Master to each worker
            2.soup status on all nodes      		       		#checks the status of the Deepfield processes
            3.check disk space 						#show disk space available per partition for all nodes    
            4.memory hogs 						#show the top processes consuming memory for all nodes 
            5.check the performance of dnsflowd on each worker 	        #100% indicated it is time to scale up
            6.check the performance of classifyd on each worker 	#100% indicated it is time to scale up
            7.check the performance of collectord on each worker 	#100% indicated it is time to scale up
            8.check the performance of normd on each worker 	        #100% indicated it is time to scale up
            9.cpu hogs 							#show the top processes consuming cpu for all nodes 
            10.show me the cpu details for each node 			#cpu details
            11.show me the cpu model for each node 			#cpu model
            12.get the cpu clock speeds for each node 			#wondering why one node is busy.. perhaps you have a fan out and the clock was stepped
            13.Whats taking up all my SWAP space
            14.How much SWAP space do I have
            15.flow                                                     #show router flow per DCU
            16.Return""")
        print("\n")
        ch=int(input("Enter your choice: "))
        if(ch == 1):
            mycmd = "sudo salt \* test.ping"
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 2:
            mycmd = "sudo salt \* cmd.run \"supervisorctl status\""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 3:
            mycmd = "sudo salt \* cmd.run \"df -h\""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 4:
            mycmd = "sudo salt \* cmd.run \"ps -eo %mem,%cpu,pid,ppid,cmd --sort=-%mem | cut -c -140 | head -n 20 \""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 5:
            mycmd = "sudo salt \* cmd.run \"ps -eo %mem,%cpu,pid,ppid,cmd --sort=-%mem | cut -c -140 | grep dnsflow | grep -v grep \""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 6:
            mycmd = "sudo salt \* cmd.run \"ps -eo %mem,%cpu,pid,ppid,cmd --sort=-%mem | cut -c -140 | grep classifyd | grep -v grep \""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 7:
            mycmd = "sudo salt \* cmd.run \"ps -eo %mem,%cpu,pid,ppid,cmd --sort=-%mem | cut -c -140 | grep collectord | grep -v grep \""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 8:
            mycmd = "sudo salt \* cmd.run \"ps -eo %mem,%cpu,pid,ppid,cmd --sort=-%mem | cut -c -140 | grep normd | grep -v grep \""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 9:
            mycmd = "sudo salt \* cmd.run \"ps -eo %mem,%cpu,pid,ppid,cmd --sort=-%cpu | cut -c -140 | head\""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 10:
            mycmd = "sudo salt \* cmd.run \"lscpu\""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 11:
            mycmd = "sudo salt \* cmd.run \"lshw | grep -i intel | grep -i cpu\""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 12:
            mycmd = "sudo salt \* cmd.run \"cat /proc/cpuinfo | grep MHz\""
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 13:
            mycmd = ("for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 \" \" $3}END{ print \"\"}' $file; done | sort -k 2 -n -r")
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 14:
            mycmd = ("grep -i swap /proc/meminfo")
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 15:
            mycmd = ("flow.py --show-realtime")
            print("Command is:" + mycmd )
            os.system(mycmd)
        elif ch == 16:
            topmenu()
        else:
            print("Invalid entry")
        input("Press enter to continue")
        os.system("clear")
        submenu23()

def whatislexx():
     print("""
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

                 """)
     print("\n")
     input("Press enter to continue")
     os.system("clear")
     topmenu()

# Main program  
topmenu() 

