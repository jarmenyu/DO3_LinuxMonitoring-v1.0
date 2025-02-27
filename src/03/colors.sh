#!/bin/bash

declare -A colors
declare -A bg

colors[1]="\e[97m"
colors[2]="\e[91m"
colors[3]="\e[92m"
colors[4]="\e[94m"
colors[5]="\e[35m"
colors[6]="\e[90m"

bg[1]="\e[107m"  
bg[2]="\e[101m"  
bg[3]="\e[102m" 
bg[4]="\e[104m"  
bg[5]="\e[105m"  
bg[6]="\e[100m"  

reset_color="\e[0m"