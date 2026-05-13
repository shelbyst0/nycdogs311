SELECT
    unique_key,
    created_date,
    closed_date,
    complaint_type,
    descriptor,
    agency,
    borough,
    city,
    incident_zip,
    incident_address,
    location_type,
    status,
    latitude,
    longitude

FROM {{ ref('stg_311nyc_service_requests') }}