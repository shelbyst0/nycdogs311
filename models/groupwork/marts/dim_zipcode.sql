WITH zipcodes AS (

    SELECT DISTINCT
        incident_zip
    FROM {{ ref('stg_311nyc_service_requests') }}
    WHERE incident_zip IS NOT NULL

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'incident_zip'
    ]) }} AS zipcode_key,

    incident_zip

FROM zipcodes