keyfile=keys/vagrantssh.key;
if [[ ! -d keys ]]; then
    mkdir keys
fi
if [[ ! -f $keyfile".pub" ]]; then
    rm $keyfile;
    ssh-keygen -N '' -f $keyfile;
fi
ssh-add $keyfile;
