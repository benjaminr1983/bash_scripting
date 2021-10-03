#!/bin/bash
function progressbar {
    #######################################
    # Display a progress bar
    # Arguments:
    #   $1 Current loop number
    #   $2 max. no of loops (1005)
    # Returns:
    #   None
    #######################################
    # Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
    # Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")
    # 1.2 Build progressbar strings and print the progressbar line
    # 1.2.1 Output example:
    # 1.2.1.1 Progress : [########################################] 100%
    printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%% ($1/$2)"
}
echo -en "\r"
progressbar $1 $2
1
