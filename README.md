
# ChatGPT Integration Project

This project demonstrates how to integrate OpenAI's API into your iOS application using the [OpenAISwift](https://github.com/Swift-Almanac/OpenAISwift) library. It allows you to interact with ChatGPT-based models directly from your app.

## Prerequisites

- **OpenAI API Key:**  
  To test and run the project, you must obtain an API key. You can get your API key by following the instructions on [OpenAI's API platform](https://platform.openai.com/overview).

- **Available Account Balance:**  
  Ensure your OpenAI account has an available balance. Typically, OpenAI provides a free balance when you sign up; however, if your free credits are exhausted, you must add a valid payment method and purchase additional balance.

## Setup Instructions

1. **Clone the Repository:**  
   Clone this project to your local machine.

2. **Configure Your API Key Securely:**  
   To keep your API key secure, create a configuration file (e.g., `Secrets.plist`). Add your API key to this file and ensure it is excluded from version control by adding it to your `.gitignore` file.

   Example `Secrets.plist` content:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
       <key>OPENAI_API_KEY</key>
       <string>Your-API-Key-Here</string>
   </dict>
   </plist>
