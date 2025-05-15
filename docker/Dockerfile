FROM python:3.12-alpine AS builder

WORKDIR /app


COPY pyproject.toml ./
COPY conftest.py ./
COPY src/ ./src
COPY tests/ ./tests  


RUN pip install --upgrade pip \
    && pip install --prefix=/install .[test]  

FROM python:3.12-alpine


RUN adduser -D fastapiuser


WORKDIR /app


COPY --from=builder /install /usr/local


COPY --from=builder /app/conftest.py ./  
COPY --from=builder /app/src ./src
COPY --from=builder /app/tests ./tests  

ENV PYTHONPATH=/app


USER fastapiuser


EXPOSE 8100

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8100"]
