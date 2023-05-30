--To disable this model, set the using_schedules variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_schedules', True)) }}

{%- set source_relation = adapter.get_relation(
      database=source('zendesk', 'ticket_schedule').database,
      schema=source('zendesk', 'ticket_schedule').schema,
      identifier=source('zendesk', 'ticket_schedule').name) -%}

{% set table_exists=source_relation is not none  %}

{% if table_exists %}

{{
    fivetran_utils.union_data(
        table_identifier='ticket_schedule',
        database_variable='zendesk_database',
        schema_variable='zendesk_schema',
        default_database=target.database,
        default_schema='zendesk_support',
        default_variable='ticket_schedule'
    )
}}

{% else %}

select
    cast(null as {{ dbt.type_string() }}) as _dbt_source_relation,
    cast(null as {{ dbt.type_timestamp() }}) as _fivetran_synced,
    cast(null as {{ dbt.type_timestamp() }}) as created_at,
    cast(null as {{ dbt.type_int() }}) as schedule_id,
    cast(null as {{ dbt.type_int() }}) as ticket_id
{% endif %}
