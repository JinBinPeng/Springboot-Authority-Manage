package com.pjb.springbootauthoritymanage.service;

import com.pjb.springbootauthoritymanage.model.RedisClientConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisShardInfo;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

import java.util.ArrayList;

@Service("redisPool")
@Slf4j
public class RedisPool {
    /** 切片连接池 */
    private ShardedJedisPool shardedJedisPool;
    @Autowired
    private RedisClientConfig redisClientConfig;
    @Bean
    public ShardedJedisPool getShardedJedisPool() {
        // 池基本配置
        JedisPoolConfig config = new JedisPoolConfig();
        ArrayList<JedisShardInfo> list = new ArrayList<JedisShardInfo>();
        list.add(new JedisShardInfo(redisClientConfig.getHost(), redisClientConfig.getPort(), "master"));
        shardedJedisPool = new ShardedJedisPool(config, list);
        return shardedJedisPool;
    }

    public ShardedJedis instance() {
        return shardedJedisPool.getResource();
    }

    public void safeClose(ShardedJedis shardedJedis) {
        try {
           if (shardedJedis != null) {
               shardedJedis.close();
           }
        } catch (Exception e) {
            log.error("return redis resource exception", e);
        }
    }
}
