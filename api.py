import datetime
import os
from typing import Dict, Any

from fastapi import FastAPI
from pydantic import BaseModel


app = FastAPI(
    title="Classification",
    description="This is an API example for using and documenting the API.",
    version="0.0.1",
)

@app.get("/fast")
async def fast() -> Dict[str, Any]:
    return {"host":os.environ["HOSTNAME"], "id": os.environ["FAST_ID"], "score": 0.0015}

