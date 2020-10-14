#!/usr/bin/env bash

# Author:    Evangelos A. Dimopoulos, Evan K. Irving-Pease
# Copyright: Copyright 2020, University of Oxford
# Email:     antonisdim41@gmail.com
# License:   MIT

# bash strict mode
set -euo pipefail

MAX_CPU=$(grep -c ^processor /proc/cpuinfo)

# setup a list of the different test_sets to run
test_sets=(100 10 1000 500)

for test_set in "${test_sets[@]}"; do
  # benchmark kraken sample analysis performance test against a db of various sizes
  time -v kraken2 \
        --db db_kraken_"${test_set}"_species \
        --gzip-compressed \
        --use-names \
        --report input_1M_"${test_set}"sp.report \
        --unclassified-out input_1M_"${test_set}"sp_unclassified.out \
        --classified-out input_1M_"${test_set}"sp_classified.out \
        --threads "$MAX_CPU" \
        --output input_1M_"${test_set}"sp.out ./inputs/input_1M_reads.fastq.gz; \
        Bracken-2.5/bracken -d db_kraken_"${test_set}"_species \
        -i input_1M_"${test_set}"sp.report \
        -o input_1M_"${test_set}"sp.bracken \
        --threads "$MAX_CPU"

done
