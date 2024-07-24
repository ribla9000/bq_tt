import numpy as np
import gspread
from core.config import SERVICE_ACC_PATH, DATASET_NAME, PROJECT_NAME, SPREADSHEET_ID
from google.cloud import bigquery
from oauth2client.service_account import ServiceAccountCredentials
from core.config import intro


client = bigquery.Client.from_service_account_json(SERVICE_ACC_PATH)

query = f"SELECT * FROM {PROJECT_NAME}.{DATASET_NAME}.tips_change_month_by_month"
dataframe = client.query(query).to_dataframe()
dataframe.replace([np.inf, -np.inf], np.nan, inplace=True)
dataframe.fillna("", inplace=True)


scopes = ['https://www.googleapis.com/auth/spreadsheets']
credentials = ServiceAccountCredentials.from_json_keyfile_name(SERVICE_ACC_PATH, scopes)
gcp = gspread.authorize(credentials)


sheets = gcp.open_by_key(SPREADSHEET_ID)
worksheet = sheets.get_worksheet(0)
worksheet.clear()
worksheet.update([dataframe.columns.values.tolist()] + dataframe.values.tolist())

print(intro + "\n\n")
