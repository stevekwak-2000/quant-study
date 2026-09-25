"""가격 데이터 로더.

한 번 받은 데이터는 data/ 폴더에 CSV로 저장해 두고, 다음부터는 파일에서 읽습니다.
(네트워크 요청을 줄이고, 같은 데이터로 반복 실습하기 위함)
"""

import os
from pathlib import Path

import pandas as pd

DATA_DIR = Path(os.environ.get("QUANT_DATA_DIR", Path(__file__).resolve().parents[2] / "data"))


def load_price(symbol: str, start: str = "2020-01-01", end: str | None = None, refresh: bool = False) -> pd.DataFrame:
    """종목 코드(예: '005930', 'KS11')의 일봉 OHLCV를 DataFrame으로 반환합니다."""
    path = DATA_DIR / f"{symbol}.csv"
    if path.exists() and not refresh:
        df = pd.read_csv(path, index_col="Date", parse_dates=True)
    else:
        import FinanceDataReader as fdr

        df = fdr.DataReader(symbol, start, end)
        df.index.name = "Date"
        DATA_DIR.mkdir(parents=True, exist_ok=True)
        df.to_csv(path)
    return df.loc[start:end]
