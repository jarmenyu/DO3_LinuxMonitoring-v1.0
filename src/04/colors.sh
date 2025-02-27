#!/bin/bash

declare -A colors
declare -A bg
declare -A name

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

name[1]="white"
name[2]="red"
name[3]="green"
name[4]="blue"
name[5]="purple"
name[6]="black"

reset_color="\e[0m"


load_color() {
    bg_name=${bg[$1]}
    fc_name=${colors[$2]}
    bg_value=${bg[$3]}
    fc_value=${colors[$4]}
}