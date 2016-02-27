#!/bin/bash

pb_config='pb_config'

changed_files=$(git diff-tree --no-commit-id --name-only -r bb49a42)

while IFS=' ' read -ra ADDR; do
  	for str in "${ADDR[@]}"; do
  		if [[ $str == "$pb_config"* ]]; then
	  		export PB_BODY=$(<$str)
	  		break
		fi
	done
done <<< "$changed_files"
