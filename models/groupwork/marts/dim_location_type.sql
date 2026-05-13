WITH location_types AS (

    SELECT DISTINCT
        location_type
    FROM {{ ref('stg_311nyc_service_requests') }}
    WHERE location_type IS NOT NULL

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'location_type'
    ]) }} AS location_type_key,

    location_type

FROM location_types