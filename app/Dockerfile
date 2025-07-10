# Stage 1: Build the app
FROM node:23-alpine AS builder

WORKDIR /app

# Copy dependency files
COPY package.json yarn.lock ./

# Install projen globally (needed for build scripts)
RUN npm install -g projen

# Install all dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the source files
COPY . .

# Run the build (uses npx projen build internally)
RUN yarn build

# Stage 2: Serve the app
FROM node:23-alpine

WORKDIR /app

# Install serve to serve static files
RUN yarn global add serve

# Copy only the built output from builder stage
COPY --from=builder /app/build ./build

# Expose the default serve port
EXPOSE 3000

# Serve the build
CMD ["serve", "-s", "build"]
