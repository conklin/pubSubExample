package dev.mconklin.demo;


import com.google.cloud.spring.pubsub.core.PubSubTemplate;
import com.google.pubsub.v1.PubsubMessage;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collections;
import java.util.Map;

public class MessagePublisher {

    private final PubSubTemplate pubSubTemplate;

    @Autowired
    public MessagePublisher(PubSubTemplate pubSubTemplate) {
        this.pubSubTemplate = pubSubTemplate;
    }

    public void publishMessage() {
        Map<String, String> headers = Collections.singletonMap("key1", "val1");
        pubSubTemplate.publish("example-topic", "message",headers);
    }
}
