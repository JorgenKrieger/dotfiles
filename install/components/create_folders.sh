#!/bin/bash

installer "Setting up dev folders"

question "How would you like you folder structure?"
select CHOICE in Seperated Bundled; do
  case $CHOICE in
    "Seperated")
      ;;
    "Bundled")
      ;;
    *)
      break
      ;;
  esac
done
