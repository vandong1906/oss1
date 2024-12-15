FROM node:lts-alpine
WORKDIR /app
<<<<<<< HEAD

ENV NODE_ENV=production
# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project
COPY . .

# Expose the port Vite will run on
EXPOSE 5173

# Step 2: Run the Vite development server
=======
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 5173
>>>>>>> dong
CMD ["npm", "run", "dev"]
