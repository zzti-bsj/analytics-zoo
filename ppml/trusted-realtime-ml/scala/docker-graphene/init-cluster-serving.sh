#!/bin/bash
set -x

core_num=$CORE_NUM
secure_password=`openssl rsautl -inkey /ppml/trusted-realtime-ml/redis/work/password/key.txt -decrypt </ppml/trusted-realtime-ml/redis/work/password/output.bin`
redis_host=$REDIS_HOST

sed -i "/coreNumberPerMachine:/c \ \ coreNumberPerMachine: ${core_num}" config.yaml
sed -i "/redisSecureEnabled:/c \ \ redisSecureEnabled: true" config.yaml
sed -i "/redisSecureTrustStorePassword:/c \ \ redisSecureTrustStorePassword: ${secure_password}" config.yaml
sed -i "/redisUrl:/c \ \ redisUrl: ${redis_host}:6379" config.yaml
 
