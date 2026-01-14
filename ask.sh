echo -e "What you like to do?, enter a Task Id from list below: \n"
echo -e "TaskID\tFile\t\tDescription"
echo -e "1\t Start Docker"
echo -e "2\t Stop Docker"
echo -e "3\t Clean Docker - Clean the docker containers and volumes "
echo -e "4\t Clean All - Clean the docker containers and volumes and images "


until [ "$task" = "0" ]; do 
read task
    
if [ "$task" = "1" ]; then
    echo "...${task}"
    cd dockers
    docker-compose up -d
    echo "Go to:"
    echo "http://www.app.local"
    cd ../
    
elif [ "$task" = "2" ]; then
    echo "...${task}"
    cd dockers
    docker-compose down
    cd ../

    
elif [ "$task" = "3" ]; then
    echo "...${task}"    
    docker rm --force `docker ps -qa`
    docker volume rm $(docker volume ls -q --filter dangling=true)
    docker network prune --force

elif [ "$task" = "4" ]; then
    echo "...${task}"
    docker rm --force `docker ps -qa`
    docker volume rm $(docker volume ls -q --filter dangling=true)
    docker network prune
    docker rmi --force `docker images -aq`

    
else
    echo "Goodbye! - Exit"
fi

sleep 2

./ask.sh

done 

