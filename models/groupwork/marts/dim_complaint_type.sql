WITH complaint_types AS (

    SELECT DISTINCT
        complaint_type,
        descriptor
    FROM {{ ref('stg_311nyc_service_requests') }}
    WHERE complaint_type IS NOT NULL

)

SELECT
    {{ dbt_utils.generate_surrogate_key(['complaint_type']) }} AS complaint_type_key,
    complaint_type,
    descriptor
FROM complaint_types