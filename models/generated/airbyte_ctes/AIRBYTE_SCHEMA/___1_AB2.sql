{{ config(
    cluster_by = ["_AIRBYTE_EMITTED_AT"],
    unique_key = '_AIRBYTE_AB_ID',
    schema = "_AIRBYTE_AIRBYTE_SCHEMA",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('___1_AB1') }}
select
    cast(SYS_ID as {{ dbt_utils.type_string() }}) as SYS_ID,
    cast(OPENED_AT as {{ dbt_utils.type_string() }}) as OPENED_AT,
    cast(SYS_CREATED_ON as {{ dbt_utils.type_string() }}) as SYS_CREATED_ON,
    cast(SYS_UPDATED_ON as {{ dbt_utils.type_string() }}) as SYS_UPDATED_ON,
    cast(SHORT_DESCRIPTION as {{ dbt_utils.type_string() }}) as SHORT_DESCRIPTION,
    _AIRBYTE_AB_ID,
    _AIRBYTE_EMITTED_AT,
    {{ current_timestamp() }} as _AIRBYTE_NORMALIZED_AT
from {{ ref('___1_AB1') }}
-- ___1
where 1 = 1

