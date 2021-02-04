FROM ubuntu:20.04
LABEL maintainer "Thijs Tops"

# Set the timezone to Amsterdam
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update apt, so we can install things
RUN apt-get -y update
RUN apt-get -y install git python3 python3-pip

# Clone the git repository
RUN git clone https://github.com/antfu/uno-game 

# Set the working directory
WORKDIR uno-game

# Install the requirements for the game
RUN pip3 install -r pip-requirements.txt

# Run the game
CMD ["python3.8", "uno_server.py" ]
