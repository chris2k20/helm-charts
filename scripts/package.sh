#!/bin/bash

# for every chart
for f in ../charts/*; do
  if [ -d "$f" ]; then
    mkdir -p ../assets/$f/ && cd ../assets/$f/
	helm package ../../charts/$f/ --destination ../assets/$f/ && echo "created chart $f"
  fi
done

# helm index all charts
cd ../../scripts/
helm repo index --url https://chris2k20.github.io/helm-charts/ .. && echo "created helm index"

