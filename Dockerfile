FROM python:3.9-slim

# Create a working folder and install dependencies
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy of application contents
COPY service/ ./service/

# Create and switch to a non-root user
RUN useradd --uid 1000 theia && chown -R theia /app
USER theia

# Run service
EXPOSE 8080
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]

# URL accounts-sn-labs-patriciaamar.labs-prod-openshift-san-a45631dc5778dc6371c67d206ba9ae5c-0000.us-east.containers.appdomain.cloud
