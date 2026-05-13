WITH animal_characteristics AS (

    SELECT DISTINCT
        breed_name,
        size_category,
        temperament
    FROM {{ ref('stg_animal_characteristics') }}

)

SELECT
    {{ dbt_utils.generate_surrogate_key(['breed_name']) }} AS animal_characteristics_key,
    breed_name,
    size_category,
    temperament
FROM animal_characteristics