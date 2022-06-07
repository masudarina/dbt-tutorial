{{ config(
    cluster_by = ["_AIRBYTE_EMITTED_AT"],
    unique_key = '_AIRBYTE_AB_ID',
    schema = "_AIRBYTE_AIRBYTE_SCHEMA",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('AIRBYTE_SCHEMA', '_AIRBYTE_RAW____1') }}
select
    {{ json_extract_scalar('_airbyte_data', ['sys_id'], ['sys_id']) }} as SYS_ID,
    {{ json_extract_scalar('_airbyte_data', ['opened_at'], ['opened_at']) }} as OPENED_AT,
    {{ json_extract_scalar('_airbyte_data', ['sys_created_on'], ['sys_created_on']) }} as SYS_CREATED_ON,
    {{ json_extract_scalar('_airbyte_data', ['sys_updated_on'], ['sys_updated_on']) }} as SYS_UPDATED_ON,
    {{ json_extract_scalar('_airbyte_data', ['short_description'], ['short_description']) }} as SHORT_DESCRIPTION,
    _AIRBYTE_AB_ID,
    _AIRBYTE_EMITTED_AT,
    {{ current_timestamp() }} as _AIRBYTE_NORMALIZED_AT
from {{ source('AIRBYTE_SCHEMA', '_AIRBYTE_RAW____1') }} as table_alias
-- ___1
where 1 = 1

