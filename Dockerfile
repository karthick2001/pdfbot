# Step 1: Use an official Python runtime as a parent image
FROM python:3.9-slim

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the requirements file into the container
COPY requirements.txt ./

# Step 4: Install dependencies with extended timeout (default PyPI index)

RUN pip install --no-cache-dir --timeout=120 -r requirements.txt



# Step 5: Copy the application code into the container
COPY . .

# Step 6: Expose the necessary port (adjust based on your app)
EXPOSE 8501

# Step 7: Command to run the application (adjust according to your Streamlit app)
CMD ["streamlit", "run", "app.py", "--server.port=8501"]
