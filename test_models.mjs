import { GoogleGenAI } from '@google/genai';
import 'dotenv/config';

const ai = new GoogleGenAI({ apiKey: process.env.GCP_API_KEY });

async function check() {
  try {
    const models = await ai.models.list();
    for await (const model of models) {
      if (model.name.includes('gemini')) {
        console.log(model.name);
      }
    }
  } catch (e) {
    console.error(e);
  }
}
check();
