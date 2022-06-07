{{ config(
    cluster_by = ["_AIRBYTE_EMITTED_AT"],
    unique_key = '_AIRBYTE_AB_ID',
    schema = "_AIRBYTE_AIRBYTE_SCHEMA",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('___1_AB2') }}
select
    {{ dbt_utils.surrogate_key([
        'SYS_ID',
        'OPENED_AT',
        'SYS_CREATED_ON',
        'SYS_UPDATED_ON',
        'SHORT_DESCRIPTION',
    ]) }} as _AIRBYTE____1_HASHID,
    tmp.*
from {{ ref('___1_AB2') }} tmp
-- ___1
where 1 = 1

