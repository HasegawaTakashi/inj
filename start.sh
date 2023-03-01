#!/bin/bash

# Check if the image is built
if ! docker image inspect inj >/dev/null 2>&1; then
  echo "Building inj image..."
  docker build -t inj .
fi

# Run the container with interactive tty, and connect to it
docker run --name inj-joke -it inj sh -c "
    cat /usr/src/app/command.txt
    echo ; echo
    sl
    /bin/bash"
