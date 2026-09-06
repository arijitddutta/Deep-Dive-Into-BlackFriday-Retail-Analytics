CREATE black_friday_db;
USE black_friday_db;

-- import warnings
 -- warnings.filterwarnings('ignore')
--from sqlalchemy import create_engine, URL
import pandas as pd

-- url = URL.create(
    drivername="mysql+pymysql",
    username="root",
    password="Thugstools@735213",
    host="localhost",
    port=3306,
    database="black_friday_db",
)
-- engine = create_engine(url)

-- data = pd.read_csv("Black Friday Data.csv")
-- data.to_sql('black_friday_staging', engine, index=False, if_exists='replace', chunksize=5000)

