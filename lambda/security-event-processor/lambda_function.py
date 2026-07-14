import json
import boto3
import os

sns = boto3.client("sns")

TOPIC_ARN = os.environ["SNS_TOPIC_ARN"]


def lambda_handler(event, context):

    message = {
        "event_source": event.get("source", "Unknown"),
        "detail_type": event.get("detail-type", "Unknown"),
        "region": event.get("region", "Unknown"),
        "account": event.get("account", "Unknown"),
        "time": event.get("time", "Unknown"),
        "details": event.get("detail", {})
    }

    sns.publish(
        TopicArn=TOPIC_ARN,
        Subject="Healthcare Landing Zone Event",
        Message=json.dumps(message, indent=2)
    )

    return {
        "statusCode": 200,
        "body": "Event processed successfully."
    }
    