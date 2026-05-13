SELECT
    dl.animal_name,
    dl.animal_gender,
    dl.animal_birth_year,
    dl.breed_name,
    dl.owner_zipcode,
    dl.license_issued_date,
    dl.license_expired_date,
    dl.extract_year,

    -- Dimension keys
    ac.animal_characteristics_key,
    gb.gender_birth_key,

    -- Dimension attributes
    ac.size_category,
    ac.temperament

FROM {{ ref('stg_nyc_dog_licensing') }} dl

LEFT JOIN {{ ref('dim_animal_characteristics') }} ac
    ON dl.breed_name = ac.breed_name

LEFT JOIN {{ ref('dim_gender_and_birth_year') }} gb
    ON dl.animal_gender = gb.animal_gender
   AND dl.animal_birth_year = gb.animal_birth_year