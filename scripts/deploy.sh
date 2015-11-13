#!/bin/bash
set -o nounset
set -o errexit

rsync -avp -e "ssh -q -p $DEPLOY_PORT" $CIRCLE_ARTIFACTS/* $DEPLOY_SERVER
