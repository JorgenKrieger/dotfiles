#!/bin/bash

installer "Setting up dev folders"

question "How would you like you folder structure?"
select CHOICE in Seperated Bundled; do
  case $CHOICE in
    "Seperated")
      mkdir -p $HOME/Projects
      mkdir -p $HOME/Work
      break
      ;;
    "Bundled")
      mkdir -p $HOME/Projects/Rox\ Media $HOME/Projects/LabelNoir
      break
      ;;
    *)
      break
      ;;
  esac
done
