SELECT
    animal_name,
    animal_gender,
    animal_birth_year,
    breed_name,
    owner_zipcode,
    license_issued_date,
    license_expired_date,
    extract_year

FROM {{ ref('stg_nyc_dog_licensing') }}