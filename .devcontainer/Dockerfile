FROM mcr.microsoft.com/devcontainers/ruby:3.3

# Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        postgresql-client \
        nodejs \
        npm \
        git \
        vim \
        curl \
        build-essential \
        libpq-dev \
        pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install global npm packages
RUN npm install -g yarn

# Set working directory
WORKDIR /workspace

# Install Ruby gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application
COPY . .

# Create necessary directories
RUN mkdir -p log tmp/pids tmp/cache tmp/sockets

# Set proper permissions
RUN chown -R vscode:vscode /workspace

# Switch to vscode user
USER vscode

# Default command
CMD ["sleep", "infinity"]