// src/index.ts
import * as can from "socketcan";
import * as dotenv from "dotenv";
import { uploadCanMessage, CanMessageData } from "./services/upload-service";

dotenv.config();

interface CanMessage {
  id: number;
  data: Buffer;
}

const canInterface = process.env.CAN_INTERFACE ?? "vcan0";
const channel = can.createRawChannel(canInterface, true);

channel.addListener("onMessage", (msg: CanMessage) => {
  const data: CanMessageData = {
    id: msg.id,
    data: Array.from(msg.data), // Ensures the Buffer is converted to number[]
    timestamp: new Date().toISOString(),
  };

  uploadCanMessage(data);
});

channel.start();
