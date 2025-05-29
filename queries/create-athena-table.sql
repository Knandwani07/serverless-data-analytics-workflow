-- ================================
-- 🦠 COVID-19 Data Lake Queries
-- ================================

-- -----------------------------------------------
-- 1️⃣ CREATE EXTERNAL TABLE
-- -----------------------------------------------

-- This table is used to read COVID-19 data directly from a CSV file stored in S3.
-- It's defined as an external table, so AWS Athena or Hive does not manage the file storage.
-- OpenCSVSerde is used to parse CSV format with specified separator, quote, and escape characters.

CREATE EXTERNAL TABLE covid_data (
    fips STRING,
    admin2 STRING,
    province_state STRING,
    country_region STRING,
    last_update STRING,
    latitude STRING,
    longitude STRING,
    confirmed STRING,
    deaths STRING,
    recovered STRING,
    active STRING,
    combined_key STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\"",
   "escapeChar"    = "\\"
)
STORED AS TEXTFILE
LOCATION 's3-bucket-location'
TBLPROPERTIES ('skip.header.line.count'='1');
