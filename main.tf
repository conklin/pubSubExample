provider "google" {
  project = var.project_id
  region = var.compute_region
  zone = var.compute_zone
}


resource "google_pubsub_topic" "example_topic" {
  name = "example-topic"

  labels = {

  }
}

resource "google_pubsub_topic" "example_dead_letter" {
  name = "example-topic-dead-letter"
}

resource "google_pubsub_subscription" "example_red_subscription" {
  name  = "example-red-subscription"
  topic = google_pubsub_topic.example_topic.name

  retain_acked_messages = true
  filter = "attributes.messageType=red"

  dead_letter_policy {
    dead_letter_topic = google_pubsub_topic.example_dead_letter.id
    max_delivery_attempts = 10
  }
}

resource "google_pubsub_subscription" "example_blue_subscription" {
  name  = "example-blue-subscription"
  topic = google_pubsub_topic.example_topic.name

  retain_acked_messages = true
  filter = "attributes.messageType=blue"

  dead_letter_policy {
    dead_letter_topic = google_pubsub_topic.example_dead_letter.id
    max_delivery_attempts = 10
  }
}