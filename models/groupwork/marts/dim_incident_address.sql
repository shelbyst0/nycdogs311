WITH addresses AS (

    SELECT DISTINCT
        incident_address,
        street_name,
        cross_street_1,
        cross_street_2
    FROM {{ ref('stg_311nyc_service_requests') }}
    WHERE incident_address IS NOT NULL

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'incident_address'
    ]) }} AS incident_address_key,

    incident_address,
    street_name,
    cross_street_1,
    cross_street_2

FROM addresses