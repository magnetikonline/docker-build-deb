#!/bin/bash -e

DIRNAME=$(dirname "$0")


docker build --tag magnetikonline/buildphpfpm "$DIRNAME"
