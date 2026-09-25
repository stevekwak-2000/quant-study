# quant-study

퀀트 투자 학습 기록. 파이썬 + pandas 기반으로 데이터 수집부터 백테스트까지 단계별로 진행합니다.

## 환경

- Python 3.14 / uv
- 주요 패키지: pandas, matplotlib, FinanceDataReader, ccxt

## 진행 상황

- [x] 0단계 — 환경 세팅, 주식·코인 데이터 수집 확인
- [ ] 1단계 — 파이썬 & pandas
- [ ] 2단계 — 통계·확률 + 금융 기초
- [ ] 3단계 — 첫 백테스트
- [ ] 4단계 — 포트폴리오·팩터·리스크

## 노트북

- `hello_quant.ipynb` — 삼성전자 주가, BTC/KRW 시세 차트
- `01_pandas_basics.ipynb` — 1단계 학습 노트북 (인덱싱, 수익률, 리샘플링, 롤링, shift, 여러 종목, groupby + 연습문제)
- `01_pandas_solutions.ipynb` — 1단계 연습문제 정답

## 데이터

`quant_study.data.load_price(code, start)`로 가격을 불러옵니다. 처음 한 번만 FinanceDataReader로 받고
`data/`(git 제외)에 CSV로 저장해 재사용합니다. 최신 데이터가 필요하면 `refresh=True`.
