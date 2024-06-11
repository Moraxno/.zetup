function announce_tool {
    readonly tool=${1:?"The toolname must be specified."}
    readonly positive=${2:?"A message for the positive detection case must be given."}
    readonly negative=${3:?"A message for the negative detection case must be given."}
    readonly pad_len=${4:-0}

    padding=$(printf "%${pad_len}s")
    
    if type ${tool} > /dev/null; then
        echo "${padding}[${tool}] + ${positive}"
    else
        echo "${padding}[${tool}] ! ${negative}"
    fi

}