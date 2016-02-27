#!/bin/bash

pb_config='pb_config'

changed_files=$(git diff-tree --no-commit-id --name-only -r bb49a42)

while IFS=' ' read -ra ADDR; do
  	for str in "${ADDR[@]}"; do
  		if [[ $str == "$pb_config"* ]]; then
	  		echo "$str"
	  		export PB_BODY=$(printf '{"type":"link","title":"%s","body":"%s","url":"%s","channel_tag":"indiadailynews"}\n' "$title" "$body" "$url")
	  		break
		fi
	done
done <<< "$changed_files"
