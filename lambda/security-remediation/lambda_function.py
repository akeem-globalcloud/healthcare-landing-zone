import json
import boto3
import os

ec2 = boto3.client("ec2")
sns = boto3.client("sns")

SNS_TOPIC_ARN = os.environ["SNS_TOPIC_ARN"]


def lambda_handler(event, context):

    findings = []

    security_group_id = event.get("detail", {}).get("securityGroupId")

    if not security_group_id:
        return {
            "statusCode": 200,
            "body": "No Security Group supplied."
        }

    response = ec2.describe_security_groups(
        GroupIds=[security_group_id]
    )

    for sg in response["SecurityGroups"]:

        for permission in sg["IpPermissions"]:

            port = permission.get("FromPort")

            for ip in permission.get("IpRanges", []):

                if (
                    ip["CidrIp"] == "0.0.0.0/0"
                    and port in [22, 3389]
                ):

                    findings.append({

                        "SecurityGroup": security_group_id,

                        "Port": port,

                        "CIDR": ip["CidrIp"],

                        "Severity": "HIGH"

                    })

    if findings:

        sns.publish(

            TopicArn=SNS_TOPIC_ARN,

            Subject="Healthcare Landing Zone Security Finding",

            Message=json.dumps(findings, indent=2)

        )

    return {

        "statusCode": 200,

        "body": json.dumps(findings)

    }

    print(f"Checking Security Group: {security_group_id}")

print(f"Findings detected: {len(findings)}")

print(json.dumps(findings, indent=2))
