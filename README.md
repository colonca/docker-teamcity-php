# docker-teamcity-php
TeamCity server &amp; agent containers for painless setup with Docker for Php Development.

### Basic Setup
```bash
docker build -t teamcity-agent-php .
docker-compose up teamcity-server teamcity-agent
```

### Advanced Setup

```bash

# optional, see: https://confluence.jetbrains.com/display/TCD10/TeamCity+Data+Directory
# default: ~/workspace/teamcity/data/
export DATA_PATH=<TEAMCITY_DATA_DIR>

# optional, stores TeamCity server logs
# default: ~/workspace/teamCity/logs/
export LOGS_PATH=<TEAMCITY_LOGS_DIR>

# optional, stores TeamCity agent config
# default: ~/workspace/teamCity/agent/
export CONF_PATH=<AGENT_CONF_DIR>

# build provided image & start docker containers
docker build -t teamcity-agent-php .
docker-compose up teamcity-server teamcity-agent
