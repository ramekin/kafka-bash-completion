_get_value() {
    local pattern="$1"
    shift
    local array=("$@")
    local foundOption=false

    for element in "${array[@]}"; do
        $foundOption && {
            [[ "$element" == "=" ]] && continue # ignore equals in --key=value syntax
                    echo "$element"
                    return 
                }
            [[ "$element" =~ $pattern ]] && { foundOption=true; }
        done
    }

_get_bootstrap_server() {
    # see if we've a bootstrap server or broker-list value in the argument list
    local bs=$(_get_value '^(--bootstrap-server|--broker-list)$' "${words[@]}" | cut -f1 -d',')
    # check we've received something and it's a credible host:port otherwise try the env variable
    if [[ "$bs" =~ [^[:space:]]*:[0-9]+$ ]]; then
      echo "$bs"
    else
      echo "$KAFKA_BOOTSTRAP_SERVER"
   fi
}

_get_topics() {
    # if we've found a bootstrap server, query the topics
    local bs=$(_get_bootstrap_server)
    if [[ ! -z "$bs" ]]; then
        kafka-topics.sh --bootstrap-server "$bs" --list 2>/dev/null
    fi
}

_get_consumer_groups() {
    # if we've found a bootstrap server, query the groups
    local bs=$(_get_bootstrap_server)
    if [[ ! -z "$bs" ]]; then
        kafka-consumer-groups.sh --bootstrap-server "$bs" --list 
    fi
}
