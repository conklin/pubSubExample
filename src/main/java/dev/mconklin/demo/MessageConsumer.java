package dev.mconklin.demo;

import com.google.cloud.spring.pubsub.core.PubSubTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class MessageConsumer {

    private static final Logger logger = LoggerFactory.getLogger(MessageConsumer.class);

    PubSubTemplate pubSubTemplate;

    @Autowired
    public MessageConsumer(PubSubTemplate pubSubTemplate) {
        this.pubSubTemplate = pubSubTemplate;
    }

    public void redSubscribe() {
        pubSubTemplate.subscribe("example-red-subscription", (message)-> {
           logger.info(message.getPubsubMessage().getData().toStringUtf8());
           message.ack();
        });
    }

    public void blueSubscribe() {
        pubSubTemplate.subscribe("example-blue-subscription", (message)-> {
            logger.info(message.getPubsubMessage().getData().toStringUtf8());
            message.ack();
        });
    }
}
