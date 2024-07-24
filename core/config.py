from dotenv import load_dotenv
import os
load_dotenv()


SERVICE_ACC_PATH = os.environ.get("SERVICE_ACC_PATH")
PROJECT_NAME = os.environ.get("PROJECT_NAME")
DATASET_NAME = os.environ.get("DATASET_NAME")
SPREADSHEET_ID = os.environ.get("SPREADSHEET_ID")


intro = """
██╗  ██╗███████╗██╗     ██╗      ██████╗
██║  ██║██╔════╝██║     ██║     ██╔═══██╗
███████║█████╗  ██║     ██║     ██║   ██║
██╔══██║██╔══╝  ██║     ██║     ██║   ██║
██║  ██║███████╗███████╗███████╗╚██████╔╝▄█╗
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝

 ██▀███     ██   ▄▄▄▄     ██▓     ▄▄▄                     
▓██ ▒ ██ ▒▒▓██  ▓█████▄ ▓ ██▒    ▒████▄                   
▓██ ░▄█  ▒░▒██  ▒██▒ ▄██▒ ██░    ▒██  ▀█▄                 
▒██▀▀█▄    ░██  ▒██░█▀  ▒ ██░    ░██▄▄▄▄██                
░██▓ ▒██▒  ░██▒ ░▓█  ▀█▓░ ██████  ▓█   ▓██                
░ ▒▓ ░▒▓░  ░▓ ░ ░▒▓███▀▒  ░ ▒░▓   ▒▒   ▓▒█                
  ░▒ ░ ▒░   ▒ ░ ▒░▒   ░ ░  ░ ▒    ░   ▒▒                 
   ░   ░    ▒    ░    ░    ░ ░    ░   ▒                  
   ░        ░ ░  ░           ░        ░                  
"""