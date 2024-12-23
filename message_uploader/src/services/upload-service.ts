// UploadJob.ts
export interface CanMessageData {
  id: number;
  data: number[]; // Array of numbers instead of Buffer for JSON serialization
  timestamp: string;
}

export const uploadCanMessage = async (
  data: CanMessageData
): Promise<boolean> => {
  try {
    // const response = await fetch('IP/upload', {
    //   method: 'POST',
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: JSON.stringify(data),
    // });

    // if (!response.ok) {
    //   throw new Error(`Server responded with status ${response.status}`);
    // }

    console.log(`Message uploaded: ${JSON.stringify(data)}`);
    return true;
  } catch (error) {
    console.error(`Failed to upload message: ${error}`);
    return false;
  }
};
