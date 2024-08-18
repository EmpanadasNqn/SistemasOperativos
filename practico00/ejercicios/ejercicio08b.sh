#!/bin/bash
cd The_Walking_Dead && for i in *.srt; do mv "$i" ${i/_es/}; done && cd ..
