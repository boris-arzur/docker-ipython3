name=$1
name=${name:-ipython3}
echo this container name will be $name

if docker ps -a | grep ipython3-home > /dev/null
then
    echo home already exists
else
    echo making home container
    docker run --rm boris/ipython3 tar c /home |\
        docker import - boris/ipython3-home
    docker run -v /home --name ipython3-home boris/ipython3-home fail &> /dev/null
fi

docker run -ti --name $name --volumes-from ipython3-home\
        --cap-drop=MKNOD\
        -p 0.0.0.0:4443:8888\
        boris/ipython3
