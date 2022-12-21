#!/bin/bash

exec uvicorn api:app --host 0.0.0.0 --port 80 ${EXTRA_ARGS}