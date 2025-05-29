-- -----------------------------------------------
-- 3️⃣ DROP TABLE - Cleanup
-- -----------------------------------------------
-- Cleans up by dropping the `covid_data` table if it exists.
-- Does not delete data from S3 because it is an external table.
-- Useful before recreating the table or refreshing schema.

DROP TABLE IF EXISTS covid_data;
