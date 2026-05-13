WITH gender_birth AS (

    SELECT DISTINCT
        animal_gender,
        animal_birth_year
    FROM {{ ref('stg_nyc_dog_licensing') }}

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'animal_gender',
        'animal_birth_year'
    ]) }} AS gender_birth_key,

    animal_gender,
    animal_birth_year

FROM gender_birth