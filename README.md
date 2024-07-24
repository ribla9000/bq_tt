# STEP BY STEP
```bash
git clone git@github.com:ribla9000/bq_tt.git
```

```bash 
cd ./bq_tt
``` 

*Create .env file and fill it by using env_example*\
*Check all yaml/yml files  in base dir - fill it*
*Install reqs* 
```bash
pip3 install -r requirements
```
**Then**
```bash 
dbt run
```

*Extract to excel* 
```bash 
python3 main.py
```

