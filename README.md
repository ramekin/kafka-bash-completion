# Kafka Bash Completion
## This project provides bash command autocompletion for the following Kafka commands:
* `kafka-console-consumer.sh`
* `kafka-console-producer.sh`
* `kafka-topics.sh`

## Prerequisites
This requires the **bash-completion** package to be installed

## Installation globally
```bash
# Clone the repository 
git clone https://github.com/monepic/kafka-bash-completion && cd kafka-bash-completion

# These need to be run as root (or with sudo as shown below)
# Install with make 
sudo make install

# Alternatively install with provided build script
sudo ./build  --install
```
## Installation for a single user
* build the file with `make` or `./build`
* source the generated file in your .bashrc file `. <path_to_kafka_bash_completion_file>`

## Usage
After restarting your terminal (or soucing the `kafka-bash-completion` script) 
    you should be able to generate completion suggestions for the listed kafka commands by pressing the **\<Tab\>** key once or more.

Suggestions for the **--topic** and **--group** options are queried from Kafka (which isn't particularly quick)

Environment variables **KAFKA_BOOTSTRAP_SERVER** and **KAFKA_BROKER_LIST** can be set in order to populate suggestions for the **--bootstrap-server** and **--broker-list** option values.

They are also used as a fallback when trying to query Kafka for groups and topics.
