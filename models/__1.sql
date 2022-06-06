{{ config(
    cluster_by = ["_AIRBYTE_EMITTED_AT"],
    unique_key = '_AIRBYTE_AB_ID',
    schema = "AIRBYTE_SCHEMA",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('___1_AB3') }}
select
    SYS_ID,
    OPENED_AT,
    SYS_CREATED_ON,
    SYS_UPDATED_ON,
    SHORT_DESCRIPTION,
    _AIRBYTE_AB_ID,
    _AIRBYTE_EMITTED_AT,
    {{ current_timestamp() }} as _AIRBYTE_NORMALIZED_AT,
    _AIRBYTE____1_HASHID
from {{ ref('___1_AB3') }}
-- ___1 from {{ source('AIRBYTE_SCHEMA', '_AIRBYTE_RAW____1') }}
where 1 = 1

