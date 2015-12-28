#!/bin/bash
# Copyright 2015 Cloudera, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

# Enables the Red Hat devtoolset on RHEL 6 based systems and executes the
# arguments. On non-RHEL 6 systems, the arguments are executed without changes
# to the environment.
# USAGE: ./enable_devtoolset.sh <command> <args>...

if [[ "$OSTYPE" =~ ^linux ]] && \
   [[ "$(lsb_release -irs)" =~ (CentOS|RedHatEnterpriseServer)[[:space:]]+6\.[[:digit:]]+ ]]; then
  scl enable devtoolset-3 "$*"
else
  $@
fi
