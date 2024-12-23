import { appendFile, WriteFileOptions } from "node:fs";
export interface CanMessageProcessed {
  id: number;
  data: number[]; // Array of numbers instead of Buffer for JSON serialization
  timestamp: string;
}

export const saveCanMessage = async (
  data: CanMessageProcessed
): Promise<boolean> => {
  try {
    const date = new Date(data.timestamp);
    const path = `data/${date.getFullYear()}${
      date.getMonth() + 1
    }${date.getDate()}.txt`;
    let options: WriteFileOptions = { encoding: "utf-8" };
    await appendFile(path, JSON.stringify(data) + "\n", options, () => {
      console.log(`Message saved: ${JSON.stringify(data)}`);
    });
    return true;
  } catch (error) {
    console.error(`Failed to save message: ${error}`);
    return false;
  }
};
