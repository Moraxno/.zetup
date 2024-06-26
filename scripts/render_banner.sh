echo '                 __                '
echo '     ____  ___  / /___  ______     '
echo '    /_  / / _ \/ __/ / / / __ \    '
echo '     / /_/  __/ /_/ /_/ / /_/ /    '
echo '    /___/\___/\__/\__,_/ .___/     '
echo '                      /_/          '
echo ''

tool_messages=()
tool_messages+=("zimfw" "Running Zsh IMproved." "Improvements missing") 
tool_messages+=("stow" "These .dotfiles are hearded." "The cattle is loose.") 
tool_messages+=("junest" "I might be jailed, but I have sudo." "Do not pass go, do not collect \$200.")

longest_tool_name=0

for ((i = 1; i <= ${#tool_messages}; i+=3)); do
    tool=${tool_messages[$i]}
    if [ ${longest_tool_name} -lt ${#tool} ]; then
        longest_tool_name=${#tool}
    fi
done

for ((i = 1; i <= ${#tool_messages}; i+=3)); do
    tool=${tool_messages[i]}
    pos=${tool_messages[i+1]}
    neg=${tool_messages[i+2]}

    tool_name_len=${#tool}
    pad_len=$((${longest_tool_name}-${tool_name_len}))

    announce_tool $tool "$pos" "$neg" $pad_len
done

echo ""
