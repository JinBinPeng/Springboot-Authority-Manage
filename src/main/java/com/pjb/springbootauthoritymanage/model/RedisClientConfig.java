package com.pjb.springbootauthoritymanage.model;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author jinbin
 */
@Data
@Component(value="redisClientConfig")
@ConfigurationProperties(prefix = "spring.redis")
public class RedisClientConfig {
    private String host;
    private int port;
}
