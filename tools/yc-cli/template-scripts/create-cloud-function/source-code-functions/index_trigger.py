
def handler(event, context):
    print("Starting function after trigger")
    print(event)
    return {
        "statusCode": 200,
        "body": "File is uploaded"
    }