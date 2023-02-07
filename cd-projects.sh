#!/bin/bash
if  [ $# -eq 0 ]
then
  cd ~/Projects
else
  cd "$(find ~/Projects -type d -name "$1" -print -quit)"
fi
