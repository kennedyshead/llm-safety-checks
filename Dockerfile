FROM ubuntu:24.04

LABEL org.opencontainers.image.title="claude-code"

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates git && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# This is actually a whole security issue in itself! I know that claude has its own installer now, but this is still the standard.
RUN npm install -g @anthropic-ai/claude-code

VOLUME /root/.claude
VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT ["claude"]
