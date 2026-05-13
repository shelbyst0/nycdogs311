SELECT DISTINCT
    complaint_type,
    descriptor
FROM {{ ref('stg_311nyc_service_requests') }}
WHERE complaint_type IS NOT NULL