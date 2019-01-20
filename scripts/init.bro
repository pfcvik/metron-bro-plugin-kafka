#
#  Licensed to the Apache Software Foundation (ASF) under one or more
#  contributor license agreements.  See the NOTICE file distributed with
#  this work for additional information regarding copyright ownership.
#  The ASF licenses this file to You under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance with
#  the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

module Kafka;

export {
        ## Send all active logs to kafka except for those that are explicitly
        ## excluded via logs_to_exclude.
        ##
        ## Example:  redef Kafka::send_all_active_logs = T;
        const send_all_active_logs: bool = F &redef;

        ## Specify which :bro:type:`Log::ID` to send to kafka.
        ##
        ## Example:  redef Kafka::logs_to_send = set(Conn::Log, DNS::LOG);
        const logs_to_send: set[Log::ID] &redef;

        ## Specify which :bro:type:`Log::ID` to exclude from being sent to kafka.
        ##
        ## Example:  redef Kafka::logs_to_exclude = set(SSH::LOG);
        const logs_to_exclude: set[Log::ID] &redef;

        ## Specify a different timestamp format.
        ##
        ## Example:  redef Kafka::json_timestamps = JSON::TS_ISO8601;
        const json_timestamps: JSON::TimestampFormat = JSON::TS_EPOCH &redef;

        ## Destination kafka topic name
        const topic_name: string = "bro" &redef;

        # this is the name to add to each message to identify
        # this sensor in the logs. It will be added to a "sensor"
        # field in the submitted json.
        const sensor_name = "brosensor" &redef;

        # this is the type of the stream to add to each message to identify
        # the stream in the logs. It will be added to a "sensor"
        # field in the submitted json.
        const event_type = "" &redef;        

        ## Maximum wait on shutdown in milliseconds
        const max_wait_on_shutdown: count = 3000 &redef;

        ## Any additional configs to pass to librdkafka
        const kafka_conf: table[string] of string = table(
                ["metadata.broker.list"] = "localhost:9092"
        ) &redef;

        ## A comma separated list of librdkafka debug contexts
        const debug: string = "" &redef;
}
