                                          
              .@         /  ,%       @     
               &,&  ***************,       
                *********/*******,***.     
                **********************     
              &************************,   
        &(&/  &,************************   
      &#&&&&@   *,   ,*****************@   
     %,%&&&(  @@&,######(##***********@    
        @.*//((,//,(&#@ ####*******,&      
           .*/// ####### #####*,%@         
             &,,**(##*,  ##,,              
                  @(*,,**,,**..*.*         
                     @%*******,(******     
                      ,*  (/*///  #%.*@    
                      #/*******//*&        
                        (*. .* **&         
                        @@   #.&@%*/,/(/*(@
                              (/           
                             */.           
                           /.@     

## Whats giggerota:

* A Docker based Linux daemon that listens for Deepfield Defender events and speaks what happened (alarms) 
* It can also be used as a tool to decode webhooks sent from Defender
* It can also be configured to do other things, such as send out different rest api calls based on the Defender events it receives

## Licence

* giggerota is Opensource. 
* giggerota uses webhookd as a base, webhookd is also opensource. 

## How does it sound:

* On a Mac I use the "say" command (you will see it used below), this sound really great and is based on siri
* On Ubuntu I use "espeak" command (you will see it used below), this sounds like a 90s arcade game. If you find a better text to speech you can use it instead below
* On windows 10 I use the "System.Speech.Synthesis.SpeechSynthesizer" command (you will see it used below), this sounds pretty decent, not as nice as Apple siri though 

## Topology 

*The topology could not be much simpler
   
           ############      ############            ###################
           #          #      #          #            #                 #
           # Network  #      # Deefield #            # osx/linux/win10 #
           # Under    # ---> # Defender # -webhook-> # host            #
           # Attack   #      #          #            # running giggerota   #
           #          #      #          #            #                 #
           ############      ############            ###################
     
## installing the code

* if you are not familiar with github, just download the zip from here, https://github.com/sigreen-nokia/giggerota  unzip it locally. Open a terminal
* if you are familiar with github cli then you can use "git clone https://github.com/sigreen-nokia/giggerota.git"

## platforms

* I've tested this on my mac running docker for desktop (for ARM CPU's enable rosseta in advanced settings)
* I've also tested this on Ubuntu Linux 20.04. Install docker using your favorite site 
* I've also tested this on Windows 10 using wsl and docker for desktop 

## pre requisits

* you just need to install Ubuntu's Docker, or on Mac and Windows Docker Desktop
* then follow the steps below

## The simplest way to get started: just run my docker image

```
cd giggerota (you must be in the giggerota git)
docker run -d  -v /tmp/giggerota-commands:/tmp/giggerota-commands --restart always --name=giggerota -v ${PWD}/scripts:/scripts -p 8080:8080 simonjohngreen/giggerota
```

## Developer method (if you want to build the docker image yourself)

* This method, allows you the opertunity to customise the code. webhook script changes don't require a re-build.
* From the git source this builds your own private docker image and then runs it. 
* It doesn't use my image from dockerhub.

```
cd giggerota (you much be in the giggerota git dir) 
docker build --platform=linux/amd64 -t giggerota:1.0 .
docker run -d --restart always --name=giggerota -v /tmp/giggerota-commands:/tmp/giggerota-commands -v ${PWD}/scripts:/scripts -p 8080:8080 giggerota:1.0
```



