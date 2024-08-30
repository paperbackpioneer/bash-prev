#!/usr/bin/env bash

prev()
{
  OPTIND=1
  terminal=false

  while getopts ":t" opt; do
    case $opt in
      t)
        terminal=true
        ;;
      ?)
        echo "Invalid option: -$OPTARG"
        return 1
        ;;
    esac
  done

  shift $((OPTIND-1))

  for file in "$@"; do

    type=$(file -b --mime-type "$file")

    if [ "$type" == "text/plain" ]; then

      filename=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16; echo)
      out="/tmp/${filename}.html"

      pandoc -f markdown -t html \
        --toc --toc-depth=6 \
        -s \
        "$file" \
        -o "$out" \

      echo "File created: ${filename}.html"

      if [ $terminal = true ]; then
        w3m "$out"
      else
        firefox "$out"
      fi

    else
      echo "Error: Incompatible file type." >&2
      return 1
    fi

  done
}
