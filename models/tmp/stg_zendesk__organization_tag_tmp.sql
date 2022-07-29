--To disable this model, set the using_organization_tags variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_organization_tags', True)) }}

{{
    fivetran_utils.union_data(
        table_identifier='organization_tag',
        database_variable='zendesk_database',
        schema_variable='zendesk_schema',
        default_database=target.database,
        default_schema='zendesk_support',
        default_variable='organization_tag'
    )
}}
