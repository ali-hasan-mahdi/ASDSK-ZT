from fastapi import FastAPI
import os
import psycopg

app = FastAPI(title="ASDSK Python API")

DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://appuser:apppass@localhost:5432/appdb")

@app.get("/healthz")
def healthz():
    return {"status": "ok"}

@app.get("/api/hello")
def hello():
    return {"message": "Hello from Python API"}

@app.get("/api/db-check")
def db_check():
    try:
        with psycopg.connect(DATABASE_URL) as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT 1")
                return {"db": "ok"}
    except Exception as e:
        return {"db": "error", "detail": str(e)}
