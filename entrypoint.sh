#!/usr/bin/env bash

mc alias set deploy $MINIO_ENDPOINT $MINIO_ACCESS_KEY $MINIO_SECRET_KEY

mc mirror --remove --overwrite $1 "deploy/$2"
