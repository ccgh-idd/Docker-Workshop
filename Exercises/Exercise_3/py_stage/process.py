import pandas as pd
from pathlib import Path

in_path = Path("/data/stage1_out/summary.csv")
out_path = Path("/data/final_out/final.json")

df = pd.read_csv(in_path)
result = {
    "n_categories": len(df),
    "overall_mean": float(df["mean_value"].mean()),
    "data": df.to_dict(orient="records")
}

out_path.write_text(pd.Series(result).to_json(indent=2))
print(f"Python stage complete: wrote {out_path}")
