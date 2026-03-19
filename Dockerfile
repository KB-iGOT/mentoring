FROM node:17

# Create non-root user
RUN useradd -m appuser

# Set working directory
WORKDIR /var/src/

# Change ownership so appuser can access it
RUN chown -R appuser:appuser /var/src

# Switch to non-root user
USER appuser

# Copy package.json with ownership
COPY --chown=appuser:appuser ./src/package.json .

# Install node packages
RUN npm install

# Copy all application files
COPY --chown=appuser:appuser ./src .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]
