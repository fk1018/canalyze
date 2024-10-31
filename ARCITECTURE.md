``` mermaid
graph TB
    subgraph AWS
        MQTT-->
        Message_Parser-->
        S3<-->
        Web_Server <-->
        User_DB
    end
    subgraph Vehicle
       Message_Uploader-->MQTT
       Mobile_Device 
    end
    UI<-->Web_Server
```